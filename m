Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1969B20056A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Jun 2020 11:40:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jmDVC-0000h9-Nu; Fri, 19 Jun 2020 09:40:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <agruenba@redhat.com>) id 1jmDVB-0000gk-CK
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 19 Jun 2020 09:40:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=owa0qFAPsKpu74jXgvEbAGd5tDvX5jYwWR6WKxTC83E=; b=DxkSq7Wd1iakkbdcaXQ7mhXdAd
 yMTeUwKYiqwVUwn1IpgCgnhfVaGpb7M/2+H5I+iIHPlzOlDsK6uEpW6NZAP5VrS27En8d0PQgxo1q
 AKINXgTK5u/whjE9LbfQpEQ/KWLbkuWTauXFspUWYNnXjPesJQbOR8eHj3PuT7tkXDMs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=owa0qFAPsKpu74jXgvEbAGd5tDvX5jYwWR6WKxTC83E=; b=P
 Vcex9Xiazl0clAg6w+pzIKYio5JXCZDq8IAcnTp8ZRL1jSy1bgWRswmQeVqxb9ufLVyEHUxpqMFkd
 0ApcKirhklJImjPu82d7hjRbqSV3/OFR1L3sYWa/50lA8L62yqCxSrLLygxjrBvnhKKo1YZsp4djH
 zKkrxcXSgcSnqNAE=;
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.92.2)
 id 1jmDV9-009rmX-Rg
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 19 Jun 2020 09:40:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592559586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=owa0qFAPsKpu74jXgvEbAGd5tDvX5jYwWR6WKxTC83E=;
 b=CzuMDJKrIk4NcOZh/icmX3Kuzi/b+3kayq7WRD0/HO22uZw6dJjERw5tdLkD1tfEkdL0W1
 aJTybG7PLn+r2nVQUKvhDTfPYBrSWQC3I4Uq2lsskm75po+wM/v2rmAOH3QpHY0Fjk+vdW
 0hqfGw2h4p7mV5YR9YCJsr9RTVh7vXw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-E2DQ6Q59N3WWMbSJVCOn4A-1; Fri, 19 Jun 2020 05:39:29 -0400
X-MC-Unique: E2DQ6Q59N3WWMbSJVCOn4A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE7B8107B265;
 Fri, 19 Jun 2020 09:39:26 +0000 (UTC)
Received: from max.home.com (unknown [10.40.195.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E9A15D9E8;
 Fri, 19 Jun 2020 09:39:18 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Matthew Wilcox <willy@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 19 Jun 2020 11:39:14 +0200
Message-Id: <20200619093916.1081129-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [207.211.31.120 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [207.211.31.120 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jmDV9-009rmX-Rg
Subject: [f2fs-dev] [RFC PATCH 0/2] gfs2 readahead regression in v5.8-rc1
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
Cc: cluster-devel@redhat.com, linux-ext4@vger.kernel.org,
 Andreas Gruenbacher <agruenba@redhat.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, John Hubbard <jhubbard@nvidia.com>,
 linux-kernel@vger.kernel.org, Junxiao Bi <junxiao.bi@oracle.com>,
 linux-xfs <linux-xfs@vger.kernel.org>,
 William Kucharski <william.kucharski@oracle.com>,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-erofs@lists.ozlabs.org,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello,

can the two patches in this set still be considered for v5.8?

Commit d4388340ae0b ("fs: convert mpage_readpages to mpage_readahead")
which converts gfs2 and other filesystems to use the new ->readahead
address space operation is leading to deadlocks between the inode glocks
and page locks: ->readahead is called with the pages to readahead
already locked.  When gfs2_readahead then tries to lock the associated
inode glock, another process already holding the inode glock may be
trying to lock the same pages.

We could work around this in gfs by using a LM_FLAG_TRY lock in
->readahead for now.  The real reason for this deadlock is that gfs2
shouldn't be taking the inode glock in ->readahead in the first place
though, so I'd prefer to fix this "properly" instead.  Unfortunately,
this depends on a new IOCB_CACHED flag for generic_file_read_iter.

A previous version was posted in November:

https://lore.kernel.org/linux-fsdevel/20191122235324.17245-1-agruenba@redhat.com/

Thanks,
Andreas

Andreas Gruenbacher (2):
  fs: Add IOCB_CACHED flag for generic_file_read_iter
  gfs2: Rework read and page fault locking

 fs/gfs2/aops.c     | 27 ++------------------
 fs/gfs2/file.c     | 61 ++++++++++++++++++++++++++++++++++++++++++++--
 include/linux/fs.h |  1 +
 mm/filemap.c       | 16 ++++++++++--
 4 files changed, 76 insertions(+), 29 deletions(-)


base-commit: af42d3466bdc8f39806b26f593604fdc54140bcb
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
