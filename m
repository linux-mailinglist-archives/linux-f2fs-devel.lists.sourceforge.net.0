Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE3B3C9FD4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jul 2021 15:41:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m41bm-0002PM-CP; Thu, 15 Jul 2021 13:40:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jack@suse.cz>) id 1m41bk-0002P2-Mc
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 15 Jul 2021 13:40:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aHhQqe8KTjBCv9r4mi6xe2At5YRjoevCFxA6zjCOvEc=; b=WIIBjuYCsaFSeMkTMDJSkfWhNt
 4U+fge2jV3/SsSdbdhgLV0u59hPTuWkK970SA12ZYBMVOAGu1KOVMRUyZl4ApP+Bisd72+WCXW35l
 i8q3iWZNrord6Id2TTVED42El8TkEByv9wmybbhFexxSjWMYRasTtp/BgFm3u6Lyuo6U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aHhQqe8KTjBCv9r4mi6xe2At5YRjoevCFxA6zjCOvEc=; b=WT7aZS4kNJZFcnikmJ4opG/fhb
 /M5h22WB212mn87EWA3lpS8bDO/ew7XBegSUtKt5m5DH1wtHajHdX1TGtdGk/6Sus32WLAHBnuPR+
 GlflTImGMT+dNMBVzS3d8kpbGTvGtSQCEU1A9rw0YX5vpxwOwh+S3fOpIkEcajQ0DsJU=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m41bd-009HUj-Oj
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 15 Jul 2021 13:40:56 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 8C5E920303;
 Thu, 15 Jul 2021 13:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626356433; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aHhQqe8KTjBCv9r4mi6xe2At5YRjoevCFxA6zjCOvEc=;
 b=RuJfucQ18UcdWSlSoKBS0R02LQqU1/2ikN5fVOsUopTm5nVBDrhxzwoexmEPqEfDpiFR/f
 h+qcLI/KXCIM5K9dG6BkjTUF9Jd4Z85o20OQyK28wK2Z/X0BOJ8jCdlBKz20WHBt1bCCVb
 moM3VmI061wTH+Chtl1RODrrlZNEyR0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626356433;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aHhQqe8KTjBCv9r4mi6xe2At5YRjoevCFxA6zjCOvEc=;
 b=okfc6hssx0z1h1XKdCgUrgiqbuGqpuR+6jkXPziR0sbZUxXCsDdVf5LpJxwHEQW8SJ8h69
 h5gs7zxRdmnrUeCg==
Received: from quack2.suse.cz (unknown [10.100.200.198])
 by relay2.suse.de (Postfix) with ESMTP id 75781A3B9B;
 Thu, 15 Jul 2021 13:40:33 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 34DDA1E110A; Thu, 15 Jul 2021 15:40:33 +0200 (CEST)
From: Jan Kara <jack@suse.cz>
To: <linux-fsdevel@vger.kernel.org>
Date: Thu, 15 Jul 2021 15:40:24 +0200
Message-Id: <20210715134032.24868-14-jack@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210715133202.5975-1-jack@suse.cz>
References: <20210715133202.5975-1-jack@suse.cz>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1533; h=from:subject;
 bh=1e9BARQoajJDSgUdYORenFPF3ecMZ7Jduf79ehs8h7w=;
 b=owGbwMvMwME4Z+4qdvsUh5uMp9WSGBI+WB1n1Ns3Y96Kydy5/1TSyzp5XkorV0pMDjoluy51bumy
 pHq5TkZjFgZGDgZZMUWW1ZEXta/NM+raGqohAzOIlQlkCgMXpwBMZOcODoZWJVaREsa87UFlLCyKym
 6Jz7/Om7Llk3eCg4bKo9Mz5yQv57j/oybvSLtrzHthh0TB2CtnGXOMp2jfvbtdVV/OezJjU7votVnG
 llXaMuz16cwaKVErlmcwc4VzuIdkbl1902Oq6ZOkT8+s+dUE8pe2Nt9tuBa4U21Oycx5efGnpy855L
 RFINhWyEgzMmXDxUCTm0cq2aS+nGqerlR/7EpmjLGTVcWK6GtLV8TYd8XMF9/G6rZlz8qXj1k/yy04
 L/70Rm151ZWv8u8jkhOtnzn1qzf+lBRWTmXmyBF9tOJVo+OL20Kxc9zFGqZFbTe1Tpx7f6aT79Rz5+
 KYW3iC+t5EbhGRPfjkj5xdzfJSAA==
X-Developer-Key: i=jack@suse.cz; a=openpgp;
 fpr=93C6099A142276A28BBE35D815BC833443038D8C
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samba.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m41bd-009HUj-Oj
Subject: [f2fs-dev] [PATCH 14/14] cifs: Fix race between hole punch and page
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
Cc: linux-xfs@vger.kernel.org, Ted Tso <tytso@mit.edu>,
 linux-cifs@vger.kernel.org, "Darrick J. Wong" <djwong@kernel.org>,
 Steve French <sfrench@samba.org>, Dave Chinner <david@fromorbit.com>,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 Jan Kara <jack@suse.cz>, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org
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
index e4c8f603dd58..458c546ce8cd 100644
--- a/fs/cifs/smb2ops.c
+++ b/fs/cifs/smb2ops.c
@@ -3588,6 +3588,7 @@ static long smb3_punch_hole(struct file *file, struct cifs_tcon *tcon,
 		return rc;
 	}
 
+	filemap_invalidate_lock(inode->i_mapping);
 	/*
 	 * We implement the punch hole through ioctl, so we need remove the page
 	 * caches first, otherwise the data may be inconsistent with the server.
@@ -3605,6 +3606,7 @@ static long smb3_punch_hole(struct file *file, struct cifs_tcon *tcon,
 			sizeof(struct file_zero_data_information),
 			CIFSMaxBufSize, NULL, NULL);
 	free_xid(xid);
+	filemap_invalidate_unlock(inode->i_mapping);
 	return rc;
 }
 
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
