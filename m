Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 175C2717B67
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 May 2023 11:11:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q4Hrh-0008IE-6r;
	Wed, 31 May 2023 09:11:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <miklos@szeredi.hu>) id 1q4Hrf-0008I8-Li
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 May 2023 09:11:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ISkp7pEP+0sRQxyl+Kb79Eh0f1S6sp18TmXfWBaAyu4=; b=dLt8lO/CXV9PHU6sCxqPFYT5+D
 ClO02xyHR3X1UI0x1BlP6t1RLRfzW5QxsRodiT0NjGOhqGveE78cQCY4vb60O3E1fGk2ckzeoycAr
 q4MxLAIj0K2sB960Ex1q5GyYCy0k5NIA+XcFT6Kb0Z+BeQrCy6A/ptJl++XWr7fnDGIQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ISkp7pEP+0sRQxyl+Kb79Eh0f1S6sp18TmXfWBaAyu4=; b=LSR7MuPAi81bdU+uFLsLqVZy/2
 Rz1OAANVxiCFjVWsY+BjnkObHyZNnzTfn4jctjYD0vN+RsXTZhrqQQNB3ME0i/M9JIRl0lIEA6DXl
 tHDYSPTgY/B2H3nEIgYdITBrEQV2P9crpwotdR6tIX5GSla0TPJF8NYowbmOpB415n5M=;
