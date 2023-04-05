Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FC36D838A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Apr 2023 18:21:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pk5sk-0000CA-EL;
	Wed, 05 Apr 2023 16:21:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pk5sg-0000C3-2o
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 16:21:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1KHuoOHO4Pp4VgnkuM2R0x0IoDrKVIg9RgiS8cWT1qw=; b=PKOlB6WMjtvxVOf1RDs/TSWPEA
 kYmPKXMZQFZQb6QiOqmzpaY4v0yL66pzR0+NY5VWB6ZyLnWd6sTECwdnmwoByvBow7X2Byn0zNq44
 rOgHwWLy3I7yaVCBdBsZwx5FFSGXrNAzL7J4E4KDnn9SwuY7XP3y4oZSEw4x9CVEkfXI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=1KHuoOHO4Pp4VgnkuM2R0x0IoDrKVIg9RgiS8cWT1qw=; b=j
 OCLZMpNzvV206FHtUMy5GWBgsrvWm1JYsuDJgyaW+5nrE5KrFimMUtfkI9Z9FIStkaKEK83eivW4x
 AztUk/qTR4WgybfP2ZMatugOTBRq5k/60e9a5IOvKE7TE3n49B4gZ2JEMC0rIKdC9Ctpu1dAKz2/L
 nDhsjew/6lRSsiqg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pk5sg-00G8Ss-FB for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 16:21:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1306C63F85
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  5 Apr 2023 16:21:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACCDBC433EF;
 Wed,  5 Apr 2023 16:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680711660;
 bh=GzJotDDyx4YLgFNr3TBry5o3drZWZVKpvv5e3qKlLUQ=;
 h=From:To:Cc:Subject:Date:From;
 b=DSOaLTHWUE4O2oIJGxfOpv2NKBLHCKFSXvv6mQCkqTsX3FMjQgDSazRsx67j1FA6k
 6iQlM6slmxke4aiKaIHdPDSFYDqq559jMGPHwrw7a0OVco7dv4D7moVwcxTpFRiDl0
 DLMpCIQUQPV/sD6QmYE7DOwWWIW9cDecpS0E606XkLdSfcrmJ8yb4KgI7QQbJllxu0
 JBWz2RVtA1AKHtUe0AdggOim/K4/e+VikwPbI2gFsZXhGm9SlJVWuZGidmhScvMWS5
 DH6Hoc80zXsaW5cHiqkmKWfxiM1qS+fHUJvMezK3TlBRrEEhU+xFmI8u3nLGLsQBqP
 HK/pIreXffQtQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Wed,  5 Apr 2023 22:43:59 +0800
Message-Id: <20230405144359.930253-1-chao@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: xfstest generic/614 fails to run due below reason:
 generic/614
 1s ... [not run] test requires delayed allocation buffered writes The root
 cause is f2fs tags wrong fiemap flag for delay allocated extent. 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pk5sg-00G8Ss-FB
Subject: [f2fs-dev] [PATCH] f2fs: fix to tag FIEMAP_EXTENT_DELALLOC in
 fiemap() for delay allocated extent
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

xfstest generic/614 fails to run due below reason:

generic/614 1s ... [not run] test requires delayed allocation buffered writes

The root cause is f2fs tags wrong fiemap flag for delay allocated
extent.

Quoted from fiemap.h:
FIEMAP_EXTENT_UNKNOWN		0x00000002 /* Data location unknown. */
FIEMAP_EXTENT_DELALLOC		0x00000004 /* Location still pending.
						    * Sets EXTENT_UNKNOWN. */
FIEMAP_EXTENT_UNWRITTEN		0x00000800 /* Space allocated, but
						    * no data (i.e. zero). */

FIEMAP_EXTENT_UNWRITTEN means block address is preallocated, but w/o
been written any data, which status f2fs is not supported now, for all
NEW_ADDR block addresses, it means delay allocated blocks, so let's
tag FIEMAP_EXTENT_DELALLOC instead.

Testcase:
xfs_io -f -c 'pwrite 0 64k' /mnt/f2fs/file;
filefrag -v /mnt/f2fs/file

Output:
- Before
Filesystem type is: f2f52010
Fize of /mnt/f2fs/file is 65536 (16 blocks of 4096 bytes)
 ext:     logical_offset:        physical_offset: length:   expected: flags:
   0:        0..      15:          0..        15:     16:             last,unwritten,merged,eof
/mnt/f2fs/file: 1 extent found

After:
Filesystem type is: f2f52010
File size of /mnt/f2fs/file is 65536 (16 blocks of 4096 bytes)
 ext:     logical_offset:        physical_offset: length:   expected: flags:
   0:        0..      15:          0..         0:      0:             last,unknown_loc,delalloc,eof
/mnt/f2fs/file: 1 extent found

Fixes: 7f63eb77af7b ("f2fs: report unwritten area in f2fs_fiemap")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 359de650772e..3afc9764743e 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1995,7 +1995,10 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 	}
 
 	if (size) {
-		flags |= FIEMAP_EXTENT_MERGED;
+		if (flags & FIEMAP_EXTENT_DELALLOC)
+			phys = 0;
+		else
+			flags |= FIEMAP_EXTENT_MERGED;
 		if (IS_ENCRYPTED(inode))
 			flags |= FIEMAP_EXTENT_DATA_ENCRYPTED;
 
@@ -2035,7 +2038,7 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 				size += blks_to_bytes(inode, 1);
 			}
 		} else if (map.m_flags & F2FS_MAP_DELALLOC) {
-			flags = FIEMAP_EXTENT_UNWRITTEN;
+			flags = FIEMAP_EXTENT_DELALLOC;
 		}
 
 		start_blk += bytes_to_blks(inode, size);
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
