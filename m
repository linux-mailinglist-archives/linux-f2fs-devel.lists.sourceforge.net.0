Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E37A64CCBE2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Mar 2022 03:42:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nPxu9-00040f-14; Fri, 04 Mar 2022 02:42:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <neilb@suse.de>) id 1nPxu7-00040U-Tk
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Mar 2022 02:42:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-id:Date:References:In-reply-to:Subject:Cc:
 To:From:MIME-Version:Content-Transfer-Encoding:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E1LSsS3hFazVJuoQhofGl3WFIJIfnvw/hjoFnxzGa8Q=; b=UlCBHnZTmERWHKWySktt9JDH1T
 LmGLFlkqGmm2Wth+ltNNHPQr3KkRgzlQ4jqPHl4P4LgOt7UkybgSzygVJ9XKhNzbl2DiErh+4CaJm
 nNmtlfbCcjhmE9Uq0Kti45BMCyI7K5Sqw/nPGS2w37Vn/DH6DOtls9d9hgDDwfcUl674=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-id:Date:References:In-reply-to:Subject:Cc:To:From:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E1LSsS3hFazVJuoQhofGl3WFIJIfnvw/hjoFnxzGa8Q=; b=LSd8fz6GoL+v02HfuXFM/3fk8S
 WYqZHlpO5KTfoqQRkV/3873vLQzTxs1lXBF40m9rxbhe7XVC0F3PL+uQZbpR2PNwNuGu4UvP3WLUO
 11yRBEo8qR6iQwxBl86L7k0EUN4OEWm5P4qBM/qR9qxEw3pzCe6/ML2c0QTB1GLUKGLs=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nPxu5-0008My-FY
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Mar 2022 02:42:50 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A0B7B218A9;
 Fri,  4 Mar 2022 02:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646361759; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E1LSsS3hFazVJuoQhofGl3WFIJIfnvw/hjoFnxzGa8Q=;
 b=kSHYevnIlEV/nAB3Xb2sRoUgVahgqrrLpnNU/rj78jXyCzqgxhJIIbDb3QEvOcrMP7LvDe
 4NFc1B3zwex4VffmlBHljE0pG1V6JbHvSSVwiwwVFrzzno61GNqQ0x09zyG9WYl/60C2Qy
 uRIUO2cQUjcdNbPtqxxoPSK3oNfH6hk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646361759;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E1LSsS3hFazVJuoQhofGl3WFIJIfnvw/hjoFnxzGa8Q=;
 b=A/VT+8oYrZEqs09lFC8Pz065G6GP0zURBYxKKH1zgKh4n8fEz30Rkylz0nWBpbCLzoPCy5
 SnbxIVcZ29yF5KDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 90E5A13AF7;
 Fri,  4 Mar 2022 02:42:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id P4gqE5h8IWLKfwAAMHmgww
 (envelope-from <neilb@suse.de>); Fri, 04 Mar 2022 02:42:32 +0000
MIME-Version: 1.0
From: "NeilBrown" <neilb@suse.de>
To: "Miklos Szeredi" <miklos@szeredi.hu>
In-reply-to: <CAJfpegsGOFD46KM8pxFAemokv9OOsCSHk=ag6jZZ=VscijMXZQ@mail.gmail.com>
References: <164549971112.9187.16871723439770288255.stgit@noble.brown>,
 <164549983737.9187.2627117501000365074.stgit@noble.brown>,
 <CAJfpegsGOFD46KM8pxFAemokv9OOsCSHk=ag6jZZ=VscijMXZQ@mail.gmail.com>
