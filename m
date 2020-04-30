Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E084B1C0A1F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 May 2020 00:10:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jUHO7-0002yP-Pi; Thu, 30 Apr 2020 22:10:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <andreas.gruenbacher@gmail.com>)
 id 1jUHO6-0002y3-A7; Thu, 30 Apr 2020 22:10:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2ET+MOiHcfDMgOrMdmamXFlGdEeR/f0vqWkjUxmdClw=; b=TYExg8DGous7QNWOUy9GozVgYU
 +A1F/0Ey1RRBaOFyg68eE2gg5sDXYFfns5Gw//T3fb7Zi+OgeFGuoM1f4INPVtQ8CeWrynuCxfeTN
 zsvENvdmxYGvPWC1gkPuMFNZZ/62NV+xxHnrWCrST4xNtsaa8Ym2ObjyePI0q0HIkgyA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2ET+MOiHcfDMgOrMdmamXFlGdEeR/f0vqWkjUxmdClw=; b=hH5Uc2X/7syX+5zzypeJQCIPI4
 B00QdVmdHusNI0HcievEX1UB2GUjlCKd28QC3i0LZw/BqMWfeKGawL9tpphWb4T64NEENOliwQd7S
 Dh+G3xQZleo8ff7JmspfONF3GGlmkbvhnmBL0LuFUiTWHa8KOyGYh8vCdxLLCSXJqCQo=;
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jUHO4-005ohL-Vn; Thu, 30 Apr 2020 22:10:34 +0000
Received: by mail-il1-f193.google.com with SMTP id t12so2898683ile.9;
 Thu, 30 Apr 2020 15:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2ET+MOiHcfDMgOrMdmamXFlGdEeR/f0vqWkjUxmdClw=;
 b=DEPtrDBeYCAoQ0fIRW9vAO9AKdIBDd19yOKxqpCf33m+D4aDmFK0jWp2gDkDUfLIF3
 a0RiY8WUBuL/OywF0Sfe7Mw+U8PZHBrvRLi/cWr1L1zS3KXtS0LME1w+kYJIPn7rausY
 nZhWTdF599LEhKufQQYjD1zsGEBgcBeH3K1sOcIdbr8EtnqnwRv4/l6hVhEMsdoJUqpk
 XjIQpgLOLavv3PmRpNfqyxxh4+hksm0y3AwKeb0sOmtqDJXCcblH+SeQl3NWtKJFZ0bP
 L4LI0dNHCatdsYd8Gkx8mfgs4X1yi/Bli1OkCGFhW4U70l4V5687nZe5sfnbXXVoZr1N
 GG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2ET+MOiHcfDMgOrMdmamXFlGdEeR/f0vqWkjUxmdClw=;
 b=QVk8eZBi4PYXF6ZDyDCPLLSbXFslUMzk1itkfCVDU7YiR/uI+JLd0A5MqydD8uY1zE
 tzvrl5K6cK90IzyOBXPMDiBpesUVw1GcsuRHpa5EmvVGapHP92EfP1VDHqOTiNrGqEFM
 H036EVdepds56EoDFgneatFtX/7xtbIzrpvopbSsE1fJmImIewEmn2u6ZTbwj0G5bWhj
 Te1fnzV/39B5nt/dwPntPkc+xpR3Oz5xlDU07Sgw4YYnZoTncteD+ET9P3YFyIcWoIfE
 CSRZlZpYgYxLufDFIa4hlnxxQNZXZUbNo7iEGBsil8iU222mDGIh6Qcjd9SBVXBUBOkk
 m4AA==
X-Gm-Message-State: AGi0PuZ/txuYFoA3CERTEYMUqKyd2hzZ5NHXN5G4EahlZShtzu2WcA1m
 M3OK88FSNLmR01Kb5A08qM4PHrMvq6k3C9/g3Kw=
X-Google-Smtp-Source: APiQypJJdXHu9wsfILyXAYVgqjt8UsMKQuE8/0rB4pSAfnWGHEsBd9R1cDbXdgQq9K8UTJgqdLieT21my6+JZOjxZdE=
X-Received: by 2002:a92:9e0b:: with SMTP id q11mr601506ili.133.1588284626957; 
 Thu, 30 Apr 2020 15:10:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200430214450.10662-1-guoqing.jiang@cloud.ionos.com>
 <20200430214450.10662-2-guoqing.jiang@cloud.ionos.com>
