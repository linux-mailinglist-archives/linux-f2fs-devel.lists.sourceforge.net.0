Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBAB4C8D16
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Mar 2022 14:56:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nP2zS-0000b2-KV; Tue, 01 Mar 2022 13:56:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <miklos@szeredi.hu>) id 1nP2zP-0000ar-M0
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 01 Mar 2022 13:56:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QG2k2eItwE4VAk3PGGex6QHZy3T0xaD3lTCoY/HpYco=; b=QVyIOi7ye3e95HGg+PSEqIwPjW
 mb5kbevbnKVUIh2ZxgjjC078YTcrRivwYF4AUyWGSjonJSOYW32gC82Nck+Vdj+6R4AzcsLFvPNvd
 uK+zeQeDwNJ/vyBHMHd4IVSGe0AJjDnORzSZ71NwMq77wyuIlhv356lHzfjQjj/lvecc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QG2k2eItwE4VAk3PGGex6QHZy3T0xaD3lTCoY/HpYco=; b=fQ4diY3VZmFvBRDHmpoi8UMvCJ
 xN8oi4q3wljdQ39/9bkfpF4CXdiGOTr4RoANbavNSx5nyIyi0YVkZDQoZzHt0qthoxLoMUESTtBNB
 Gsnp5DxtqqqVV9W7BExJXr7/c09mb7Ph85CKBbpDeq3uHqxvSRlyWjCa3uYJ7/8zu3D4=;
Received: from mail-pf1-f171.google.com ([209.85.210.171])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nP2zM-001Idf-7a
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 01 Mar 2022 13:56:30 +0000
Received: by mail-pf1-f171.google.com with SMTP id y11so14271041pfa.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 01 Mar 2022 05:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szeredi.hu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QG2k2eItwE4VAk3PGGex6QHZy3T0xaD3lTCoY/HpYco=;
 b=ZQjeLrdHbWEck4K6RpeBY4QI1uE5CcoVwO5sZTKvbH0jCtE/epL+AV1J2T6nTvQB7B
 /yPS0KVOUZAhUGfHU54H1jmlgYJUgdfLLmM3xmB3rY9RzzFoWNFI2Zci83Jzu2Okp0E4
 AJRAtv/WKjpa/XnIsui/qXUZ2c4GyPza8OAZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QG2k2eItwE4VAk3PGGex6QHZy3T0xaD3lTCoY/HpYco=;
 b=sa4C1ZVjo07rViE4tDCtKQxeKNOmoA2AZKgIC9nUWwsIjQNoOCeoT+v1Mtf0maWyn4
 XWn2N0tXAPUerwgWQBAL+dbbmge+xN8SXCbqhawN+nrmBHN3thI1mgI9zoJ5fsLGtW4+
 ytNs2Ybx1qoF/aPtaySdIW7XnwxicDMEnA2HmsJsUbR3xFknD9crMwfGaMjihkcbmfCY
 eTTnZxxeYVhcujoqgobAwIL3u50LJwoTxjDLie+b8f/EgaNqZnmSQDXxWf4YBuFrRS+s
 giLk+sCjum6eNGHgfrSOXKzNmIrqVAlKjbv84UwmXg5Q+YPPBMIPbScya50pO3dJp5yw
 7DtA==
X-Gm-Message-State: AOAM5327OKEzEe8zTdbBG3MCux3jSW28ieAscnJe3q5vz+q+2EuPqbgY
 FVdCeLnV5U3vfwGedoGnLRWynDvgIebMrPsaunNlbWtff6k=
X-Google-Smtp-Source: ABdhPJygTkLKJoxpKoMnQComCB9wJUKiAgXMWJlY4Oqe0COwyi0CYb7/OKDFQvAmbtgocYjrHTjH3LgZXlKpwAjqw/Q=
X-Received: by 2002:a92:cf12:0:b0:2be:3a27:67c7 with SMTP id
 c18-20020a92cf12000000b002be3a2767c7mr23363367ilo.187.1646139635155; Tue, 01
 Mar 2022 05:00:35 -0800 (PST)
MIME-Version: 1.0
References: <164549971112.9187.16871723439770288255.stgit@noble.brown>
 <164549983736.9187.16755913785880819183.stgit@noble.brown>
In-Reply-To: <164549983736.9187.16755913785880819183.stgit@noble.brown>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 1 Mar 2022 14:00:24 +0100
Message-ID: <CAJfpegs=DhCO62EFV0Q_i2fmqJnziJy1t4itP9deS=FuWEA=TQ@mail.gmail.com>
To: NeilBrown <neilb@suse.de>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, 22 Feb 2022 at 04:18,
 NeilBrown <neilb@suse.de> wrote:
 > > If ->readpages doesn't process all the pages, then it is best to act
 as > though they weren't requested so that a subsequent readahea [...] 
 Content analysis details:   (0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.171 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.171 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
X-Headers-End: 1nP2zM-001Idf-7a
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

On Tue, 22 Feb 2022 at 04:18, NeilBrown <neilb@suse.de> wrote:
>
> If ->readpages doesn't process all the pages, then it is best to act as
> though they weren't requested so that a subsequent readahead can try
> again.
> So:
>   - remove any 'ahead' pages from the page cache so they can be loaded
>     with ->readahead() rather then multiple ->read()s
>   - update the file_ra_state to reflect the reads that were actually
>     submitted.
>
> This allows ->readpages() to abort early due e.g.  to congestion, which
> will then allow us to remove the inode_read_congested() test from
> page_Cache_async_ra().
>
> Signed-off-by: NeilBrown <neilb@suse.de>
> ---
>  mm/readahead.c |   19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/mm/readahead.c b/mm/readahead.c
> index 73b2bc5302e0..8a97bd408cf6 100644
> --- a/mm/readahead.c
> +++ b/mm/readahead.c
> @@ -104,7 +104,13 @@
>   * for necessary resources (e.g.  memory or indexing information) to
>   * become available.  Pages in the final ``async_size`` may be
>   * considered less urgent and failure to read them is more acceptable.
> - * They will eventually be read individually using ->readpage().
> + * In this case it is best to use delete_from_page_cache() to remove the
> + * pages from the page cache as is automatically done for pages that
> + * were not fetched with readahead_page().  This will allow a
> + * subsequent synchronous read ahead request to try them again.  If they
> + * are left in the page cache, then they will be read individually using
> + * ->readpage().
> + *
>   */
>
>  #include <linux/kernel.h>
> @@ -226,8 +232,17 @@ static void read_pages(struct readahead_control *rac, struct list_head *pages,
>
>         if (aops->readahead) {
>                 aops->readahead(rac);
> -               /* Clean up the remaining pages */
> +               /*
> +                * Clean up the remaining pages.  The sizes in ->ra
> +                * maybe be used to size next read-ahead, so make sure
> +                * they accurately reflect what happened.
> +                */
>                 while ((page = readahead_page(rac))) {
> +                       rac->ra->size -= 1;
> +                       if (rac->ra->async_size > 0) {
> +                               rac->ra->async_size -= 1;
> +                               delete_from_page_cache(page);
> +                       }

Does the  above imply that filesystem should submit at least ra->size
pages, regardless of congestion?

Thanks,
Miklos


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
