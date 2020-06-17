Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FC81FC315
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jun 2020 02:57:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jlMOT-0007FA-6h; Wed, 17 Jun 2020 00:57:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <andreas.gruenbacher@gmail.com>) id 1jlMOS-0007F4-Qj
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Jun 2020 00:57:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pEQnZOnPBJbDchwbmEUUZLW0wYE5G6XsMaI0bdt7ET4=; b=K/7C45X0Oz4oTkunZWfas72z0V
 yxxqTh/zBt57daLwbSky/CIw+pD3NvZ958M92sS0KXd5dkxW7ewR6uXd/tWp+aWZ4FukeT23qxQTM
 7hAQaD3pzzggQEVVeblwBDTYMnYQg+w+jj1yPWu739iunkXjxHlLWloILx49PkunHsAE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pEQnZOnPBJbDchwbmEUUZLW0wYE5G6XsMaI0bdt7ET4=; b=NRYUX62dR4vOD/3sOPdU4OrL/M
 D13xHOkwp2DZv2OPy1U7vQ7Z93Vu1fq2VvA4Xbw/faFBLI+R5PDx4iHgTAgxdHBltNZd49QHEmozs
 mOqMIZ6fnyLJKvd5vHtC1h8eUZACetwQAdpo/vTy8eYsyfdPTu97hSZNSH9rp/JJkyAU=;
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jlMOR-0065Lx-Kl
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Jun 2020 00:57:32 +0000
Received: by mail-io1-f66.google.com with SMTP id w18so777210iom.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Jun 2020 17:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pEQnZOnPBJbDchwbmEUUZLW0wYE5G6XsMaI0bdt7ET4=;
 b=Tgh6zIu9SlKqTUKI4lExwCDwAAHFKxlTCElshDvOm1mn12iYD4/DlZalieO/RImp9r
 LOfdrsTqINnmMIAwC9mdceqa/wMyw0Auk9KnlvF4RPcnGvBFJBKHV1DcaOHVsC8ZJlyj
 EWU6xc0nQ7onqRbgGSdDKr9j6yTVOkffRg7YhoJMYTrD0VbKc2wSWqiWF1vx5t2+TlDQ
 0H1Q/EcYDHCiJ7V1yZRhtkqBnN46jbkGbvZxmeW2dZ9q6NUSkrxTmZ4rnGe1GGysIgBd
 ew/2hyGURcasW9W+HnGwp+PirW2QERWh+ZXINj7JdG6J0FXvqGEWoCoh1SMLGG1V6Vsg
 vn8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pEQnZOnPBJbDchwbmEUUZLW0wYE5G6XsMaI0bdt7ET4=;
 b=KFuk4n/KjMuhCE/199krlAd1dazp354HepvDzB3MZQAXGrYdfL1OnqkZNqSoK2SotD
 QdrK+UFlBY6XDQzpvRr/Odi8jGEOitwv2ef/T9ty3E9JweJryW4rU+haoo0oA4bYMsLg
 UCjIx6CqA1fxy/XCa4wx+DwrdhejeGpvWQBs1LnYv/wBoLGfCgbfkTkmvVB5bmNZGg7P
 cQPVL04ao2ORYdM/vBFImI3lhyTMAR7wbBfllthSdmODDOI5qwGPjmFjAVX0jnE9w1wt
 trTXBtwtFvCuMzD4T/jCuVzz04I/82E/YD0KLMUJKCLuYcPAgV+YPCDw6rt6RxMWTUFK
 L0ZA==
X-Gm-Message-State: AOAM531g3dc9NkSkroJPHmx+SykmIkYVW5kX9JexqxXdJrRYxe3UGA6l
 M+jYv2HWC4V1BFNHS3DbSkWsZN6S/kdiuaY/k2I=
X-Google-Smtp-Source: ABdhPJyA0Elba10YCloQoueU20W+3sFrfsTj5mkkigBe/qlBKVyzKzAbesXkHefLeqBLcqq7m6UegL8dAN6/zvs9CGg=
X-Received: by 2002:a5d:9413:: with SMTP id v19mr5708100ion.105.1592355445894; 
 Tue, 16 Jun 2020 17:57:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200414150233.24495-1-willy@infradead.org>
 <20200414150233.24495-17-willy@infradead.org>
 <CAHc6FU4m1M7Tv4scX0UxSiVBqkL=Vcw_z-R7SufL8k7Bw=qPOw@mail.gmail.com>
 <20200617003216.GC8681@bombadil.infradead.org>
In-Reply-To: <20200617003216.GC8681@bombadil.infradead.org>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Wed, 17 Jun 2020 02:57:14 +0200
Message-ID: <CAHpGcMK6Yu0p-FO8CciiySqh+qcWLG-t3hEaUg-rqJnS=2uhqg@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (andreas.gruenbacher[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.66 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.66 listed in list.dnswl.org]
X-Headers-End: 1jlMOR-0065Lx-Kl
Subject: Re: [f2fs-dev] [Cluster-devel] [PATCH v11 16/25] fs: Convert
 mpage_readpages to mpage_readahead
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
Cc: cluster-devel <cluster-devel@redhat.com>,
 linux-ext4 <linux-ext4@vger.kernel.org>,
 Andreas Gruenbacher <agruenba@redhat.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, John Hubbard <jhubbard@nvidia.com>,
 Steven Whitehouse <swhiteho@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 Junxiao Bi <junxiao.bi@oracle.com>, linux-xfs <linux-xfs@vger.kernel.org>,
 William Kucharski <william.kucharski@oracle.com>,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-erofs@lists.ozlabs.org,
 Linux-MM <linux-mm@kvack.org>, ocfs2-devel@oss.oracle.com,
 Bob Peterson <rpeterso@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Am Mi., 17. Juni 2020 um 02:33 Uhr schrieb Matthew Wilcox <willy@infradead.org>:
>
> On Wed, Jun 17, 2020 at 12:36:13AM +0200, Andreas Gruenbacher wrote:
> > Am Mi., 15. Apr. 2020 um 23:39 Uhr schrieb Matthew Wilcox <willy@infradead.org>:
> > > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> > >
> > > Implement the new readahead aop and convert all callers (block_dev,
> > > exfat, ext2, fat, gfs2, hpfs, isofs, jfs, nilfs2, ocfs2, omfs, qnx6,
> > > reiserfs & udf).  The callers are all trivial except for GFS2 & OCFS2.
> >
> > This patch leads to an ABBA deadlock in xfstest generic/095 on gfs2.
> >
> > Our lock hierarchy is such that the inode cluster lock ("inode glock")
> > for an inode needs to be taken before any page locks in that inode's
> > address space.
>
> How does that work for ...
>
> writepage:              yes, unlocks (see below)
> readpage:               yes, unlocks
> invalidatepage:         yes
> releasepage:            yes
> freepage:               yes
> isolate_page:           yes
> migratepage:            yes (both)
> putback_page:           yes
> launder_page:           yes
> is_partially_uptodate:  yes
> error_remove_page:      yes
>
> Is there a reason that you don't take the glock in the higher level
> ops which are called before readhead gets called?  I'm looking at XFS,
> and it takes the xfs_ilock SHARED in xfs_file_buffered_aio_read()
> (called from xfs_file_read_iter).

Right, the approach from the following thread might fix this:

https://lore.kernel.org/linux-fsdevel/20191122235324.17245-1-agruenba@redhat.com/T/#t

Andreas


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
