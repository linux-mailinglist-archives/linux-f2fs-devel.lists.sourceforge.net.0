Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D92B8717B09
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 May 2023 11:02:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q4Hiv-0007u9-L5;
	Wed, 31 May 2023 09:02:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <miklos@szeredi.hu>) id 1q4Hiu-0007u1-0T
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 May 2023 09:02:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=82U6bUpm6YFNkGK5cbhaAjWwDgpxY2X/ujFBNt1W6jk=; b=e6hWdAgWF94qcOw9HXBLgEU23c
 RRRAx36/qDi18Aj6p9GS9KrdLpWUZkhdOLv0bgPno4XQli/dNaXMVhAIRJIGf4/YO7FJAe5sp2ma9
 L7yHAkMIkmYvpW/QlLI+GT7zlxDeTtrRnhtvtz1Hw8QkeTVoCrki7KoN3Dr+NxWF6x3A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=82U6bUpm6YFNkGK5cbhaAjWwDgpxY2X/ujFBNt1W6jk=; b=g33ExuZBdjEUis3klVOwP4nYMZ
 IVF+6Fw35kC7FyN9F2P5vV3d669/cVPxedpAB5jf7nE0mL+KAL6AhLUVs+ZrVyd7TmBtugubPBHK9
 wiOofi5bAwYHvT6o5weuXCw4c0ylJ8q2cd0SepSjiTq31Y6UPWXcosMHIZHBsJE4XWtc=;
Received: from mail-ed1-f52.google.com ([209.85.208.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q4Hij-00019s-B9 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 May 2023 09:02:27 +0000
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-5149b63151aso5775234a12.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 31 May 2023 02:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=szeredi.hu; s=google; t=1685523731; x=1688115731;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=82U6bUpm6YFNkGK5cbhaAjWwDgpxY2X/ujFBNt1W6jk=;
 b=A6KOMI+ewwQr8qcLpuyi659zu4D/Uwm4Riu4JCnMaYPF83lGbGHbPte+JTqL0ejSbq
 VHzPX/zoWMZKPg2ZijvaZZzouWRkcsu1Cq500nIEn8quQkOQ7DmDMJl9uUNWolomxRq+
 JLd/2jXH1F0vLqowGSqxr2lrm4n1twnt6EDhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685523731; x=1688115731;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=82U6bUpm6YFNkGK5cbhaAjWwDgpxY2X/ujFBNt1W6jk=;
 b=S+oNwxNorGTxrXQjWlfEJLJ+Wuf72iWIcZbcdZoNjfCL2HD8BWB7mmf0YJGPAQrBWv
 K+KFe6K4fbOhHF6Hkig9QpPUhTt/b9mhP29Sl37V8P4PCtYNUUI511k66lhQmly2Fupo
 EIuPDB107d2DmPKEpUYg+hhQwWYhFsRu/DONJ1s7sBgAQcF0f4Tk4jz4DehtpkCA6CqN
 9ut6ZzcL354ruFakMXVsM4c1TCSuMVPLGEsS/W8Ai3pJ7AZ/mWLipDx2vzQ5XTHerNgB
 DHoc8LELPfs+JpjqGKRfX9El3lqYv6ZiIutxq6Fjmkv4hi6AbV9oNO8qyK2j7hn3Bv11
 dy9g==
X-Gm-Message-State: AC+VfDxgTAK0IiJtBqlBlLC2UvJvBxxsP6I0rvltjCYOQDXh7//DRXdN
 78MOu2w0xbyJFcUibxwv/cw/FHmXO/Njsxjso3rrqA==
X-Google-Smtp-Source: ACHHUZ54ruSZ4ErYRXWiU9UTWeerJcU9a8S+taczm8RKgsna09cTe6RnnExPREASsZbWk52M7ju665X7rMMjOFwIvBg=
X-Received: by 2002:a17:907:3f0d:b0:966:634d:9d84 with SMTP id
 hq13-20020a1709073f0d00b00966634d9d84mr5472507ejc.20.1685523730877; Wed, 31
 May 2023 02:02:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230531075026.480237-1-hch@lst.de>
 <20230531075026.480237-13-hch@lst.de>
In-Reply-To: <20230531075026.480237-13-hch@lst.de>
Date: Wed, 31 May 2023 11:01:59 +0200
Message-ID: <CAJfpegutmdRtz1gPyX7MjrgqP-2186sCxtUiANO=8+EdnrLHrg@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, 31 May 2023 at 09:51, Christoph Hellwig <hch@lst.de>
 wrote: > > Use the generic direct_write_fallback helper instead of duplicating
 the > logic. > > Signed-off-by: Christoph Hellwig <hch@lst.d [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.52 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.52 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1q4Hij-00019s-B9
Subject: Re: [f2fs-dev] [PATCH 12/12] fuse: use direct_write_fallback
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
> Use the generic direct_write_fallback helper instead of duplicating the
> logic.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
> ---
>  fs/fuse/file.c | 24 ++----------------------
>  1 file changed, 2 insertions(+), 22 deletions(-)
>
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index 025973ad813e05..7a72dc0a691201 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -1340,7 +1340,6 @@ static ssize_t fuse_cache_write_iter(struct kiocb *iocb, struct iov_iter *from)
>         struct file *file = iocb->ki_filp;
>         struct address_space *mapping = file->f_mapping;
>         ssize_t written = 0;
> -       ssize_t written_buffered = 0;
>         struct inode *inode = mapping->host;
>         ssize_t err;
>         struct fuse_conn *fc = get_fuse_conn(inode);
> @@ -1377,30 +1376,11 @@ static ssize_t fuse_cache_write_iter(struct kiocb *iocb, struct iov_iter *from)
>                 goto out;
>
>         if (iocb->ki_flags & IOCB_DIRECT) {
> -               loff_t pos, endbyte;
> -
>                 written = generic_file_direct_write(iocb, from);
>                 if (written < 0 || !iov_iter_count(from))
>                         goto out;
> -
> -               written_buffered = fuse_perform_write(iocb, from);
> -               if (written_buffered < 0) {
> -                       err = written_buffered;
> -                       goto out;
> -               }
> -               pos = iocb->ki_pos - written_buffered;
> -               endbyte = iocb->ki_pos - 1;
> -
> -               err = filemap_write_and_wait_range(file->f_mapping, pos,
> -                                                  endbyte);
> -               if (err)
> -                       goto out;
> -
> -               invalidate_mapping_pages(file->f_mapping,
> -                                        pos >> PAGE_SHIFT,
> -                                        endbyte >> PAGE_SHIFT);
> -
> -               written += written_buffered;
> +               written = direct_write_fallback(iocb, from, written,
> +                               generic_perform_write(iocb, from));

This should use fuse_perform_write().

Last version of the patch was correct; copy-paste error?

Thanks,
Miklos


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
