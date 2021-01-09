Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C4B2EFE63
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  9 Jan 2021 09:00:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ky9Am-0007Ft-Hi; Sat, 09 Jan 2021 08:00:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1ky9Aj-0007E6-9O
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 Jan 2021 08:00:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=itaVJj6NmccBY1mPV2KWgqqNrszR8zsOuv7cuRe89Is=; b=jY88IRod+qqqKythHGC3SyJtyJ
 6uu6RpkXPBHlFzKW1ugN5v2nFDA8sjAcmYupOLLdSOXZDAFBjpq3FMKUU38lFC40xXf9RM3iceXiJ
 /7u+w470ieZWzuDATGpdKmmOwzyPaA/De8x8dxD5xZWhfZR7n3TzYUEiHnTwsvvCkeG8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=itaVJj6NmccBY1mPV2KWgqqNrszR8zsOuv7cuRe89Is=; b=DG+JhxAbn7fcij064oLkhEOF4I
 jYirCLIPn1/UIoc6vj2Y+BoCTh+dQn4phoyepK7BQUq2jSRSp4KwFFmI4M40f1w/8PLA4bV+UFjme
 xPNU+3OGmYDZZRjuhZiPLRKqNugwo0zLRVsER7mLJqH6W9IsVtdRjT6EoBm9HlBKD4Cw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ky9AS-002qgX-DL
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 Jan 2021 08:00:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D30123A82;
 Sat,  9 Jan 2021 07:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610179187;
 bh=BCwJUP1PxHm+O0jkqtVgewHXBIFwwuWoM+6SlzLbD1w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ArXO1T/oIWyOTfDCrsPPsTG1yBnlHnDCu6k2UEfX488lMMwJfExpGvUj0SUXv+FxB
 m4ezNQbMe1EjoHp4x6xZAqwQnJSutFewWYmT15xz2E7W9rZge00zn1wiBTkHoKkjpX
 h0q3ZUNyUClP4o0l4Adozv5UZU1xRDgRi4a8KYTobDCDPUem4XuPgUkAUZRLvilK0p
 eqkCQUmAzzvv1/uV2gd56CRPjA31IT7rcxaRnJAIkeJK674YuHSEp/arfRElObux6C
 kowNTi50o7F/O3FyN+dOUKU+XyOqSdMy6/oSBna+IAyh0gZNZTrxjNpxTPIXXDY7Ue
 Hj9ligQjmJIVg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Fri,  8 Jan 2021 23:59:03 -0800
Message-Id: <20210109075903.208222-13-ebiggers@kernel.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210109075903.208222-1-ebiggers@kernel.org>
References: <20210109075903.208222-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lst.de]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ky9AS-002qgX-DL
Subject: [f2fs-dev] [PATCH v2 12/12] xfs: remove a stale comment from
 xfs_file_aio_write_checks()
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
Cc: linux-xfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Christoph Hellwig <hch@lst.de>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

The comment in xfs_file_aio_write_checks() about calling file_modified()
after dropping the ilock doesn't make sense, because the code that
unconditionally acquires and drops the ilock was removed by
commit 467f78992a07 ("xfs: reduce ilock hold times in
xfs_file_aio_write_checks").

Remove this outdated comment.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/xfs/xfs_file.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index 5b0f93f738372..4927c6653f15d 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -389,12 +389,6 @@ xfs_file_aio_write_checks(
 	} else
 		spin_unlock(&ip->i_flags_lock);
 
-	/*
-	 * Updating the timestamps will grab the ilock again from
-	 * xfs_fs_dirty_inode, so we have to call it after dropping the
-	 * lock above.  Eventually we should look into a way to avoid
-	 * the pointless lock roundtrip.
-	 */
 	return file_modified(file);
 }
 
-- 
2.30.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
