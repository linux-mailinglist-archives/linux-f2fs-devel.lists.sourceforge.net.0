Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C1870390311
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 May 2021 15:51:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1llXT5-0001D2-Nj; Tue, 25 May 2021 13:51:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1llXT3-0001Bk-JP
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 May 2021 13:51:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jZlfk4vwF2p32yW05HQcA1IZqYim5+F109uIplXVw+8=; b=efYsePlDDoBGKjrVAjHJPpFXzl
 XwHwLSVMPwetMhhZMO4e9iqPIBcTFmF4LwDC8iCYSHcYYqjthsUI+DCw4+xf8YuK9NutJL1h7hIr0
 1Jb4d/se5ohgOa3i1ikZuyuRabegtG60cvPA0vDmfmljwzp6EBOSTP7XG1eCi5jQl8ac=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jZlfk4vwF2p32yW05HQcA1IZqYim5+F109uIplXVw+8=; b=iV71FnBUu1AARj/nSwHBvrMQyg
 6cEexn+ofcUv81B/sesgQUg3uSL9uDyyPDoF3PPGK6Qk82m7VamopRGBeYJU3jrYCcRxfba4Nu6Lj
 ZK9GoMJHZVkMkJEiUKHtV2T3T50lBKASQkdgb6Slty6I1gsDCxgYS/ounZpIc99YzRLM=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1llXSz-005Nfp-Bu
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 May 2021 13:51:34 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1621950662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jZlfk4vwF2p32yW05HQcA1IZqYim5+F109uIplXVw+8=;
 b=DRHNjtVyi2P6ez+bSS1jJfysTJfmXmuAc7XaBIitSzh1v+NvVKFi/bS6NgZ9EQnzxGxZLQ
 RQYD2oowFxeZBnkgdxqt5tTtXVYuiKBPC0w8egFh1kAA8P1jUsRdS9alqol2+nMZqEXqey
 Kl+tANswz9b7fD0NioVdMnX5SE2EAf4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1621950662;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jZlfk4vwF2p32yW05HQcA1IZqYim5+F109uIplXVw+8=;
 b=9rURY4pla4pmyo+OPI1H2/hqtWG7wnDmBHyn2VRduoODR8GrNGuKuKRNMWAy3XEbVdDMtd
 l2WgpuM9iITZKtAA==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 47E04AF27;
 Tue, 25 May 2021 13:51:02 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 45E1F1F2CBE; Tue, 25 May 2021 15:51:00 +0200 (CEST)
From: Jan Kara <jack@suse.cz>
To: <linux-fsdevel@vger.kernel.org>
Date: Tue, 25 May 2021 15:50:50 +0200
Message-Id: <20210525135100.11221-13-jack@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210525125652.20457-1-jack@suse.cz>
References: <20210525125652.20457-1-jack@suse.cz>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1llXSz-005Nfp-Bu
Subject: [f2fs-dev] [PATCH 13/13] cifs: Fix race between hole punch and page
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

Cifs has a following race between hole punching and page fault:

CPU1                                            CPU2
smb3_fallocate()
  smb3_punch_hole()
    truncate_pagecache_range()
                                                filemap_fault()
                                                  - loads old data into the
                                                    page cache
    SMB2_ioctl(..., FSCTL_SET_ZERO_DATA, ...)

And now we have stale data in the page cache. Fix the problem by locking
out faults (as well as reads) using mapping->invalidate_lock while hole
punch is running.

CC: Steve French <sfrench@samba.org>
CC: linux-cifs@vger.kernel.org
Signed-off-by: Jan Kara <jack@suse.cz>
---
 fs/cifs/smb2ops.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
index dd0eb665b680..b0a0f8b34add 100644
--- a/fs/cifs/smb2ops.c
+++ b/fs/cifs/smb2ops.c
@@ -3579,6 +3579,7 @@ static long smb3_punch_hole(struct file *file, struct cifs_tcon *tcon,
 		return rc;
 	}
 
+	down_write(&inode->i_mapping->invalidate_lock);
 	/*
 	 * We implement the punch hole through ioctl, so we need remove the page
 	 * caches first, otherwise the data may be inconsistent with the server.
@@ -3596,6 +3597,7 @@ static long smb3_punch_hole(struct file *file, struct cifs_tcon *tcon,
 			sizeof(struct file_zero_data_information),
 			CIFSMaxBufSize, NULL, NULL);
 	free_xid(xid);
+	up_write(&inode->i_mapping->invalidate_lock);
 	return rc;
 }
 
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
