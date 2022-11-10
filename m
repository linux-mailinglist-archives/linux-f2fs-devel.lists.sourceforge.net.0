Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2696249F7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Nov 2022 19:52:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1otCet-000796-CZ;
	Thu, 10 Nov 2022 18:52:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1otCer-000790-Ok
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Nov 2022 18:52:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ahiLR+0HYqx9Hj3q85kkyLXkS2RfP6cywR4r1/bj6Ic=; b=JTCEwf4fOi4qgkdGRhiuZBWfMq
 /RHVCX2urjS21gp0aW0+n58YvzQgfWwQkwmHDINMek6b/zWKQnsg6HR5JmCq8ElNm+LPlOeIBf8Di
 l+oVo2msvWHZq6t0MHj13p1qGXP25Xede0v6Lj1nJyedKSeAAlBcD2JCBkIfLjCBLiPQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ahiLR+0HYqx9Hj3q85kkyLXkS2RfP6cywR4r1/bj6Ic=; b=g3oJfMBEbd2DPeRtFvFEwqKSf/
 jknG0k0wdzUIqdGd81LbBMi4bM/lBE91LtuURugT1qu18/UkyPHPwL3XcKN8KnUqVK+k6PVBZPCMs
 KqGtOl+91MwdyB5xhYKFE+AXJuBK83NJZYNVhIXNh9655zEqZ6xRVeMSB4jzk06/SbZ8=;
