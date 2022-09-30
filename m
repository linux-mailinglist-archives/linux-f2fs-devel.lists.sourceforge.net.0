Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AFE5F10F6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Sep 2022 19:33:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oeJtU-0005M0-R3;
	Fri, 30 Sep 2022 17:33:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1oeJtT-0005Lt-JD
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Sep 2022 17:33:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kKwAFRI6H6S4yy+ZsrO+zojsSzh8+YLFFYtXFQ/BEZk=; b=Th+bWtyO4yEUPbkNXI9NQpMBZb
 vbu5p2ClaLFL301fazq0Dn5XtJ9b+dHTe+jY3S+IiEiizijls/yxsfp1c/w+AHYwDOjqs1WPkPm9o
 qH/AaeGE3Rmo7tzK7U710u5zd0re12qsvD0QaxS5GjHoo5BURhtMXkjwQubrb1TkYqJM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kKwAFRI6H6S4yy+ZsrO+zojsSzh8+YLFFYtXFQ/BEZk=; b=bBttL7II3N4G3MqeJZi0Nmme1b
 ulqtvRHEOd0HPE4Sg/B6VEX7vFyWPhBXGIiTv2DI2urSum5xEWUBAQs93rjfZ6uXAr2XpJU0kv+ph
 FT5jDs343uIB+CpylRBv8Z8zuSwJQrm9kML/cdqu+5pXfyYR0SlVAgvE5QxNY5PorL+U=;
Received: from mail-oo1-f47.google.com ([209.85.161.47])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oeJtP-0087au-Ju for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Sep 2022 17:33:47 +0000
Received: by mail-oo1-f47.google.com with SMTP id
 c13-20020a4ac30d000000b0047663e3e16bso2685640ooq.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 30 Sep 2022 10:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=kKwAFRI6H6S4yy+ZsrO+zojsSzh8+YLFFYtXFQ/BEZk=;
 b=X8OCNFrO8ajHcgvNmUPRIKc3i/Co8dAyD1Yp4sOE3CQpChxxvMuJWv8NHCTZA0FW5E
 GWguHTMWuwpTCtizko1rNJCX49r1rC5mFkRZAmUJvrcbDUfzeHNH9fEHLHtHa11PsxBY
 9Qm4kTOnRoAFI5hFcCG+D4l3hoIZgiOzvNb/QdMn79U9l0Qkp5nPSTOgU4dpQ/tMwwb/
 BMng97a/bh55vWGkAksY5+LkKvayRbdSIYapBOrDf2C5JHUNolYsdEbu0W4IJyAjbIzN
 PH6f3BWTT6jRlBnwEF60+DGQzFogFxlHUwZc+2/4H91ytJ2GrSbB4r1tDgYHscT+BrcQ
 Iz5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=kKwAFRI6H6S4yy+ZsrO+zojsSzh8+YLFFYtXFQ/BEZk=;
 b=EaW3DHlQa3a72FMT2rTeau43ROpC459IM1TSTrJbzt5f9JfGGXKfpmFt0XGXcAOUDS
 xLSYZ4ZTt6s9v/En0lcTY9jOndn7/ix98JuHVFzmNrmNPKMDXNVj5aSfjZHShPaDkgc6
 2DD4BeRYv6a4XUiE5G4lWZVTbA94I0CpntDeb83fR6KL+98oWZqoo34jiLfSdxxTqgZ6
 8x0iwXKjXaoCMjLIHqJsqI45Er7LjjSonoAvO2/NmqZwIUJ/XmYzqxCVGE8MR+Th7Fth
 bpw/PHR4Q1eu9juSoQKw7oozZbhIxOigdcgQBaZN0MiRtc8HwyBMX5Xo+3jjFoO86z93
 jOYA==
X-Gm-Message-State: ACrzQf1FpLrDZAC0CDLe80QzSebVLb6tIZEbDTScm8tQyek0r/24qSZ5
 xsGRH/cWGN3wU+0vN+i5NbeJ3fqUeKVMt9gxkIE=