In-Reply-To: <20200430214450.10662-2-guoqing.jiang@cloud.ionos.com>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Fri, 1 May 2020 00:10:15 +0200
Message-ID: <CAHpGcMKdzSBGZTRwuoBTuCFUX44egmutvCr9LcjYW7KpWxmhHA@mail.gmail.com>
To: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: tuxera.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.193 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (andreas.gruenbacher[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jUHO4-005ohL-Vn
Subject: Re: [f2fs-dev] [RFC PATCH V2 1/9] include/linux/pagemap.h:
 introduce attach/clear_page_private
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
Cc: Martin Brandenburg <martin@omnibond.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Dave Chinner <david@fromorbit.com>, Song Liu <song@kernel.org>,
 Yafang Shao <laoar.shao@gmail.com>, Mike Marshall <hubcap@omnibond.com>,
 Andreas Gruenbacher <agruenba@redhat.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, Chris Mason <clm@fb.com>,
 willy@infradead.org, Christoph Hellwig <hch@infradead.org>,
 devel@lists.orangefs.org, Josef Bacik <josef@toxicpanda.com>,
 linux-raid@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Anton Altaparmakov <anton@tuxera.com>,
 Andreas Dilger <adilger@dilger.ca>, Yang Shi <yang.shi@linux.alibaba.com>,
 William Kucharski <william.kucharski@oracle.com>,
 linux-ntfs-dev@lists.sourceforge.net,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs <linux-xfs@vger.kernel.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Roman Gushchin <guro@fb.com>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

Am Do., 30. Apr. 2020 um 23:56 Uhr schrieb Guoqing Jiang
<guoqing.jiang@cloud.ionos.com>:
> The logic in attach_page_buffers and  __clear_page_buffers are quite
> paired, but
>
> 1. they are located in different files.
>
> 2. attach_page_buffers is implemented in buffer_head.h, so it could be
>    used by other files. But __clear_page_buffers is static function in
>    buffer.c and other potential users can't call the function, md-bitmap
>    even copied the function.
>
> So, introduce the new attach/clear_page_private to replace them. With
> the new pair of function, we will remove the usage of attach_page_buffers
> and  __clear_page_buffers in next patches. Thanks for the new names from
> Christoph Hellwig.
>
> Suggested-by: Matthew Wilcox <willy@infradead.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: "Darrick J. Wong" <darrick.wong@oracle.com>
> Cc: William Kucharski <william.kucharski@oracle.com>
> Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> Cc: Andreas Gruenbacher <agruenba@redhat.com>
> Cc: Yang Shi <yang.shi@linux.alibaba.com>
> Cc: Yafang Shao <laoar.shao@gmail.com>
> Cc: Song Liu <song@kernel.org>
> Cc: linux-raid@vger.kernel.org
> Cc: Chris Mason <clm@fb.com>
> Cc: Josef Bacik <josef@toxicpanda.com>
> Cc: David Sterba <dsterba@suse.com>
> Cc: linux-btrfs@vger.kernel.org
> Cc: Alexander Viro <viro@zeniv.linux.org.uk>
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Cc: Chao Yu <chao@kernel.org>
> Cc: linux-f2fs-devel@lists.sourceforge.net
> Cc: Christoph Hellwig <hch@infradead.org>
> Cc: linux-xfs@vger.kernel.org
> Cc: Anton Altaparmakov <anton@tuxera.com>
> Cc: linux-ntfs-dev@lists.sourceforge.net
> Cc: Mike Marshall <hubcap@omnibond.com>
> Cc: Martin Brandenburg <martin@omnibond.com>
> Cc: devel@lists.orangefs.org
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Cc: Roman Gushchin <guro@fb.com>
> Cc: Andreas Dilger <adilger@dilger.ca>
> Signed-off-by: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
> ---
> RFC -> RFC V2:  Address the comments from Christoph Hellwig
> 1. change function names to attach/clear_page_private and add comments.
> 2. change the return type of attach_page_private.
>
>  include/linux/pagemap.h | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>
> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> index a8f7bd8ea1c6..2e515f210b18 100644
> --- a/include/linux/pagemap.h
> +++ b/include/linux/pagemap.h
> @@ -205,6 +205,41 @@ static inline int page_cache_add_speculative(struct page *page, int count)
>         return __page_cache_add_speculative(page, count);
>  }
>
> +/**
> + * attach_page_private - attach data to page's private field and set PG_private.
> + * @page: page to be attached and set flag.
> + * @data: data to attach to page's private field.
> + *
> + * Need to take reference as mm.h said "Setting PG_private should also increment
> + * the refcount".
> + */
> +static inline void attach_page_private(struct page *page, void *data)
> +{
> +       get_page(page);
> +       set_page_private(page, (unsigned long)data);
> +       SetPagePrivate(page);
> +}
> +
> +/**
> + * clear_page_private - clear page's private field and PG_private.
> + * @page: page to be cleared.
> + *
> + * The counterpart function of attach_page_private.
> + * Return: private data of page or NULL if page doesn't have private data.
> + */
> +static inline void *clear_page_private(struct page *page)
> +{
> +       void *data = (void *)page_private(page);
> +
> +       if (!PagePrivate(page))
> +               return NULL;
> +       ClearPagePrivate(page);
> +       set_page_private(page, 0);
> +       put_page(page);
> +
> +       return data;
> +}
> +

I like this in general, but the name clear_page_private suggests that
this might be the inverse operation of set_page_private, which it is
not. So maybe this can be renamed to detach_page_private to more
clearly indicate that it pairs with attach_page_private?

>  #ifdef CONFIG_NUMA
>  extern struct page *__page_cache_alloc(gfp_t gfp);
>  #else
> --
> 2.17.1
>

Thanks,
Andreas


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
