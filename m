Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F88170EEFF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 May 2023 09:07:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q1ib5-0000jO-V9;
	Wed, 24 May 2023 07:07:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <miklos@szeredi.hu>) id 1q1ib3-0000jI-SS
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 May 2023 07:07:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q4naoP/v86EKmAo+u6ifRRW3QrLb6CXC2bVZOo7DIRg=; b=mOR3yAaYz8X8HhTffO2DcQ8ZpJ
 /Cce1Ibt40yy0utVDDtJPD9vXc74gcg7Gk7ldNl0USGYfBmYsvRsKy8OCecd6VvmkrviuVvX/iHSU
 cCnm+4/Ew/YX9it/Zuc4XnL7c4Q+t4y2uwkU+AfHnb5AwlxlWsinch9Z8kbhH4u9rXOU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=q4naoP/v86EKmAo+u6ifRRW3QrLb6CXC2bVZOo7DIRg=; b=hm9uB6v+gxFhkC9SCkmSZBHMt4
 mkfg+9jB2ajAuI+v06Yy29YLLyI7VdpCE6s+uV0cwrtyJ1zVM8ynDPW35+f5MrNFJHajPGZUugxT/
 sF9LqsPHYeScADYgDgNJ44IXmIIKE5ajImbfIx02lWTkfzv5Ulld3E4UyQ4ZNtCSqvmc=;
Received: from mail-ed1-f49.google.com ([209.85.208.49])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q1iay-0018pi-Ix for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 May 2023 07:07:46 +0000
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-510d9218506so1487871a12.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 May 2023 00:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=szeredi.hu; s=google; t=1684912054; x=1687504054;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=q4naoP/v86EKmAo+u6ifRRW3QrLb6CXC2bVZOo7DIRg=;
 b=CfBlFjin9AiglVZYNj73FBrJiDD1bgOexikX1Ibnhzpuzz+5EcbqenYVDEno0ACDa2
 djfaNXoukq6AOI2QGVjbJUY4tHB5nQ6aQa9Gdah0n42uhwzekGmDHDHIYrNrS1Zi1uq7
 d0cnXvOfRcG2l6Z3wViMElw5AIOQmwbbeQ2o0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684912054; x=1687504054;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q4naoP/v86EKmAo+u6ifRRW3QrLb6CXC2bVZOo7DIRg=;
 b=GQolK7+Nd89kGGqYYz4KZgsS6rUGv1PHO5f/0Rzv9WegNm1YbSYvv4QXWa0jeDAtSE
 7SmaEh5lmHojwjkC3ZlkfVYiKhTDLeQ7Z85XUJ7LXOgxhhov5nkWIcsbzyHmtNLAUWle
 70RRIwbxy0jpWq6iRNVpahV/ZfgKHmUjFobVexLiEGx0r/o0fTtybrV+gXcMlF3owGjX
 CjncPzcX1t8h6BHO8cY8jq9uHx+VkX74a4dPuppm7MnPTqEtw9AH43jAwnlsnUPfiF1f
 6HVR0dMENmPnNl4MsNyezVzsBy7HTroLbhLt3uKU81TvZ9U2OBDWLI2gu+gc4arNDN3G
 h/LQ==
X-Gm-Message-State: AC+VfDy9fdKbImIwKPFOWAMNTaU/LUe7X0vOY1XqAo/RTXVIvlUeO6is
 gtprZDldS+PjNZ+yybBpfT2kXGHgUXL9Qp3XTViwbA==
X-Google-Smtp-Source: ACHHUZ5nu5V36cLreoQ/PYoDJkXFfcE1oq2Gs17vr1i/RZvs/lgKVxpySwPaw/RHPAbV3ltDCF676sVzrLwNPZ6r1Lg=
X-Received: by 2002:a05:6402:2792:b0:50d:83d4:6174 with SMTP id
 b18-20020a056402279200b0050d83d46174mr1222660ede.12.1684912053956; Wed, 24
 May 2023 00:07:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230524063810.1595778-1-hch@lst.de>
 <20230524063810.1595778-11-hch@lst.de>
In-Reply-To: <20230524063810.1595778-11-hch@lst.de>
Date: Wed, 24 May 2023 09:07:22 +0200
Message-ID: <CAJfpeguxVXm2pDeNk9M_S_0+ing1dFstaCfB30WcTRCjwwsJvg@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, 24 May 2023 at 08:38, Christoph Hellwig <hch@lst.de>
 wrote: > > Both callers of fuse_perform_write need to updated ki_pos, move
 it into > common code. > > Signed-off-by: Christoph Hellwig <hch [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.49 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.49 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1q1iay-0018pi-Ix
Subject: Re: [f2fs-dev] [PATCH 10/11] fuse: update ki_pos in
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

On Wed, 24 May 2023 at 08:38, Christoph Hellwig <hch@lst.de> wrote:
>
> Both callers of fuse_perform_write need to updated ki_pos, move it into
> common code.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
> ---
>  fs/fuse/file.c | 25 +++++++++++--------------
>  1 file changed, 11 insertions(+), 14 deletions(-)
>
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index 97d435874b14aa..90d587a7bdf813 100644
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
> @@ -1375,41 +1378,35 @@ static ssize_t fuse_cache_write_iter(struct kiocb *iocb, struct iov_iter *from)
>                 goto out;
>
>         if (iocb->ki_flags & IOCB_DIRECT) {
> -               loff_t pos = iocb->ki_pos;
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
> +               endbyte = iocb->ki_pos + written_buffered - 1;

Wrong endpos.

>
> -               err = filemap_write_and_wait_range(file->f_mapping, pos,
> +               err = filemap_write_and_wait_range(file->f_mapping,
> +                                                  iocb->ki_pos,

Wrong startpos.

>                                                    endbyte);
>                 if (err)
>                         goto out;
>
>                 invalidate_mapping_pages(file->f_mapping,
> -                                        pos >> PAGE_SHIFT,
> +                                        iocb->ki_pos >> PAGE_SHIFT,

Same here.

>                                          endbyte >> PAGE_SHIFT);
>
>                 written += written_buffered;
> -               iocb->ki_pos = pos + written_buffered;
> +               iocb->ki_pos += written_buffered;

Already added in fuse_perform_write().

>         } else {
>                 written = fuse_perform_write(iocb, mapping, from, iocb->ki_pos);
> -               if (written >= 0)
> -                       iocb->ki_pos += written;
>         }
>  out:
>         inode_unlock(inode);
> -       if (written > 0)
> -               written = generic_write_sync(iocb, written);
> -
>         return written ? written : err;
>  }
>
> --
> 2.39.2
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