X-Google-Smtp-Source: AMsMyM4e13ATtfH3+0NSYF/fIXZPdPMCFUMtKS8GkK1jIEg4Cb+gNx36XCgf8ns2P8vpzN68ybP8DHEPoH7e9cxFL+8=
X-Received: by 2002:a9d:6a95:0:b0:65c:77fd:53a with SMTP id
 l21-20020a9d6a95000000b0065c77fd053amr2759522otq.125.1664559217796; Fri, 30
 Sep 2022 10:33:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220912182224.514561-1-vishal.moola@gmail.com>
 <20220912182224.514561-9-vishal.moola@gmail.com>
 <35d965bbc3d27e43d6743fc3a5cb042503a1b7bf.camel@kernel.org>
In-Reply-To: <35d965bbc3d27e43d6743fc3a5cb042503a1b7bf.camel@kernel.org>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Fri, 30 Sep 2022 10:33:26 -0700
Message-ID: <CAOzc2pwMfLzp3HzakyFJBxkD+qYS2wnYUF5xqUHuxTa+CAgu9A@mail.gmail.com>
To: Jeff Layton <jlayton@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Sep 30, 2022 at 9:25 AM Jeff Layton wrote: > > On
 Mon, 2022-09-12 at 11:22 -0700,
 Vishal Moola (Oracle) wrote: > > Convert function
 to use folios throughout. This is in preparation for > > t [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: pvec.nr]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.161.47 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.161.47 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oeJtP-0087au-Ju
Subject: Re: [f2fs-dev] [PATCH v2 08/23] ceph: Convert
 ceph_writepages_start() to use filemap_get_folios_tag()
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
 cluster-devel@redhat.com, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Sep 30, 2022 at 9:25 AM Jeff Layton <jlayton@kernel.org> wrote:
