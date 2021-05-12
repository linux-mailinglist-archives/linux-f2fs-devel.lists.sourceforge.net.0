Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4719837BEC4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 May 2021 15:47:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lgpCY-0003tW-7M; Wed, 12 May 2021 13:47:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1lgpCS-0003sO-N2
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 May 2021 13:46:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BsEFJERiVdoUYfzPc0MQwiR+Xi2Dt9ONSRObee+uovk=; b=c3uhqGtdotjdep/YrRcDteBuOT
 GDOPq5d6NbpFmWRZk1c9ZjHS3MH4XPgOnPp8mplIDz+JSKAOctxdgmseRYqaU1UykIskLt2tsHXRE
 aahSlLWvyuqCXRcRzuubpSddfV3zdoRH6iLBFU6NKFHynE++zlugRDwMiLuPC+THVphY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BsEFJERiVdoUYfzPc0MQwiR+Xi2Dt9ONSRObee+uovk=; b=Q+SmO0prOzYfEeRYRbrHS2domb
 B/os1HzEIzVPwTVY7FGcQRtaY6qADlL42kNWeAEgzQQPUhF6+AcMI+pelBOBw8CYvoJ3JAXbsFCG6
 RQaedR2TOBWLCaoyIBfVBwIdnvQirpEarkURsnT+XeFCbQsema22qMc3/C1sntzitSsg=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lgpCK-005UJG-92
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 May 2021 13:46:58 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BD05EB1A6;
 Wed, 12 May 2021 13:46:32 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 0930B1F2B6C; Wed, 12 May 2021 15:46:32 +0200 (CEST)
From: Jan Kara <jack@suse.cz>
To: <linux-fsdevel@vger.kernel.org>
Date: Wed, 12 May 2021 15:46:18 +0200
Message-Id: <20210512134631.4053-10-jack@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210512101639.22278-1-jack@suse.cz>
References: <20210512101639.22278-1-jack@suse.cz>
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.cz]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lgpCK-005UJG-92
Subject: [f2fs-dev] [PATCH 10/11] ceph: Fix race between hole punch and page
 fault
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
Cc: linux-cifs@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 linux-ext4@vger.kernel.org, Ted Tso <tytso@mit.edu>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 Steve French <sfrench@samba.org>, Dave Chinner <david@fromorbit.com>,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 Miklos Szeredi <miklos@szeredi.hu>, Jan Kara <jack@suse.cz>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Johannes Thumshirn <jth@kernel.org>, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Ceph has a following race between hole punching and page fault:

CPU1                                  CPU2
ceph_fallocate()
  ...
  ceph_zero_pagecache_range()
                                      ceph_filemap_fault()
                                        faults in page in the range being
                                        punched
  ceph_zero_objects()

And now we have a page in punched range with invalid data. Fix the
problem by using mapping->invalidate_lock similarly to other
filesystems. Note that using invalidate_lock also fixes a similar race
wrt ->readpage().

CC: Jeff Layton <jlayton@kernel.org>
CC: ceph-devel@vger.kernel.org
Signed-off-by: Jan Kara <jack@suse.cz>
---
 fs/ceph/addr.c | 9 ++++++---
 fs/ceph/file.c | 2 ++
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index c1570fada3d8..6d868faf97b5 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -1401,9 +1401,11 @@ static vm_fault_t ceph_filemap_fault(struct vm_fault *vmf)
 		ret = VM_FAULT_SIGBUS;
 	} else {
 		struct address_space *mapping = inode->i_mapping;
-		struct page *page = find_or_create_page(mapping, 0,
-						mapping_gfp_constraint(mapping,
-						~__GFP_FS));
+		struct page *page;
+
+		down_read(&mapping->invalidate_lock);
+		page = find_or_create_page(mapping, 0,
+				mapping_gfp_constraint(mapping, ~__GFP_FS));
 		if (!page) {
 			ret = VM_FAULT_OOM;
 			goto out_inline;
@@ -1424,6 +1426,7 @@ static vm_fault_t ceph_filemap_fault(struct vm_fault *vmf)
 		vmf->page = page;
 		ret = VM_FAULT_MAJOR | VM_FAULT_LOCKED;
 out_inline:
+		up_read(&mapping->invalidate_lock);
 		dout("filemap_fault %p %llu read inline data ret %x\n",
 		     inode, off, ret);
 	}
diff --git a/fs/ceph/file.c b/fs/ceph/file.c
index 77fc037d5beb..91693d8b458e 100644
--- a/fs/ceph/file.c
+++ b/fs/ceph/file.c
@@ -2083,6 +2083,7 @@ static long ceph_fallocate(struct file *file, int mode,
 	if (ret < 0)
 		goto unlock;
 
+	down_write(&inode->i_mapping->invalidate_lock);
 	ceph_zero_pagecache_range(inode, offset, length);
 	ret = ceph_zero_objects(inode, offset, length);
 
@@ -2095,6 +2096,7 @@ static long ceph_fallocate(struct file *file, int mode,
 		if (dirty)
 			__mark_inode_dirty(inode, dirty);
 	}
+	up_write(&inode->i_mapping->invalidate_lock);
 
 	ceph_put_cap_refs(ci, got);
 unlock:
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
