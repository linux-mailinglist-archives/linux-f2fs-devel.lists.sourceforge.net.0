Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AEE70EECB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 May 2023 09:01:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q1iUf-0001rS-VD;
	Wed, 24 May 2023 07:01:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <miklos@szeredi.hu>) id 1q1iUc-0001rL-Ho
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 May 2023 07:01:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fAJTLElGGZ3FPpd+hHW9swqi8LLYODpFepxDuukKj48=; b=X2b1VTS8kwMtJgK8BsKHEhfzBa
 eSWByinQu2J0pI0C4PKnSkGvlTQ3aDP/aG10d92mCdLm7a2hJXn81a5Sf6oG56GTPxbZbeeoJK8JH
 NuO2ViC1DGF7rxi67dycQzv9KT85btMOfvO3rAT6ruIwoopPnXIq24SmUXJHJdua8400=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fAJTLElGGZ3FPpd+hHW9swqi8LLYODpFepxDuukKj48=; b=WxAEgnUaXahhZoETZ417whufMS
 T+PfrSfW5FNWTQiCT+41g0Lrwnkxe+J+8JyHGovJCJH0IuNEwwZaMmnL2utc2WHESskxmxJfNHLW8
 awmZCzf0aJ6IFglAR7fYSEIsID5ASromT/xzC07Q6jhILiVy1YbboI0FML7RkZpvpz8c=;
Received: from mail-ej1-f47.google.com ([209.85.218.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q1iUQ-0006HN-WA for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 May 2023 07:01:02 +0000
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-96aae59bbd6so83777266b.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 May 2023 00:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=szeredi.hu; s=google; t=1684911648; x=1687503648;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fAJTLElGGZ3FPpd+hHW9swqi8LLYODpFepxDuukKj48=;
 b=ELxBtF4o5IW55MyhAM6yTOMm6oDR+XkfJhvlX+7yzhV6yRAz+kRMFfkRCYja/6IwPZ
 FTcVNAUIhnZWWI9RB/TvnQRG99/ujJn+7EvSVb8go10F5ziPp4CLpuOynZN7aDG2iiKN
 FoJDD4skK5plrQNhXLERFN58xnfbYUu86ouco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684911648; x=1687503648;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fAJTLElGGZ3FPpd+hHW9swqi8LLYODpFepxDuukKj48=;
 b=OjPS1eNV/HdHr4e7z994vhbpPB7xdyd88dWZyqBHtLy5bxFCgZhgOABSuujw32o0BC
 k0DyAw8/rQTg3kO7tsvpqPQchC0ygkyzyeERSOJ94FQHEPdGVCRdoqsKR3047hHNWHCh
 5dM/cWWxFXWFCJpNjgZHoJ1EFKYgFFhG8JLUeGOX0oLp8CeZEMflg4cuqe5+p2aGe/7f
 /9f7FIewog51Hq3jI8Vp8ChupxqdRXiEMmwuewzdUbnF44iviQYKgF5d0J9N5itcpw7C
 nSBin0eIUXaEwelbcdPwf5LKEhtR8zBR40Vs3qab8+xbmgG0tbzPMptSPeng5R4zHwCr
 k95w==
X-Gm-Message-State: AC+VfDxyncEICndUjnuWlFF+SfJGZdbDWGDAtbn+CJhVf11JUe0WmRKN
 9NFAUPJtUbRF6d1Zil3yWgaiIgOJV5lKdO4H6ikF5FPQyLa1XWMf
X-Google-Smtp-Source: ACHHUZ7SlvMG5x2vt/jfLi6LwhlfmuAYckVadaRzR4fxt1kxZ/GcPnJE1sq8JdB2Ei2izIpvJDmtMpewdQCFFqShZGk=
X-Received: by 2002:a17:907:5ca:b0:94f:704d:a486 with SMTP id
 wg10-20020a17090705ca00b0094f704da486mr16846446ejb.32.1684911648375; Wed, 24
 May 2023 00:00:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230524063810.1595778-1-hch@lst.de>
 <20230524063810.1595778-10-hch@lst.de>
In-Reply-To: <20230524063810.1595778-10-hch@lst.de>
Date: Wed, 24 May 2023 09:00:36 +0200
Message-ID: <CAJfpeguT-LjhS-XrZwMystZqkxyB=HaON1zo-BTNOC0L1zCa1Q@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, 24 May 2023 at 08:38, Christoph Hellwig <hch@lst.de>
 wrote: > > Add a helper dealing with handling the syncing of a buffered write
 fallback > for direct I/O. > > Signed-off-by: Christoph Hellw [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.218.47 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.47 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q1iUQ-0006HN-WA
Subject: Re: [f2fs-dev] [PATCH 09/11] fs: factor out a direct_write_fallback
 helper
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
> Add a helper dealing with handling the syncing of a buffered write fallback
> for direct I/O.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/libfs.c         | 36 +++++++++++++++++++++++++
>  include/linux/fs.h |  2 ++
>  mm/filemap.c       | 66 +++++++++++-----------------------------------
>  3 files changed, 53 insertions(+), 51 deletions(-)
>
> diff --git a/fs/libfs.c b/fs/libfs.c
> index 89cf614a327158..ad37a49e2ecfb7 100644
> --- a/fs/libfs.c
> +++ b/fs/libfs.c
> @@ -1613,3 +1613,39 @@ u64 inode_query_iversion(struct inode *inode)
>         return cur >> I_VERSION_QUERIED_SHIFT;
>  }
>  EXPORT_SYMBOL(inode_query_iversion);
> +
> +ssize_t direct_write_fallback(struct kiocb *iocb, struct iov_iter *iter,
> +               ssize_t direct_written, ssize_t buffered_written)
> +{
> +       struct address_space *mapping = iocb->ki_filp->f_mapping;
> +       loff_t pos = iocb->ki_pos - buffered_written;
> +       loff_t end = iocb->ki_pos - 1;
> +       int err;
> +
> +       /*
> +        * If the buffered write fallback returned an error, we want to return
> +        * the number of bytes which were written by direct I/O, or the error
> +        * code if that was zero.
> +        *
> +        * Note that this differs from normal direct-io semantics, which will
> +        * return -EFOO even if some bytes were written.
> +        */
> +       if (unlikely(buffered_written < 0))
> +               return buffered_written;

Comment/code mismatch.   The comment says:

if (buffered_written < 0)
        return direct_written ?: buffered_written;

> +
> +       /*
> +        * We need to ensure that the page cache pages are written to disk and
> +        * invalidated to preserve the expected O_DIRECT semantics.
> +        */
> +       err = filemap_write_and_wait_range(mapping, pos, end);
> +       if (err < 0) {
> +               /*
> +                * We don't know how much we wrote, so just return the number of
> +                * bytes which were direct-written
> +                */
> +               return err;

Again comment/code mismatch.

Thanks,
Miklos


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