>
> On Mon, 2022-09-12 at 11:22 -0700, Vishal Moola (Oracle) wrote:
> > Convert function to use folios throughout. This is in preparation for
> > the removal of find_get_pages_range_tag().
> >
> > This change does NOT support large folios. This shouldn't be an issue as
> > of now since ceph only utilizes folios of size 1 anyways, and there is a
> > lot of work to be done on ceph conversions to folios for later patches
> > at some point.
> >
> > Also some minor renaming for consistency.
> >
> > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> > ---
> >  fs/ceph/addr.c | 138 +++++++++++++++++++++++++------------------------
> >  1 file changed, 70 insertions(+), 68 deletions(-)
> >
> > diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
> > index dcf701b05cc1..33dbe55b08be 100644
> > --- a/fs/ceph/addr.c
> > +++ b/fs/ceph/addr.c
> > @@ -792,7 +792,7 @@ static int ceph_writepages_start(struct address_space *mapping,
> >       struct ceph_vino vino = ceph_vino(inode);
> >       pgoff_t index, start_index, end = -1;
> >       struct ceph_snap_context *snapc = NULL, *last_snapc = NULL, *pgsnapc;
> > -     struct pagevec pvec;
> > +     struct folio_batch fbatch;
> >       int rc = 0;
> >       unsigned int wsize = i_blocksize(inode);
> >       struct ceph_osd_request *req = NULL;
> > @@ -821,7 +821,7 @@ static int ceph_writepages_start(struct address_space *mapping,
> >       if (fsc->mount_options->wsize < wsize)
> >               wsize = fsc->mount_options->wsize;
> >
> > -     pagevec_init(&pvec);
> > +     folio_batch_init(&fbatch);
> >
> >       start_index = wbc->range_cyclic ? mapping->writeback_index : 0;
> >       index = start_index;
> > @@ -869,9 +869,9 @@ static int ceph_writepages_start(struct address_space *mapping,
> >
> >       while (!done && index <= end) {
> >               int num_ops = 0, op_idx;
> > -             unsigned i, pvec_pages, max_pages, locked_pages = 0;
> > +             unsigned i, nr_folios, max_pages, locked_pages = 0;
> >               struct page **pages = NULL, **data_pages;
> > -             struct page *page;
> > +             struct folio *folio;
> >               pgoff_t strip_unit_end = 0;
> >               u64 offset = 0, len = 0;
> >               bool from_pool = false;
> > @@ -879,28 +879,28 @@ static int ceph_writepages_start(struct address_space *mapping,
> >               max_pages = wsize >> PAGE_SHIFT;
> >
> >  get_more_pages:
> > -             pvec_pages = pagevec_lookup_range_tag(&pvec, mapping, &index,
> > -                                             end, PAGECACHE_TAG_DIRTY);
> > -             dout("pagevec_lookup_range_tag got %d\n", pvec_pages);
> > -             if (!pvec_pages && !locked_pages)
> > +             nr_folios = filemap_get_folios_tag(mapping, &index,
> > +                             end, PAGECACHE_TAG_DIRTY, &fbatch);
> > +             dout("filemap_get_folios_tag got %d\n", nr_folios);
> > +             if (!nr_folios && !locked_pages)
> >                       break;
> > -             for (i = 0; i < pvec_pages && locked_pages < max_pages; i++) {
> > -                     page = pvec.pages[i];
> > -                     dout("? %p idx %lu\n", page, page->index);
> > +             for (i = 0; i < nr_folios && locked_pages < max_pages; i++) {
> > +                     folio = fbatch.folios[i];
> > +                     dout("? %p idx %lu\n", folio, folio->index);
> >                       if (locked_pages == 0)
> > -                             lock_page(page);  /* first page */
> > -                     else if (!trylock_page(page))
> > +                             folio_lock(folio); /* first folio */
> > +                     else if (!folio_trylock(folio))
> >                               break;
> >
> >                       /* only dirty pages, or our accounting breaks */
> > -                     if (unlikely(!PageDirty(page)) ||
> > -                         unlikely(page->mapping != mapping)) {
> > -                             dout("!dirty or !mapping %p\n", page);
> > -                             unlock_page(page);
> > +                     if (unlikely(!folio_test_dirty(folio)) ||
> > +                         unlikely(folio->mapping != mapping)) {
> > +                             dout("!dirty or !mapping %p\n", folio);
> > +                             folio_unlock(folio);
> >                               continue;
> >                       }
> >                       /* only if matching snap context */
> > -                     pgsnapc = page_snap_context(page);
> > +                     pgsnapc = page_snap_context(&folio->page);
> >                       if (pgsnapc != snapc) {
> >                               dout("page snapc %p %lld != oldest %p %lld\n",
> >                                    pgsnapc, pgsnapc->seq, snapc, snapc->seq);
> > @@ -908,11 +908,10 @@ static int ceph_writepages_start(struct address_space *mapping,
> >                                   !ceph_wbc.head_snapc &&
> >                                   wbc->sync_mode != WB_SYNC_NONE)
> >                                       should_loop = true;
> > -                             unlock_page(page);
> > +                             folio_unlock(folio);
> >                               continue;
> >                       }
> > -                     if (page_offset(page) >= ceph_wbc.i_size) {
> > -                             struct folio *folio = page_folio(page);
> > +                     if (folio_pos(folio) >= ceph_wbc.i_size) {
> >
> >                               dout("folio at %lu beyond eof %llu\n",
> >                                    folio->index, ceph_wbc.i_size);
> > @@ -924,25 +923,26 @@ static int ceph_writepages_start(struct address_space *mapping,
> >                               folio_unlock(folio);
> >                               continue;
> >                       }
> > -                     if (strip_unit_end && (page->index > strip_unit_end)) {
> > -                             dout("end of strip unit %p\n", page);
> > -                             unlock_page(page);
> > +                     if (strip_unit_end && (folio->index > strip_unit_end)) {
> > +                             dout("end of strip unit %p\n", folio);
> > +                             folio_unlock(folio);
> >                               break;
> >                       }
> > -                     if (PageWriteback(page) || PageFsCache(page)) {
> > +                     if (folio_test_writeback(folio) ||
> > +                                     folio_test_fscache(folio)) {
> >                               if (wbc->sync_mode == WB_SYNC_NONE) {
> > -                                     dout("%p under writeback\n", page);
> > -                                     unlock_page(page);
> > +                                     dout("%p under writeback\n", folio);
> > +                                     folio_unlock(folio);
> >                                       continue;
> >                               }
> > -                             dout("waiting on writeback %p\n", page);
> > -                             wait_on_page_writeback(page);
> > -                             wait_on_page_fscache(page);
> > +                             dout("waiting on writeback %p\n", folio);
> > +                             folio_wait_writeback(folio);
> > +                             folio_wait_fscache(folio);
> >                       }
> >
> > -                     if (!clear_page_dirty_for_io(page)) {
> > -                             dout("%p !clear_page_dirty_for_io\n", page);
> > -                             unlock_page(page);
> > +                     if (!folio_clear_dirty_for_io(folio)) {
> > +                             dout("%p !clear_page_dirty_for_io\n", folio);
> > +                             folio_unlock(folio);
> >                               continue;
> >                       }
> >
> > @@ -958,7 +958,7 @@ static int ceph_writepages_start(struct address_space *mapping,
> >                               u32 xlen;
> >
> >                               /* prepare async write request */
> > -                             offset = (u64)page_offset(page);
> > +                             offset = (u64)folio_pos(folio);
> >                               ceph_calc_file_object_mapping(&ci->i_layout,
> >                                                             offset, wsize,
> >                                                             &objnum, &objoff,
> > @@ -966,7 +966,7 @@ static int ceph_writepages_start(struct address_space *mapping,
> >                               len = xlen;
> >
> >                               num_ops = 1;
> > -                             strip_unit_end = page->index +
> > +                             strip_unit_end = folio->index +
> >                                       ((len - 1) >> PAGE_SHIFT);
> >
> >                               BUG_ON(pages);
> > @@ -981,54 +981,53 @@ static int ceph_writepages_start(struct address_space *mapping,
> >                               }
> >
> >                               len = 0;
> > -                     } else if (page->index !=
> > +                     } else if (folio->index !=
> >                                  (offset + len) >> PAGE_SHIFT) {
> >                               if (num_ops >= (from_pool ?  CEPH_OSD_SLAB_OPS :
> >                                                            CEPH_OSD_MAX_OPS)) {
> > -                                     redirty_page_for_writepage(wbc, page);
> > -                                     unlock_page(page);
> > +                                     folio_redirty_for_writepage(wbc, folio);
> > +                                     folio_unlock(folio);
> >                                       break;
> >                               }
> >
> >                               num_ops++;
> > -                             offset = (u64)page_offset(page);
> > +                             offset = (u64)folio_pos(folio);
> >                               len = 0;
> >                       }
> >
> > -                     /* note position of first page in pvec */
> > +                     /* note position of first page in fbatch */
> >                       dout("%p will write page %p idx %lu\n",
> > -                          inode, page, page->index);
> > +                          inode, folio, folio->index);
> >
> >                       if (atomic_long_inc_return(&fsc->writeback_count) >
> >                           CONGESTION_ON_THRESH(
> >                                   fsc->mount_options->congestion_kb))
> >                               fsc->write_congested = true;
> >
> > -                     pages[locked_pages++] = page;
> > -                     pvec.pages[i] = NULL;
> > +                     pages[locked_pages++] = &folio->page;
> > +                     fbatch.folios[i] = NULL;
> >
> > -                     len += thp_size(page);
> > +                     len += folio_size(folio);
> >               }
> >
> >               /* did we get anything? */
> >               if (!locked_pages)
> > -                     goto release_pvec_pages;
> > +                     goto release_folio_batches;
> >               if (i) {
> >                       unsigned j, n = 0;
> > -                     /* shift unused page to beginning of pvec */
> > -                     for (j = 0; j < pvec_pages; j++) {
> > -                             if (!pvec.pages[j])
> > +                     /* shift unused folio to the beginning of fbatch */
> > +                     for (j = 0; j < nr_folios; j++) {
> > +                             if (!fbatch.folios[j])
> >                                       continue;
> >                               if (n < j)
> > -                                     pvec.pages[n] = pvec.pages[j];
> > +                                     fbatch.folios[n] = fbatch.folios[j];
> >                               n++;
> >                       }
> > -                     pvec.nr = n;
> > -
> > -                     if (pvec_pages && i == pvec_pages &&
> > +                     fbatch.nr = n;
> > +                     if (nr_folios && i == nr_folios &&
> >                           locked_pages < max_pages) {
> > -                             dout("reached end pvec, trying for more\n");
> > -                             pagevec_release(&pvec);
> > +                             dout("reached end of fbatch, trying for more\n");
> > +                             folio_batch_release(&fbatch);
> >                               goto get_more_pages;
> >                       }
> >               }
> > @@ -1056,7 +1055,7 @@ static int ceph_writepages_start(struct address_space *mapping,
> >                       BUG_ON(IS_ERR(req));
> >               }
> >               BUG_ON(len < page_offset(pages[locked_pages - 1]) +
> > -                          thp_size(page) - offset);
> > +                          folio_size(folio) - offset);
> >
> >               req->r_callback = writepages_finish;
> >               req->r_inode = inode;
> > @@ -1098,7 +1097,7 @@ static int ceph_writepages_start(struct address_space *mapping,
> >                       set_page_writeback(pages[i]);
> >                       if (caching)
> >                               ceph_set_page_fscache(pages[i]);
> > -                     len += thp_size(page);
> > +                     len += folio_size(folio);
> >               }
> >               ceph_fscache_write_to_cache(inode, offset, len, caching);
> >
> > @@ -1108,7 +1107,7 @@ static int ceph_writepages_start(struct address_space *mapping,
> >                       /* writepages_finish() clears writeback pages
> >                        * according to the data length, so make sure
> >                        * data length covers all locked pages */
> > -                     u64 min_len = len + 1 - thp_size(page);
> > +                     u64 min_len = len + 1 - folio_size(folio);
> >                       len = get_writepages_data_length(inode, pages[i - 1],
> >                                                        offset);
> >                       len = max(len, min_len);
> > @@ -1164,10 +1163,10 @@ static int ceph_writepages_start(struct address_space *mapping,
> >               if (wbc->nr_to_write <= 0 && wbc->sync_mode == WB_SYNC_NONE)
> >                       done = true;
> >
> > -release_pvec_pages:
> > -             dout("pagevec_release on %d pages (%p)\n", (int)pvec.nr,
> > -                  pvec.nr ? pvec.pages[0] : NULL);
> > -             pagevec_release(&pvec);
> > +release_folio_batches:
> > +             dout("folio_batch_release on %d batches (%p)", (int) fbatch.nr,
> > +                             fbatch.nr ? fbatch.folios[0] : NULL);
> > +             folio_batch_release(&fbatch);
> >       }
> >
> >       if (should_loop && !done) {
> > @@ -1180,19 +1179,22 @@ static int ceph_writepages_start(struct address_space *mapping,
> >               if (wbc->sync_mode != WB_SYNC_NONE &&
> >                   start_index == 0 && /* all dirty pages were checked */
> >                   !ceph_wbc.head_snapc) {
> > -                     struct page *page;
> > +                     struct folio *folio;
> >                       unsigned i, nr;
> >                       index = 0;
> >                       while ((index <= end) &&
> > -                            (nr = pagevec_lookup_tag(&pvec, mapping, &index,
> > -                                             PAGECACHE_TAG_WRITEBACK))) {
> > +                             (nr = filemap_get_folios_tag(mapping, &index,
> > +                                             (pgoff_t)-1,
> > +                                             PAGECACHE_TAG_WRITEBACK,
> > +                                             &fbatch))) {
> >                               for (i = 0; i < nr; i++) {
> > -                                     page = pvec.pages[i];
> > -                                     if (page_snap_context(page) != snapc)
> > +                                     folio = fbatch.folios[i];
> > +                                     if (page_snap_context(&folio->page) !=
> > +                                                     snapc)
> >                                               continue;
> > -                                     wait_on_page_writeback(page);
> > +                                     folio_wait_writeback(folio);
> >                               }
> > -                             pagevec_release(&pvec);
> > +                             folio_batch_release(&fbatch);
> >                               cond_resched();
> >                       }
> >               }
>
>
> We have some work in progress to add write helpers to netfslib. Once we
> get those in place, we plan to convert ceph to use them. At that point
> ceph_writepages just goes away.
> I think it'd be best to just wait for that and to just ensure that
> netfslib uses filemap_get_folios_tag and the like where appropriate.
> --
> Jeff Layton <jlayton@kernel.org>

Sounds good, let's do that. That will make the patch a lot simpler, and less
prone to errors. I'll strip this down to the necessary changes in v3.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