Received: from mail-ed1-f42.google.com ([209.85.208.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q4Hrf-0001Vw-SK for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 May 2023 09:11:32 +0000
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5149e65c244so4582622a12.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 31 May 2023 02:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=szeredi.hu; s=google; t=1685524285; x=1688116285;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ISkp7pEP+0sRQxyl+Kb79Eh0f1S6sp18TmXfWBaAyu4=;
 b=dJOv9q/YK0iEqQ5zNLLe/oNHi3RAcMruLF/Ly97IM4UKyWQ6BU0vbwmy5XObs9rKiq
 L78AyjiMCnhu3YMlQcCsm1FY9ZM34qzmrdOcgBgszstMUHq1IAxUroiCHjwKUuIt+D8H
 mBFmnCmCovFiFJD1nOdBlhjqUIi/4hrYsHPew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685524285; x=1688116285;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ISkp7pEP+0sRQxyl+Kb79Eh0f1S6sp18TmXfWBaAyu4=;
 b=ONnRVFKH6If/yfiUeqEq7BZn4H4wXMDjvQYoti2OZ1tMHRXyo3YVyeHvxFj/q8mq+t
 Hu3pje3Ay0u1aBYdvjfC0CJG/ay52OiTIE1+TYCjZdYpaXjE9rfpv6ObO3zrjQVfw76F
 wFmQ6VU0X778e8vp08QhpEyb3mhhL/z2g7cYG61L1KP6aP2KSqHOj+IRN2CklPr+Be1P
 1uMOkmGUOvGP9yGXqnMOW3DF5sMrjXlvKwTOU4zvc+eKEWbuOxToz4XdWgKiQN79p7DK
 HdGdUNSADYxI6bNzYCjZSgrAUe+aHLaBqhpfKmRvu7d2DcXpF9dLQtLOnLqtuvXa0BVr
 dyFw==
X-Gm-Message-State: AC+VfDyoyjuuTWHxZtAQ9NuncJuKBPgdfxWtXqugGIRka5MOnI8ITD5Q
 bprJETm+1/hzlHEjCcvJmMbS0yFkW8JANkNxYQAAgw==
X-Google-Smtp-Source: ACHHUZ7qS7TmWM4+gPdkrDhL0bqZjnQfi2Xy2fkSny6o4W3m4Wn8XiF4R2Jdbdnsml8nAyt9sFK0bEVdcGYNFEZCdMs=
X-Received: by 2002:a17:907:7f23:b0:969:9fd0:7ce7 with SMTP id
 qf35-20020a1709077f2300b009699fd07ce7mr5700403ejc.11.1685524285339; Wed, 31
 May 2023 02:11:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230531075026.480237-1-hch@lst.de>
 <20230531075026.480237-11-hch@lst.de>
In-Reply-To: <20230531075026.480237-11-hch@lst.de>
Date: Wed, 31 May 2023 11:11:13 +0200
Message-ID: <CAJfpegth2z06pAH5K5vxRsy1PqygBD=ShiQxoYGqjmJPvk1-aQ@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, 31 May 2023 at 09:51, Christoph Hellwig <hch@lst.de>
 wrote: > > Both callers of fuse_perform_write need to updated ki_pos, move
 it into > common code. > > Signed-off-by: Christoph Hellwig <hch [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.42 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.42 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1q4Hrf-0001Vw-SK
Subject: Re: [f2fs-dev] [PATCH 10/12] fuse: update ki_pos in
 fuse_perform_write
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
From: Miklos Szeredi via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Miklos Szeredi <miklos@szeredi.hu>
Cc: "Darrick J. Wong" <djwong@kernel.org>, linux-mm@kvack.org,
 Andreas Gruenbacher <agruenba@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Damien Le Moal <dlemoal@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
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

On Wed, 31 May 2023 at 09:51, Christoph Hellwig <hch@lst.de> wrote:
>
> Both callers of fuse_perform_write need to updated ki_pos, move it into
> common code.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
> ---
>  fs/fuse/file.c | 23 ++++++++++-------------
>  1 file changed, 10 insertions(+), 13 deletions(-)
>
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index 97d435874b14aa..e60e48bf392d49 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -1329,7 +1329,10 @@ static ssize_t fuse_perform_write(struct kiocb *iocb,
>         fuse_write_update_attr(inode, pos, res);
>         clear_bit(FUSE_I_SIZE_UNSTABLE, &fi->state);
>
> -       return res > 0 ? res : err;
> +       if (!res)
> +               return err;
> +       iocb->ki_pos += res;
> +       return res;
>  }
>
>  static ssize_t fuse_cache_write_iter(struct kiocb *iocb, struct iov_iter *from)
> @@ -1341,7 +1344,6 @@ static ssize_t fuse_cache_write_iter(struct kiocb *iocb, struct iov_iter *from)
>         struct inode *inode = mapping->host;
>         ssize_t err;
>         struct fuse_conn *fc = get_fuse_conn(inode);
> -       loff_t endbyte = 0;
>
>         if (fc->writeback_cache) {
>                 /* Update size (EOF optimization) and mode (SUID clearing) */
> @@ -1375,19 +1377,20 @@ static ssize_t fuse_cache_write_iter(struct kiocb *iocb, struct iov_iter *from)
>                 goto out;
>
>         if (iocb->ki_flags & IOCB_DIRECT) {
> -               loff_t pos = iocb->ki_pos;
> +               loff_t pos, endbyte;
> +
>                 written = generic_file_direct_write(iocb, from);
>                 if (written < 0 || !iov_iter_count(from))
>                         goto out;
>
> -               pos += written;
> -
> -               written_buffered = fuse_perform_write(iocb, mapping, from, pos);
> +               written_buffered = fuse_perform_write(iocb, mapping, from,
> +                                                     iocb->ki_pos);
>                 if (written_buffered < 0) {
>                         err = written_buffered;
>                         goto out;
>                 }
> -               endbyte = pos + written_buffered - 1;
> +               pos = iocb->ki_pos - written_buffered;
> +               endbyte = iocb->ki_pos - 1;
>
>                 err = filemap_write_and_wait_range(file->f_mapping, pos,
>                                                    endbyte);
> @@ -1399,17 +1402,11 @@ static ssize_t fuse_cache_write_iter(struct kiocb *iocb, struct iov_iter *from)
>                                          endbyte >> PAGE_SHIFT);
>
>                 written += written_buffered;
> -               iocb->ki_pos = pos + written_buffered;
>         } else {
>                 written = fuse_perform_write(iocb, mapping, from, iocb->ki_pos);
> -               if (written >= 0)
> -                       iocb->ki_pos += written;
>         }
>  out:
>         inode_unlock(inode);
> -       if (written > 0)
> -               written = generic_write_sync(iocb, written);

Why remove generic_write_sync()?  Definitely doesn't belong in this
patch even if there's a good reason.

Sorry, didn't notice this in the last round.

Thanks,
Miklos


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
