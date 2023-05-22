Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E0B70C0E1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 May 2023 16:20:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q16OD-0004Zc-UN;
	Mon, 22 May 2023 14:19:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <miklos@szeredi.hu>) id 1q16OD-0004ZW-3p
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 May 2023 14:19:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VSL7mwwp7mP3i/A2Ha5ZWYNP2l8nV9xWCZ9dDdVJyrE=; b=LTRLrxKHIPubX4TLAgM3PZjayo
 76W0/ttqguujTf3hWyHX5YAIZxXCp9bXWpqt5X+XOBb7Qbqpf7QjzzS8yv5EZ/lLELGX+x2PzTgsP
 GDEYlb3dCgE9B4wn2niQNKiF/zszp58zb8+4GUzk2vbFkZtsLA/Dueoz/cHcLxcuwfco=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VSL7mwwp7mP3i/A2Ha5ZWYNP2l8nV9xWCZ9dDdVJyrE=; b=ZZzgrm6kr6I5xZwj8kcR2xPNQb
 gnTJSXGzyoViERT0kGX5+m9L/rjTh+6eMf2w+xQtwQmq8NyxErl+Paz/n4qlZSuf9Fx0A88lQuG/j
 9HSxyFfRJgIpHsDCqgQBhngSr8ozVS0hhg9GyuRSJbIp58RS6FqIfMhFAPKJAT6xdByY=;
Received: from mail-ej1-f52.google.com ([209.85.218.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q16OC-0005tM-C2 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 May 2023 14:19:57 +0000
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-96fe88cd2fcso203996566b.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 22 May 2023 07:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=szeredi.hu; s=google; t=1684765190; x=1687357190;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VSL7mwwp7mP3i/A2Ha5ZWYNP2l8nV9xWCZ9dDdVJyrE=;
 b=bW3JxzSWL903VRTFCHvbgK/kSmmhNGzjPmv2oTgKuUeY/4UGuj+rpVpSRqU0fLX71Z
 9x0WYxajpqEHWpasb3FMt2QPMwFvEXG1qzy09fFvoatRiySxfHmtlreAhXwdf72AH0EA
 uaD7yDQ7ocfBWwGajHKOT7vpFDgho5apenxJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684765190; x=1687357190;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VSL7mwwp7mP3i/A2Ha5ZWYNP2l8nV9xWCZ9dDdVJyrE=;
 b=d+B7fzT3Dpw9U304X97+Ntn85+u+1iqVHkU8qckU6730einnlRRGdeaac8JVzZxSdo
 BKxVQAWqaZ7240Fig3QkEs83QcjvJx7ad0ml7HlTKYiSlL10gyQsXpfHQH4S2FGU3YhB
 6l74H5Cx+l0icufEdGdVTBoc2k4NN/Mao1E2wv3jgwmmkI33poKEC8Uk/t3DeeZehLA7
 cFx8ECMwwkmxvFDsrFItlm75AvLKdrYGftHX4MncnibwrFpy81R25+6uHOg95BQQwVEk
 3nA3R6Erh+XlI6SRTAEbTPJ6A/7eVpgQD0P6PqZrgE+pDcH0h5uUA+YoMFyZq3Hj8xnp
 Ft5A==
X-Gm-Message-State: AC+VfDxS9cb++NAglCvBf9YJ7ofyaw0zG2bjVnsD34Hac3CuXukKvYaU
 9QzaLbJiAJHO3OYrui4VGSedSel1g5BZKw1K7FkB4A==
X-Google-Smtp-Source: ACHHUZ5pTZpoagrq7BPdRNACytZjcbnwwAzdd4/4F4mMBgFIR5olByJvr8DzGqhjgDPmmSOeMIBmAwCLlQut/WuHsuo=
X-Received: by 2002:a17:907:25c2:b0:969:edf8:f73b with SMTP id
 ae2-20020a17090725c200b00969edf8f73bmr9314077ejc.60.1684765189889; Mon, 22
 May 2023 07:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230519093521.133226-1-hch@lst.de>
 <20230519093521.133226-11-hch@lst.de>
In-Reply-To: <20230519093521.133226-11-hch@lst.de>
Date: Mon, 22 May 2023 16:19:38 +0200
Message-ID: <CAJfpegtHb4pA=1NBRzQJSub7B0HZqnvqsMNQmYYM-8L7PTQfvw@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, 19 May 2023 at 11:36, Christoph Hellwig <hch@lst.de>
 wrote: > > Add a helper dealing with handling the syncing of a buffered write
 fallback > for direct I/O. > > Signed-off-by: Christoph Hellw [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.52 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.52 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1q16OC-0005tM-C2
Subject: Re: [f2fs-dev] [PATCH 10/13] fs: factor out a direct_write_fallback
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
 Theodore Ts'o <tytso@mit.edu>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, 19 May 2023 at 11:36, Christoph Hellwig <hch@lst.de> wrote:
>
> Add a helper dealing with handling the syncing of a buffered write fallback
> for direct I/O.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/libfs.c         | 36 ++++++++++++++++++++++++++++
>  include/linux/fs.h |  2 ++
>  mm/filemap.c       | 59 ++++++++++------------------------------------
>  3 files changed, 50 insertions(+), 47 deletions(-)
>
> diff --git a/fs/libfs.c b/fs/libfs.c
> index 89cf614a327158..9f3791fc6e0715 100644
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
> +       loff_t pos = iocb->ki_pos, end;

At this point pos will point after the end of the buffered write (as
per earlier patches), yes?

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
> +
> +       /*
> +        * We need to ensure that the page cache pages are written to disk and
> +        * invalidated to preserve the expected O_DIRECT semantics.
> +        */
> +       end = pos + buffered_written - 1;

So this calculation is wrong.

AFAICS this affects later patches as well.

Thanks,
Miklos


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
