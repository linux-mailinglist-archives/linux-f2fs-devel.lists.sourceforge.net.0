Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1283C3C60F8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jul 2021 18:56:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m2zEP-0000Dq-S0; Mon, 12 Jul 2021 16:56:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1m2zEO-0000D3-Df
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 12 Jul 2021 16:56:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aHhQqe8KTjBCv9r4mi6xe2At5YRjoevCFxA6zjCOvEc=; b=E1iEArWF6yj3aLGdaZUDpYEKI8
 OAETCKK6JPy3ztMzsDIrxliiDrCFlR9LD5vNwfFC2tKwPn4deSNJ/iPrDljWXugdCpshIjEcu1Tvz
 MZT0lSEkVhj4nBleNiqV/kFp5I785j0z2FMQpv0J1KO/JUqJpAzsCxcOhzwZRYP0il5k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aHhQqe8KTjBCv9r4mi6xe2At5YRjoevCFxA6zjCOvEc=; b=IhVJ7gCtmfAJ9iHmTaKu2FH55l
 XV77/ubiIlysQfM07U28Vjrcb6+8hF4ingpNK02IjAbtIYEDsZbZ3dWzqcn06wb25aWTjPD7cUJO3
 GNJ+7F5SVMQrR7qxTnczZcFvAtlL6S01tBK3YxGijzUfHQP1jwc0kCE0M6BgJn118yk0=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m2zEI-0001ym-AO
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 12 Jul 2021 16:56:32 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 4BC5F2212F;
 Mon, 12 Jul 2021 16:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626108970; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aHhQqe8KTjBCv9r4mi6xe2At5YRjoevCFxA6zjCOvEc=;
 b=ZESWo0+jV0zYOW8UBnDvLHP40wD4Mizkdi3GL2a5tQw4l+5H/3r+WCw8lG38ognWMuzAir
 tcOcmkCMPX37xr1NU0VCTckY3UvvDDj7tTD3Bu1lsU8C3dGjMa8KO/+dkjOoL7uaQvat0m
 liWED2/F46K5fur5cg9oAjmpvcw++80=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626108970;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aHhQqe8KTjBCv9r4mi6xe2At5YRjoevCFxA6zjCOvEc=;
 b=nwaFUtZvJiGfTCuyP2yCuDyUqORKcbdPqKWTp4GjFiBFK+dHUOfXJaNP2sLvWW4bNywxzi
 Vs5yDOLGBuV5+AAg==
Received: from quack2.suse.cz (unknown [10.100.224.230])
 by relay2.suse.de (Postfix) with ESMTP id 34EB6A3B8C;
 Mon, 12 Jul 2021 16:56:10 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id EADE31F2CE6; Mon, 12 Jul 2021 18:56:09 +0200 (CEST)
From: Jan Kara <jack@suse.cz>
To: <linux-fsdevel@vger.kernel.org>
Date: Mon, 12 Jul 2021 18:56:05 +0200
Message-Id: <20210712165609.13215-14-jack@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210712163901.29514-1-jack@suse.cz>
References: <20210712163901.29514-1-jack@suse.cz>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1533; h=from:subject;
 bh=1e9BARQoajJDSgUdYORenFPF3ecMZ7Jduf79ehs8h7w=;
 b=owEBbQGS/pANAwAIAZydqgc/ZEDZAcsmYgBg7HQkAS6+mJ6okwtt/iRndokM6RsjeRiTUsodrmWd
 daZifx6JATMEAAEIAB0WIQSrWdEr1p4yirVVKBycnaoHP2RA2QUCYOx0JAAKCRCcnaoHP2RA2a2dB/
 sGPl7L7iNC+Ygp3aaAb8TuC+CK7Fa16RT+41tzwVRlQcnfmi7CVZIqfg9wn8dFg+Rwo985dKOjqKBC
 Rkbj05bjkHH9zmlZ5YZ+X92bgSHksva5hcdPkI3PM5v6sCXvIMGdeKJvQ7OUyLqoS8vAwHFZCA6FfN
 oKBhzEjKFekquNo/8GdftAgbDSO70kSs2v1iR2SpAHq/DWr1NsJ0/SUel0YbkYCJVK/t1Jybo0fOS3
 hzlpdrYgSafKZV1HZ762tDktI+gjO6r/m5sW8bVZitIHHqVxrctKOIPAGfL2NMRnxMzWVNlMBMdoo7
 Y6A0YzNG5g9ezVbk8Vutbf63fL3esc
X-Developer-Key: i=jack@suse.cz; a=openpgp;
 fpr=93C6099A142276A28BBE35D815BC833443038D8C
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1m2zEI-0001ym-AO
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