Date: Fri, 04 Mar 2022 13:42:29 +1100
Message-id: <164636174972.29369.5216919060965840586@noble.neil.brown.name>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, 02 Mar 2022, Miklos Szeredi wrote: > On Tue, 22 Feb
 2022 at 04:18, NeilBrown <neilb@suse.de> wrote: > > > > The bdi congestion
 tracking in not widely used and will be removed. > > > > Fuse is [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1nPxu5-0008My-FY
Subject: Re: [f2fs-dev] [PATCH 04/11] fuse: remove reliance on bdi congestion
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
> > The bdi congestion tracking in not widely used and will be removed.
> >
> > Fuse is one of a small number of filesystems that uses it, setting both
> > the sync (read) and async (write) congestion flags at what it determines
> > are appropriate times.
> >
> > The only remaining effect of the sync flag is to cause read-ahead to be
> > skipped.
> > The only remaining effect of the async flag is to cause (some)
> > WB_SYNC_NONE writes to be skipped.
> >
> > So instead of setting the flags, change:
> >  - .readahead to stop when it has submitted all non-async pages
> >     for read.
> >  - .writepages to do nothing if WB_SYNC_NONE and the flag would be set
> >  - .writepage to return AOP_WRITEPAGE_ACTIVATE if WB_SYNC_NONE
> >     and the flag would be set.
> >
> > The writepages change causes a behavioural change in that pageout() can
> > now return PAGE_ACTIVATE instead of PAGE_KEEP, so SetPageActive() will
> > be called on the page which (I think) will further delay the next attempt
> > at writeout.  This might be a good thing.
> >
> > Signed-off-by: NeilBrown <neilb@suse.de>
> > ---
> >  fs/fuse/control.c |   17 -----------------
> >  fs/fuse/dev.c     |    8 --------
> >  fs/fuse/file.c    |   17 +++++++++++++++++
> >  3 files changed, 17 insertions(+), 25 deletions(-)
> >
> > diff --git a/fs/fuse/control.c b/fs/fuse/control.c
> > index 000d2e5627e9..7cede9a3bc96 100644
> > --- a/fs/fuse/control.c
> > +++ b/fs/fuse/control.c
> > @@ -164,7 +164,6 @@ static ssize_t fuse_conn_congestion_threshold_write(struct file *file,
> >  {
> >         unsigned val;
> >         struct fuse_conn *fc;
> > -       struct fuse_mount *fm;
> >         ssize_t ret;
> >
> >         ret = fuse_conn_limit_write(file, buf, count, ppos, &val,
> > @@ -178,22 +177,6 @@ static ssize_t fuse_conn_congestion_threshold_write(struct file *file,
> >         down_read(&fc->killsb);
> >         spin_lock(&fc->bg_lock);
> >         fc->congestion_threshold = val;
> > -
> > -       /*
> > -        * Get any fuse_mount belonging to this fuse_conn; s_bdi is
> > -        * shared between all of them
> > -        */
> > -
> > -       if (!list_empty(&fc->mounts)) {
> > -               fm = list_first_entry(&fc->mounts, struct fuse_mount, fc_entry);
> > -               if (fc->num_background < fc->congestion_threshold) {
> > -                       clear_bdi_congested(fm->sb->s_bdi, BLK_RW_SYNC);
> > -                       clear_bdi_congested(fm->sb->s_bdi, BLK_RW_ASYNC);
> > -               } else {
> > -                       set_bdi_congested(fm->sb->s_bdi, BLK_RW_SYNC);
> > -                       set_bdi_congested(fm->sb->s_bdi, BLK_RW_ASYNC);
> > -               }
> > -       }
> >         spin_unlock(&fc->bg_lock);
> >         up_read(&fc->killsb);
> >         fuse_conn_put(fc);
> > diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> > index cd54a529460d..e1b4a846c90d 100644
> > --- a/fs/fuse/dev.c
> > +++ b/fs/fuse/dev.c
> > @@ -315,10 +315,6 @@ void fuse_request_end(struct fuse_req *req)
> >                                 wake_up(&fc->blocked_waitq);
> >                 }
> >
> > -               if (fc->num_background == fc->congestion_threshold && fm->sb) {
> > -                       clear_bdi_congested(fm->sb->s_bdi, BLK_RW_SYNC);
> > -                       clear_bdi_congested(fm->sb->s_bdi, BLK_RW_ASYNC);
> > -               }
> >                 fc->num_background--;
> >                 fc->active_background--;
> >                 flush_bg_queue(fc);
> > @@ -540,10 +536,6 @@ static bool fuse_request_queue_background(struct fuse_req *req)
> >                 fc->num_background++;
> >                 if (fc->num_background == fc->max_background)
> >                         fc->blocked = 1;
> > -               if (fc->num_background == fc->congestion_threshold && fm->sb) {
> > -                       set_bdi_congested(fm->sb->s_bdi, BLK_RW_SYNC);
> > -                       set_bdi_congested(fm->sb->s_bdi, BLK_RW_ASYNC);
> > -               }
> >                 list_add_tail(&req->list, &fc->bg_queue);
> >                 flush_bg_queue(fc);
> >                 queued = true;
> > diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> > index 829094451774..94747bac3489 100644
> > --- a/fs/fuse/file.c
> > +++ b/fs/fuse/file.c
> > @@ -966,6 +966,14 @@ static void fuse_readahead(struct readahead_control *rac)
> >                 struct fuse_io_args *ia;
> >                 struct fuse_args_pages *ap;
> >
> > +               if (fc->num_background >= fc->congestion_threshold &&
> > +                   rac->ra->async_size >= readahead_count(rac))
> > +                       /*
> > +                        * Congested and only async pages left, so skip the
> > +                        * rest.
> > +                        */
> > +                       break;
> 
> Ah, you are taking care of it here...
> 
> Regarding the async part: a potential (corner?) case is if task A is
> reading region X and triggering readahead for region Y and at the same
> time task B is reading region Y.  In the congestion case it can happen
> that non-uptodate pages in Y are truncated off the pagecache while B
> is waiting for them to become uptodate.

I don't think that is a problem.
If the second reader finds the non-uptodate page that is waiting for
attention from the readahead of the first reader, then it will wait
until the page is unlocked.  Once it gets the lock, it will find that
->mapping is NULL (in the middle of filemap_update_page() for example)
and so will drop the page and try again.
Second time around (in e.g. filemap_get_pages()) it will find that there
is no page, and so will call pagE_cache_sync_readahead() which allocates
some pages as appropriate and calls ->readahead() on them.

It might be best for the discarding of pages to having in reverse index
order so that there is no risk of waiting and retrying a series of
times, but I suspect that wouldn't happen very often.

> 
> This shouldn't be too hard to trigger, just need two sequential
> readers of the same file, where one is just ahead of the other.  I'll
> try to do a test program for this case specifically.

Thanks - I'd love to hear of any test results you can produce.

Thanks,
NeilBrown


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
