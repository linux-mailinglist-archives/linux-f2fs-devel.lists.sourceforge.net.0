Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8020B4CCBB7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Mar 2022 03:23:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nPxbX-0006Mo-HM; Fri, 04 Mar 2022 02:23:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <neilb@suse.de>) id 1nPxbV-0006EO-NS
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Mar 2022 02:23:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-id:Date:References:In-reply-to:Subject:Cc:
 To:From:MIME-Version:Content-Transfer-Encoding:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E85sAoXCaTA9rJMXOcKl8Th+xCpRXA0b8EAqZxwZ8A0=; b=eObwaqTjTN6B/N8pujoQSSp7nH
 mtfdjj9I65l9Umd1B7i6S9GU8jvlme/0BnQmQECrgjZSGAVc28fdCsKufcUucalNXtwolEz6wo2on
 U4bRSEwy3DinOGlcC290klkG2XgAOTjTtpMsXGwL0aJp7PsOb0pJfJn2j+8R/tvNTqRs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-id:Date:References:In-reply-to:Subject:Cc:To:From:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E85sAoXCaTA9rJMXOcKl8Th+xCpRXA0b8EAqZxwZ8A0=; b=IAhOo6rzBR1Wvc5PdtjOeEN2Jk
 RfBqgdf4Cr/Cji/E8Fb3a1d2POMSY5EvjjrI2dojrqWbZbb/4NInPitIkT+wqZ3+jAtBH4K2xbY6+
 YlmhKsD984h8vkKhXrw83w8Oo+2eW9AIVac1soqU9OEm64U8HKy0WxhmXV/3i9FGvH7U=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nPxbT-004IsA-2K
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Mar 2022 02:23:36 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 977441F382;
 Fri,  4 Mar 2022 02:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646360604; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E85sAoXCaTA9rJMXOcKl8Th+xCpRXA0b8EAqZxwZ8A0=;
 b=OHMBIepyGZT5p2vUzh9m6EF2ADllsCUvjfoI6pTTrXo7Yz0B7BDN+ge9IdtF+2ZYydZGCQ
 8WoB5pAABgNBYEPVBbEaEnFFjU93OJpcylm9mmoQGVwXSBRAGZ9mDxUgC5aU5qlMH9Ckr8
 8JdQlmMLB5FGrAN6piwNc9Z7wosEfx8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646360604;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E85sAoXCaTA9rJMXOcKl8Th+xCpRXA0b8EAqZxwZ8A0=;
 b=gt1xKH0idJAvV5toxul/AJtWemJaGkXOxCg34os0vjwsTU/KiA45a4f222DhjpE4Y5De+j
 w3347cZDZ/LwPhDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8CAE41340A;
 Fri,  4 Mar 2022 02:23:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Wj8UEhV4IWIXewAAMHmgww
 (envelope-from <neilb@suse.de>); Fri, 04 Mar 2022 02:23:17 +0000
MIME-Version: 1.0
From: "NeilBrown" <neilb@suse.de>
To: "Miklos Szeredi" <miklos@szeredi.hu>
In-reply-to: <CAJfpegs=DhCO62EFV0Q_i2fmqJnziJy1t4itP9deS=FuWEA=TQ@mail.gmail.com>
References: <164549971112.9187.16871723439770288255.stgit@noble.brown>,
 <164549983736.9187.16755913785880819183.stgit@noble.brown>,
 <CAJfpegs=DhCO62EFV0Q_i2fmqJnziJy1t4itP9deS=FuWEA=TQ@mail.gmail.com>
Date: Fri, 04 Mar 2022 13:23:14 +1100
Message-id: <164636059432.13165.6442580674358743838@noble.neil.brown.name>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, 02 Mar 2022, Miklos Szeredi wrote: > On Tue, 22 Feb
 2022 at 04:18, NeilBrown <neilb@suse.de> wrote: > > > > If ->readpages doesn't
 process all the pages, then it is best to act as > > though t [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nPxbT-004IsA-2K
Subject: Re: [f2fs-dev] [PATCH 03/11] MM: improve cleanup when ->readpages
 doesn't process all pages.
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
Cc: Jan Kara <jack@suse.cz>, linux-doc@vger.kernel.org,
 "Darrick J. Wong" <djwong@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mm <linux-mm@kvack.org>, drbd-dev@lists.linbit.com,
 Paolo Valente <paolo.valente@linaro.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Ilya Dryomov <idryomov@gmail.com>, Ext4 <linux-ext4@vger.kernel.org>,
 linux-nilfs@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Jens Axboe <axboe@kernel.dk>, Linux NFS list <linux-nfs@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Jeff Layton <jlayton@kernel.org>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 Wu Fengguang <fengguang.wu@intel.com>,
 Anna Schumaker <anna.schumaker@netapp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, 02 Mar 2022, Miklos Szeredi wrote:
> On Tue, 22 Feb 2022 at 04:18, NeilBrown <neilb@suse.de> wrote:
> >
> > If ->readpages doesn't process all the pages, then it is best to act as
> > though they weren't requested so that a subsequent readahead can try
> > again.
> > So:
> >   - remove any 'ahead' pages from the page cache so they can be loaded
> >     with ->readahead() rather then multiple ->read()s
> >   - update the file_ra_state to reflect the reads that were actually
> >     submitted.
> >
> > This allows ->readpages() to abort early due e.g.  to congestion, which
> > will then allow us to remove the inode_read_congested() test from
> > page_Cache_async_ra().
> >
> > Signed-off-by: NeilBrown <neilb@suse.de>
> > ---
> >  mm/readahead.c |   19 +++++++++++++++++--
> >  1 file changed, 17 insertions(+), 2 deletions(-)
> >
> > diff --git a/mm/readahead.c b/mm/readahead.c
> > index 73b2bc5302e0..8a97bd408cf6 100644
> > --- a/mm/readahead.c
> > +++ b/mm/readahead.c
> > @@ -104,7 +104,13 @@
> >   * for necessary resources (e.g.  memory or indexing information) to
> >   * become available.  Pages in the final ``async_size`` may be
> >   * considered less urgent and failure to read them is more acceptable.
> > - * They will eventually be read individually using ->readpage().
> > + * In this case it is best to use delete_from_page_cache() to remove the
> > + * pages from the page cache as is automatically done for pages that
> > + * were not fetched with readahead_page().  This will allow a
> > + * subsequent synchronous read ahead request to try them again.  If they
> > + * are left in the page cache, then they will be read individually using
> > + * ->readpage().
> > + *
> >   */
> >
> >  #include <linux/kernel.h>
> > @@ -226,8 +232,17 @@ static void read_pages(struct readahead_control *rac, struct list_head *pages,
> >
> >         if (aops->readahead) {
> >                 aops->readahead(rac);
> > -               /* Clean up the remaining pages */
> > +               /*
> > +                * Clean up the remaining pages.  The sizes in ->ra
> > +                * maybe be used to size next read-ahead, so make sure
> > +                * they accurately reflect what happened.
> > +                */
> >                 while ((page = readahead_page(rac))) {
> > +                       rac->ra->size -= 1;
> > +                       if (rac->ra->async_size > 0) {
> > +                               rac->ra->async_size -= 1;
> > +                               delete_from_page_cache(page);
> > +                       }
> 
> Does the  above imply that filesystem should submit at least ra->size
> pages, regardless of congestion?

   ra->size - ra_async_size 
pages should be submitted reguardless of congestion.

NeilBrown



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
