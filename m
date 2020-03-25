Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF76192B6A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Mar 2020 15:43:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jH7Fn-0002oo-4Z; Wed, 25 Mar 2020 14:43:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <miklos@szeredi.hu>) id 1jH7Fg-0002oX-2X
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Mar 2020 14:43:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BYoi0GgKGrZ5Iy05aE5oc1zP5UUaQTjapju/izAR4hI=; b=DZoh8udhkfm9SU249PU2X+Rs1I
 z3k7m0+AUOqrP5235XptlAWyBFn/62J/ye8UkCLyQ7/G5XrteezC2HP6474fK1IR3U/KsEOeb0MKA
 8Qk3laGYsYbHgh3sPw6ibKz56sqUDMXNFNXmGSDJlNQvcNd5ZOyoUSZRWptQkiRKXKB8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BYoi0GgKGrZ5Iy05aE5oc1zP5UUaQTjapju/izAR4hI=; b=dmBxTnCifvpOGbOzNyk8FVHXli
 ptWNCbKVzGm3kxNrqZWTdf7WDGoGQeLjiY14TT3hvGfEBECoP27CnbHXR8SSm16UobpkJZ5g0dxh/
 8mj7liFs8mLqV3Jj1pp6HZbeUf92vmA+xwxHVYNZYmUGqWScD52MJOCbtgI1QshNdyUY=;
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jH7FY-00GVBf-Cu
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Mar 2020 14:43:28 +0000
Received: by mail-io1-f67.google.com with SMTP id k9so2456494iov.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 Mar 2020 07:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szeredi.hu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BYoi0GgKGrZ5Iy05aE5oc1zP5UUaQTjapju/izAR4hI=;
 b=YUccMzib2IwajwEuyLBHygiEi2x+yWevlxfsequqpaIt/Mza/TxUmFkitS3U4FkfKx
 P1XwXxBJ8Cx5HEmhYoBLdWFHhmr6xou5YR2utppkELKcqyaDd4EOavtJNBW3boLnPkzx
 WgZmdQ9YRsyheNZWEZrba/miSYKYdDAaziYyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BYoi0GgKGrZ5Iy05aE5oc1zP5UUaQTjapju/izAR4hI=;
 b=j2+2mkKBVFJB2Yu8ffV+XEZdJhzRNT7Jbroodf5SnzZVEvB28ABg9ff7pEf0pfRgWj
 aJKlNiPDp0Gj12wlw+uSLKSbjybAtxX837Rs6KM42wCnltkATwdbhGSsMQoAjSVGb2nc
 1rJluuqmJ809aUbbhLRcVZOmZ6wTLDU5QGnBJXUp0Dk9zePT/fzfYACMN12/Rn2dwfqX
 2mWDFqjp8CJ1Lhx6/fGznKoOA3d7M5VQeU6PZ3hOwb3ah6T+8gkwZ6mRwSrDloshRtmq
 DizvfL76DZRjtWhJHTG8iKr1IpmHUaNFpmpI1i7ZeYHNvsGnVPap+kBLE5CYppdcULOA
 iFrA==
X-Gm-Message-State: ANhLgQ3rqgiVcmp0+eJ12pURxoD72n0Ol04zdg0VSWivDCThnqCf3xRh
 ACfg2l2bXiePdxKxRztA47bq+i693tQbXxG85oSwsA==
X-Google-Smtp-Source: ADFU+vsgMMqodCZqPGFNfCT+HdNRTtLLlUdy5AMnDcVBoatxWj+vZY48emoAVNd+HvHliFjTkg/kdF6pmkOGcZxuC6s=
X-Received: by 2002:a6b:3a07:: with SMTP id h7mr3235359ioa.191.1585147393572; 
 Wed, 25 Mar 2020 07:43:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200323202259.13363-1-willy@infradead.org>
 <20200323202259.13363-25-willy@infradead.org>
 <CAJfpegu7EFcWrg3bP+-2BX_kb52RrzBCo_U3QKYzUkZfe4EjDA@mail.gmail.com>
 <20200325120254.GA22483@bombadil.infradead.org>
In-Reply-To: <20200325120254.GA22483@bombadil.infradead.org>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 25 Mar 2020 15:43:02 +0100
Message-ID: <CAJfpegshssCJiA8PBcq2XvBj3mR8dufHb0zWRFvvKKv82VQYsw@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.67 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.67 listed in wl.mailspike.net]
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jH7FY-00GVBf-Cu
Subject: Re: [f2fs-dev] [PATCH v10 24/25] fuse: Convert from readpages to
 readahead
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
Cc: linux-xfs <linux-xfs@vger.kernel.org>,
 William Kucharski <william.kucharski@oracle.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
 Dave Chinner <dchinner@redhat.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Mar 25, 2020 at 1:02 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Wed, Mar 25, 2020 at 10:42:56AM +0100, Miklos Szeredi wrote:
> > > +       while ((page = readahead_page(rac))) {
> > > +               if (fuse_readpages_fill(&data, page) != 0)
> >
> > Shouldn't this unlock + put page on error?
>
> We're certainly inconsistent between the two error exits from
> fuse_readpages_fill().  But I think we can simplify the whole thing
> ... how does this look to you?

Nice, overall.

>
> -       while ((page = readahead_page(rac))) {
> -               if (fuse_readpages_fill(&data, page) != 0)
> +               nr_pages = min(readahead_count(rac), fc->max_pages);

Missing fc->max_read clamp.

> +               ia = fuse_io_alloc(NULL, nr_pages);
> +               if (!ia)
>                         return;
> +               ap = &ia->ap;
> +               __readahead_batch(rac, ap->pages, nr_pages);

nr_pages = __readahead_batch(...)?

This will give consecutive pages, right?

Thanks,
Miklos


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
