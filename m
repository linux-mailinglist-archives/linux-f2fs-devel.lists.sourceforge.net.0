Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E37978A133
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 27 Aug 2023 21:42:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qaLe9-0000aY-D9;
	Sun, 27 Aug 2023 19:42:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <viro@ftp.linux.org.uk>) id 1qaLe6-0000aR-Dv
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 27 Aug 2023 19:42:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=684ZmibV0iRA7W1nKgqEgsL3aMIsGcfp6Zpl3WdJ4DU=; b=BEi8ZpQ/3od9+jjpaQ5rdXNDdv
 ddWGc+R+BSQJfT9pR2KY71Wbhsdu1K3i5i2DKDF1Y+Pcia18B2VpMVjF+N52tRB9agVYFaCGVAQMU
 ugtzrewVfylNspcpUEhhNQrxOhLW7ulyJ7u/m4YBl3IoRfqic0YBReYue/ePE8PlT90M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=684ZmibV0iRA7W1nKgqEgsL3aMIsGcfp6Zpl3WdJ4DU=; b=jxcTBPTsKEfDMCXMygxvJ6wc7d
 Q5RtytPosR/ZR8Jw0CnkUwzSimBH1eCK1+fXk+tcYK3J+nye6gF+vHEyC0jIw0jCQe6eXNZzkgwHb
 2rzQNZjNgAGwfirGFndGeEt8PALfu8uD6ERsgOuUlqbhL2i+04mHnw5ylVX4pwY2meY4=;
Received: from zeniv.linux.org.uk ([62.89.141.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qaLe3-0001Ix-AQ for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 27 Aug 2023 19:42:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=684ZmibV0iRA7W1nKgqEgsL3aMIsGcfp6Zpl3WdJ4DU=; b=MC2inegbdk323giCAEH+EfdYar
 4kXwfSwyy2upf/dK+53+T+qrKyewF5s7dkck4Fy8HiN43ivhIJelmFUnVBY8gTnpZi1xWKTWuXIKw
 PMxisq0e3KNF97DWVe6B6NWvtgyUOe2N5H03vNuXGmN7U3J3s/iHPYzfZnHTYEtijbR38gB7y6yM+
 f7ACCYsTkBZjsnjijsZxvBLbNGKP/mTU09fHGjxl78/It44EuuASOQ2dnSIavl4Uy9jNvEkCB6Mv6
 wSB2x3czu7lrhAFvslc5eM2xpF0ak84dfAdNaJZPWXabaeFkiWOblNYIYyhnd8Q9EJERXc2PyYNn0
 cSxlywzw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qaLdS-001NqG-1T; Sun, 27 Aug 2023 19:41:22 +0000
Date: Sun, 27 Aug 2023 20:41:22 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20230827194122.GA325446@ZenIV>
References: <20230601145904.1385409-1-hch@lst.de>
 <20230601145904.1385409-4-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230601145904.1385409-4-hch@lst.de>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jun 01, 2023 at 04:58:55PM +0200, Christoph Hellwig
 wrote: > All callers of generic_perform_write need to updated ki_pos, move
 it into > common code. > @@ -4034, 7 +4037,
 6 @@ ssize_t __generic_file_write_iter(struct
 kiocb *iocb, struct iov_iter *from) > endbyte = pos + status - 1; > err =
 filemap_write_and_wait_range(mapping, pos, endbyte); > if (er [...] 
 Content analysis details:   (-0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1qaLe3-0001Ix-AQ
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

On Thu, Jun 01, 2023 at 04:58:55PM +0200, Christoph Hellwig wrote:
> All callers of generic_perform_write need to updated ki_pos, move it into
> common code.

> @@ -4034,7 +4037,6 @@ ssize_t __generic_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  		endbyte = pos + status - 1;
>  		err = filemap_write_and_wait_range(mapping, pos, endbyte);
>  		if (err == 0) {
> -			iocb->ki_pos = endbyte + 1;
>  			written += status;
>  			invalidate_mapping_pages(mapping,
>  						 pos >> PAGE_SHIFT,
> @@ -4047,8 +4049,6 @@ ssize_t __generic_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  		}
>  	} else {
>  		written = generic_perform_write(iocb, from);
> -		if (likely(written > 0))
> -			iocb->ki_pos += written;
>  	}
>  out:
>  	return written ? written : err;

[another late reply, sorry]

That part is somewhat fishy - there's a case where you return a positive value
and advance ->ki_pos by more than that amount.  I really wonder if all callers
of ->write_iter() are OK with that.  Consider e.g. this:

ssize_t ksys_write(unsigned int fd, const char __user *buf, size_t count)
{
        struct fd f = fdget_pos(fd);
        ssize_t ret = -EBADF;

        if (f.file) {
                loff_t pos, *ppos = file_ppos(f.file);
                if (ppos) {
                        pos = *ppos;   
                        ppos = &pos;
                }
                ret = vfs_write(f.file, buf, count, ppos);
                if (ret >= 0 && ppos)
                        f.file->f_pos = pos;
                fdput_pos(f);
        }

        return ret;
}

ssize_t vfs_write(struct file *file, const char __user *buf, size_t count, loff_t *pos)
{
        ssize_t ret;

        if (!(file->f_mode & FMODE_WRITE))
                return -EBADF;
        if (!(file->f_mode & FMODE_CAN_WRITE))
                return -EINVAL;
        if (unlikely(!access_ok(buf, count)))
                return -EFAULT;

        ret = rw_verify_area(WRITE, file, pos, count);
        if (ret)
                return ret;
        if (count > MAX_RW_COUNT)
                count =  MAX_RW_COUNT;
        file_start_write(file);
        if (file->f_op->write)
                ret = file->f_op->write(file, buf, count, pos);
        else if (file->f_op->write_iter)
                ret = new_sync_write(file, buf, count, pos);
        else   
                ret = -EINVAL;
        if (ret > 0) {
                fsnotify_modify(file);
                add_wchar(current, ret);
        }
        inc_syscw(current);
        file_end_write(file);
        return ret;
}

static ssize_t new_sync_write(struct file *filp, const char __user *buf, size_t len, loff_t *ppos)
{
        struct kiocb kiocb;
        struct iov_iter iter;
        ssize_t ret; 

        init_sync_kiocb(&kiocb, filp);
        kiocb.ki_pos = (ppos ? *ppos : 0);
        iov_iter_ubuf(&iter, ITER_SOURCE, (void __user *)buf, len);

        ret = call_write_iter(filp, &kiocb, &iter);
        BUG_ON(ret == -EIOCBQUEUED);
        if (ret > 0 && ppos)
                *ppos = kiocb.ki_pos;
        return ret;
} 

Suppose ->write_iter() ends up doing returning a positive value smaller than
the increment of kiocb.ki_pos.  What do we get?  ret is positive, so
kiocb.ki_pos gets copied into *ppos, which is ksys_write's pos and there
we copy it into file->f_pos.

Is it really OK to have write() return 4096 and advance the file position
by 16K?  AFAICS, userland wouldn't get any indication of something
odd going on - just a short write to a regular file, with followup write
of remaining 12K getting quietly written in the range 16K..28K.

I don't remember what POSIX says about that, but it would qualify as
nasty surprise for any userland program - sure, one can check fsync()
results before closing the sucker and see if everything looks fine,
but the way it's usually discussed could easily lead to assumption that
(synchronous) O_DIRECT writes would not be affected by anything of that
sort.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