Received: from mail-yw1-f175.google.com ([209.85.128.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1otCel-0005c7-ML for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Nov 2022 18:52:13 +0000
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-3691e040abaso23815217b3.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 10 Nov 2022 10:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ahiLR+0HYqx9Hj3q85kkyLXkS2RfP6cywR4r1/bj6Ic=;
 b=BuLNNyZA6RGJSro1aFTVvKQfJXFXyp5VR6864NrwvkzbzqRoktCJVw6N/Doca5qBcu
 30j7oqGhfYMC/2wwo+CnxYyRIcfIpMO1i3CANPIDzCZ/35eph3JNnXqbXZVpyVeE6nwC
 2rgiZ/WGg8qdiA9Wx3EmD01ybzYII1H7SmMVjyiHJ0HXfk4CMj8BCtPoDkfwrzn3wjsG
 tMQ34M0n3gr3bNTVHM2h6CnhVhIFHKJD1ZCvcWbyUbhDpvhP6XUbvTgwPEhVyNT1WYj4
 2KOVt0eemsENinf1T7NLvlf2zR8Rak8qZXX3U/QTi6IKzLl/llUNyWZD4jBYY5o/Cbo9
 gdkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ahiLR+0HYqx9Hj3q85kkyLXkS2RfP6cywR4r1/bj6Ic=;
 b=ruF/lx3FDNJIpYugjT2Ux0EhGpSuHuiYiEpZUhgJr2Qf8bxBJxtEq3ZGoR0MAYnJfr
 u5BDFOdGHDstQEs+org+q/0QcG7fU4TizX1UQel9bTKmTMuvQNbZbvs3jl/ktUSxt3Ur
 jIjHcz+aTncrwKMXfg0XOel4Be+k6OLPJWWhv90IU/hdRqGMaCENNrqEXpWhj+TjM/m+
 yH5P+to7o19GCFkAMNWf1NbdjiBNVgvbkOLx64IYQsyZ2JHEzG1UgePUsrlgahU8rmbW
 r0c36w0OLBTnA674Z304F6kWZMoctkc4g5vD5Foh74RUdxCtmLWAWAb3umo94v33YPfl
 ewGw==
X-Gm-Message-State: ACrzQf1PvkgnKq7EbJg9c4UcCdTReEWniDgL1/kcFD4HRM2ndb2bJXRL
 jxueN6RYq4K2eubx4COpV+xoIFhWjBEFLOyrVzY=
X-Google-Smtp-Source: AMsMyM6qbhoDq4EuNlT/sFztZuNh18/AZoQGojI1IWj/9MWKt4lI+zofGQOcHJnd2iNJiiAFP0Po3i1fYNOJTKFQ5/8=
X-Received: by 2002:a81:63c6:0:b0:349:37f7:73dd with SMTP id
 x189-20020a8163c6000000b0034937f773ddmr62868232ywb.368.1668106321899; Thu, 10
 Nov 2022 10:52:01 -0800 (PST)
MIME-Version: 1.0
References: <20221017202451.4951-1-vishal.moola@gmail.com>
 <20221017202451.4951-12-vishal.moola@gmail.com>
 <CAOzc2pwKoyy4i4zBKhvoKmN8cezUxjDhjYZnK9GLcJniQVPoGA@mail.gmail.com>
In-Reply-To: <CAOzc2pwKoyy4i4zBKhvoKmN8cezUxjDhjYZnK9GLcJniQVPoGA@mail.gmail.com>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Thu, 10 Nov 2022 10:51:50 -0800
Message-ID: <CAOzc2pwuUZRK-qMFBhPEENUid-NBSfa9YyJ_FCcFHgwFf4mOuQ@mail.gmail.com>
To: linux-fsdevel@vger.kernel.org
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Oct 24, 2022 at 12:31 PM Vishal Moola wrote: > > On
 Mon, Oct 17, 2022 at 1:25 PM Vishal Moola (Oracle) > wrote: > > > > Convert
 function to use a folio_batch instead of pagevec. This is in [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.175 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.175 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1otCel-0005c7-ML
Subject: Re: [f2fs-dev] [PATCH v3 11/23] f2fs: Convert
 f2fs_fsync_node_pages() to use filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, jaegeuk@kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Oct 24, 2022 at 12:31 PM Vishal Moola <vishal.moola@gmail.com> wrote:
>
> On Mon, Oct 17, 2022 at 1:25 PM Vishal Moola (Oracle)
> <vishal.moola@gmail.com> wrote:
> >
> > Convert function to use a folio_batch instead of pagevec. This is in
> > preparation for the removal of find_get_pages_range_tag().
> >
> > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> > ---
> >  fs/f2fs/node.c | 19 ++++++++++---------
> >  1 file changed, 10 insertions(+), 9 deletions(-)
> >
> > diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> > index 983572f23896..e8b72336c096 100644
> > --- a/fs/f2fs/node.c
> > +++ b/fs/f2fs/node.c
> > @@ -1728,12 +1728,12 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
> >                         unsigned int *seq_id)
> >  {
> >         pgoff_t index;
> > -       struct pagevec pvec;
> > +       struct folio_batch fbatch;
> >         int ret = 0;
> >         struct page *last_page = NULL;
> >         bool marked = false;
> >         nid_t ino = inode->i_ino;
> > -       int nr_pages;
> > +       int nr_folios;
> >         int nwritten = 0;
> >
> >         if (atomic) {
> > @@ -1742,20 +1742,21 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
> >                         return PTR_ERR_OR_ZERO(last_page);
> >         }
> >  retry:
> > -       pagevec_init(&pvec);
> > +       folio_batch_init(&fbatch);
> >         index = 0;
> >
> > -       while ((nr_pages = pagevec_lookup_tag(&pvec, NODE_MAPPING(sbi), &index,
> > -                               PAGECACHE_TAG_DIRTY))) {
> > +       while ((nr_folios = filemap_get_folios_tag(NODE_MAPPING(sbi), &index,
> > +                                       (pgoff_t)-1, PAGECACHE_TAG_DIRTY,
> > +                                       &fbatch))) {
> >                 int i;
> >
> > -               for (i = 0; i < nr_pages; i++) {
> > -                       struct page *page = pvec.pages[i];
> > +               for (i = 0; i < nr_folios; i++) {
> > +                       struct page *page = &fbatch.folios[i]->page;
> >                         bool submitted = false;
> >
> >                         if (unlikely(f2fs_cp_error(sbi))) {
> >                                 f2fs_put_page(last_page, 0);
> > -                               pagevec_release(&pvec);
> > +                               folio_batch_release(&fbatch);
> >                                 ret = -EIO;
> >                                 goto out;
> >                         }
> > @@ -1821,7 +1822,7 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
> >                                 break;
> >                         }
> >                 }
> > -               pagevec_release(&pvec);
> > +               folio_batch_release(&fbatch);
> >                 cond_resched();
> >
> >                 if (ret || marked)
> > --
> > 2.36.1
> >
>
> Following up on these f2fs patches (11/23, 12/23, 13/23, 14/23, 15/23,
> 16/23). Does anyone have time to review them this week?

Chao, thank you for taking a look at some of these patches!
If you have time to look over the remaining patches (14, 15, 16)
feedback on those would be appreciated as well.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
