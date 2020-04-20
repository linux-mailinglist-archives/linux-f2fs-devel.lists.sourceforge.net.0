Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5D11B084D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Apr 2020 13:55:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jQV0y-0005Hc-Az; Mon, 20 Apr 2020 11:55:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <miklos@szeredi.hu>) id 1jQV0x-0005HV-4A
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Apr 2020 11:55:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xz434+emhPfWjjKXYErvQLCog0qnyrqkr9U47Pj8EAE=; b=Jj+cpjsRAgwUm8mf5Pl5IIJZwP
 u3sXi1xj7Wgb7sWSLJTLbvy15aBxgoUStN2Dt3r9bIBVYdalCfkpH225Pc5sgcO/pfl2zaByJMWD+
 A4OwtHNSZsdOggNxSKkxRQlAPzzKYYaBdqn5MZqWbr8qgfqI1rmjXkKfRZ3BPD3PWce4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Xz434+emhPfWjjKXYErvQLCog0qnyrqkr9U47Pj8EAE=; b=DQWl+VYELYTj+umK/qFt4crgMw
 oUMj94kH46tWfLKGSKZqf1evo2NPeiS4RHoZOJRfWEkxMuqI2FnFNsWjqjIdeHjySi11v5AiwO7XO
 Jh/T3Gq1g33B9vvEU70odw5vlQxLuuAgrsYiAxnW2wy224q6QKBfJQTxpdCGSaOqJCxQ=;
Received: from mail-ej1-f67.google.com ([209.85.218.67])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jQV0t-0081qD-9h
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Apr 2020 11:55:03 +0000
Received: by mail-ej1-f67.google.com with SMTP id e2so5329858eje.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 20 Apr 2020 04:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szeredi.hu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xz434+emhPfWjjKXYErvQLCog0qnyrqkr9U47Pj8EAE=;
 b=eMGJ6i/Tp+yHljfYp7aMYd/mUsv2EnqVE+fCxu3XOH5yGdB0h61gy+ScRLFSyuRmgb
 qURUHX6I6Ir8eepIVf+Ri2YviGMLt6DWjxys1zOQJEVUfWPlsKPJUpkbtTkdGn4w0n0B
 1MP04jnPqpFSU10941aKvkRA4UrFsDmfSRMik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xz434+emhPfWjjKXYErvQLCog0qnyrqkr9U47Pj8EAE=;
 b=XdvRfRJvDDCQfL/iMiWG8ANoE/ChRo5Y3QhVXkktk6qvc+oCv2aiLcOTZL3wU2p29c
 oRiKVi2QY/P8uB3jVuv3zExDVcsD5c7NsfPUebJIccQWczQh4wdFkXajFmiGfD7gByKQ
 1Jv74V/SG26GMqSVPBhJIQ5gUyg5c4XmALLZDMXfFSKRpGD1U5uZcIEBkpiIlyrQVyAI
 8LNlOHvETf3wsH/MBxH/5ZSM5nb5dcPo/2joLF2b+74TC1G+jWCnqcPZRNNIxxWb2yQZ
 Mtz/syvrae0k0J+/Om+tByFYyagDUeazA8nueJU5HhzcBPfGW7U9ZE9jRiHJL6In49+h
 99GA==
X-Gm-Message-State: AGi0PuZeW10k0s6pJiRH1fJS84CGNrKjksYxFKUL6PyRVRYV1on0jehF
 /2r/3TBW+XQ2hJcogt3N2XEsf2EUepRIc1VUBCaZmg==
X-Google-Smtp-Source: APiQypLbTn+lSf9tXQjoSINzOkViouA+EuTM208dkpb3K/JiwqGLK/tHyeL8eS/wVDrlTm/f0ngTgrLv3Gua9FB3DGg=
X-Received: by 2002:a17:906:8549:: with SMTP id
 h9mr15204554ejy.145.1587383692787; 
 Mon, 20 Apr 2020 04:54:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200414150233.24495-1-willy@infradead.org>
 <20200414150233.24495-25-willy@infradead.org>
 <CAJfpegsZF=TFQ67vABkE5ghiZoTZF+=_u8tM5U_P6jZeAmv23A@mail.gmail.com>
 <20200420114300.GB5820@bombadil.infradead.org>
In-Reply-To: <20200420114300.GB5820@bombadil.infradead.org>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 20 Apr 2020 13:54:41 +0200
Message-ID: <CAJfpeguKAbE+_=ctxp+_3gtbqADevMPrRQ1XV6t8AHXbKwDKvg@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Spam-Score: 0.7 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.2 RCVD_IN_BL_SPAMCOP_NET RBL: Received via a relay in bl.spamcop.net
 [Blocked - see <https://www.spamcop.net/bl.shtml?209.85.218.67>]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.218.67 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
 -0.8 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jQV0t-0081qD-9h
Subject: Re: [f2fs-dev] [PATCH v11 24/25] fuse: Convert from readpages to
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

On Mon, Apr 20, 2020 at 1:43 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Mon, Apr 20, 2020 at 01:14:17PM +0200, Miklos Szeredi wrote:
> > > +       for (;;) {
> > > +               struct fuse_io_args *ia;
> > > +               struct fuse_args_pages *ap;
> > > +
> > > +               nr_pages = readahead_count(rac) - nr_pages;
> >
> > Hmm.  I see what's going on here, but it's confusing.   Why is
> > __readahead_batch() decrementing the readahead count at the start,
> > rather than at the end?
> >
> > At the very least it needs a comment about why nr_pages is calculated this way.
>
> Because usually that's what we want.  See, for example, fs/mpage.c:
>
>         while ((page = readahead_page(rac))) {
>                 prefetchw(&page->flags);
>                 args.page = page;
>                 args.nr_pages = readahead_count(rac);
>                 args.bio = do_mpage_readpage(&args);
>                 put_page(page);
>         }
>
> fuse is different because it's trying to allocate for the next batch,
> not for the batch we're currently on.
>
> I'm a little annoyed because I posted almost this exact loop here:
>
> https://lore.kernel.org/linux-fsdevel/CAJfpegtrhGamoSqD-3Svfj3-iTdAbfD8TP44H_o+HE+g+CAnCA@mail.gmail.com/
>
> and you said "I think that's fine", modified only by your concern
> for it not being obvious that nr_pages couldn't be decremented by
> __readahead_batch(), so I modified the loop slightly to assign to
> nr_pages.  The part you're now complaining about is unchanged.

Your annoyance is perfectly understandable.   This is something I
noticed now, not back then.

>
> > > +               if (nr_pages > max_pages)
> > > +                       nr_pages = max_pages;
> > > +               if (nr_pages == 0)
> > > +                       break;
> > > +               ia = fuse_io_alloc(NULL, nr_pages);
> > > +               if (!ia)
> > > +                       return;
> > > +               ap = &ia->ap;
> > > +               nr_pages = __readahead_batch(rac, ap->pages, nr_pages);
> > > +               for (i = 0; i < nr_pages; i++) {
> > > +                       fuse_wait_on_page_writeback(inode,
> > > +                                                   readahead_index(rac) + i);
> >
> > What's wrong with ap->pages[i]->index?  Are we trying to wean off using ->index?
>
> It saves reading from a cacheline?  I wouldn't be surprised if the
> compiler hoisted the read from rac->_index to outside the loop and just
> iterated from rac->_index to rac->_index + nr_pages.

Hah, if such optimizations were worth anything with codepaths
involving roundtrips to userspace...

Anyway, I'll let these be, and maybe clean them up later.

Acked-by:  Miklos Szeredi <mszeredi@redhat.com>

Thanks,
Miklos


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
