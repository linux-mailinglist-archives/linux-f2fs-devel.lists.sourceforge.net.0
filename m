Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6222F3970
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Jan 2021 20:04:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kzOy8-0005gi-SD; Tue, 12 Jan 2021 19:04:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kzOy7-0005gR-2g
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Jan 2021 19:04:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eayOnzYxBxMQaZ/Hp+Qxcx4VXfb0GVw/Xz7jdVH0HOg=; b=fbPMBQordPyv9SgnPxiBTj6xpK
 aB2dfrEz7EQnd8AcOIUl3J8ikVGfc/QefhgIlBNoDGD6rI5hGvaQjXuePm9U77g9y6dDgRRfzqt+S
 RtuuCYYqyocp68zuco1eKq1sdcFnXBAOQX5N53b0fhPxKBx0k8F8TxoaJokGEU+t9HCE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eayOnzYxBxMQaZ/Hp+Qxcx4VXfb0GVw/Xz7jdVH0HOg=; b=CCkXIv0NaYgdzn1tbp5Czl+6hN
 b5HQBXPuWrzwLuqUW8oygwxajJRTUl07/6qTzu+zpf128C3gtiEKGiC9yplqvUPfaaKk+IMStMNrM
 EqwrCKodTptnW8iyWfKIFIr4yGaTgVNHuX3dGRD2LlQBXQWNKvYTaR8xxwkejAC5rZ4Q=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kzOy0-00Emy9-BM
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Jan 2021 19:04:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DB97D2312A;
 Tue, 12 Jan 2021 19:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610478251;
 bh=iS9NaJbF6WGlfwyaEVylnwoccWtqZ29B1EFuOerPM2c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R9W+OfB/I0d3D9RbfhDSKnCAhk4DCLkG9op4kyVEfKGUF/Pzpt6RoHWPlcr2V/XHp
 EV0Y3n+nH1cwsTI1KtLNKJZlgKwWAMTLtH6+/i1rp58AtnGGEQ67lHflffmmwuxk8Z
 LQr7EsPW9Rgr35YPJBUOTGrdheviC4ThppaXO18jOO2thXuOz0sEDK0TFa5NzA24QS
 L0GHvTobDXLFPZwcwr+uj/Faq9uFi70PgUrtKsyt4Jyhw5gMyP+bxeetwyIeeHX1b4
 TzVeL2TBiN0d5qWOrsOcRn1PdWWYAxb6PvZIyGJ1Nr44mH5yUjWdPP6BV0CpsciDVB
 ZVYG8cM0p0p/A==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Tue, 12 Jan 2021 11:02:50 -0800
Message-Id: <20210112190253.64307-9-ebiggers@kernel.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210112190253.64307-1-ebiggers@kernel.org>
References: <20210112190253.64307-1-ebiggers@kernel.org>
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
X-Headers-End: 1kzOy0-00Emy9-BM
Subject: [f2fs-dev] [PATCH v3 08/11] fs: drop redundant check from
 __writeback_single_inode()
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
Cc: Jan Kara <jack@suse.cz>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

wbc->for_sync implies wbc->sync_mode == WB_SYNC_ALL, so there's no need
to check for both.  Just check for WB_SYNC_ALL.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jan Kara <jack@suse.cz>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/fs-writeback.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
index 80ee9816d9df5..cee1df6e3bd43 100644
--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -1479,7 +1479,7 @@ __writeback_single_inode(struct inode *inode, struct writeback_control *wbc)
 	 * change I_DIRTY_TIME into I_DIRTY_SYNC.
 	 */
 	if ((inode->i_state & I_DIRTY_TIME) &&
-	    (wbc->sync_mode == WB_SYNC_ALL || wbc->for_sync ||
+	    (wbc->sync_mode == WB_SYNC_ALL ||
 	     time_after(jiffies, inode->dirtied_time_when +
 			dirtytime_expire_interval * HZ))) {
 		trace_writeback_lazytime(inode);
-- 
2.30.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
