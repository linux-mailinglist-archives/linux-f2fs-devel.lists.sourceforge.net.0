Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9F64B053F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Feb 2022 06:39:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nI2AZ-00060Q-3N; Thu, 10 Feb 2022 05:39:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <neilb@suse.de>) id 1nI2AX-000607-H9
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Feb 2022 05:39:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Cc:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Tft3SoinWu7UxepEf8WEuD+UlaGfn26eHEwniJocVAs=; b=OBHWXkNr5sBH3ocNPlCuMNdQx1
 pL8KLR9vFdlFWhmSi7TiC2tqdqXsIcMJwje23dYsL+znKgFD+/F2nrmtO+6FOm7YdyLhigLmPZln5
 oYRYZgj7ax6WDK1VoWeYSdAR5Sh4nUqRUtkQX2SXe9EO6tHTCs6TW99Vks5wKLWUXvkc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Cc:To:From:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Tft3SoinWu7UxepEf8WEuD+UlaGfn26eHEwniJocVAs=; b=FgsrsSv3qODPzp/Rf8YA8PXl9T
 F/LIUCt5EF3QF4nTmxHLIqsC9SRIKCi/VzEuNbsLthAN/oKkE/4TCeew+1v66Qru3l1DDsyYcHeOn
 O5N38o1buspuIANQCVg03MjvzK69xOw2IQoHuYKjG0nW3UJaUK9FR5AO06VII9lP8ezs=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nI2AV-0006sX-37
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Feb 2022 05:38:59 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D576F1F43F;
 Thu, 10 Feb 2022 05:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644471532; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tft3SoinWu7UxepEf8WEuD+UlaGfn26eHEwniJocVAs=;
 b=AZtdCcwJujZVCHcdXkKOM6szi0SH98wyFfZVUIfLZbgfuKnWcUV9h+nOyBGfZYHb4fgg9q
 0bzK8zlrysy2kvIK7aPM5QM5vklJlDnFMRJyEFrhh2ywPGPQAZRjcJ0eaWwg/TWCT1jT1c
 Y7P/mxpVQ0jyTZnT5empOfYlfVQmIKo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644471532;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tft3SoinWu7UxepEf8WEuD+UlaGfn26eHEwniJocVAs=;
 b=yNiRicVz0d7OW6BOtosPuVbsxI1wCRGRy4fi5NKnYLY2dFaJO1i8uBQffBceecqdSDIthz
 JkyQL6tOSv8newBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4058513519;
 Thu, 10 Feb 2022 05:38:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AC9zO+SkBGLMOAAAMHmgww
 (envelope-from <neilb@suse.de>); Thu, 10 Feb 2022 05:38:44 +0000
From: NeilBrown <neilb@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>, Jan Kara <jack@suse.cz>,
 Wu Fengguang <fengguang.wu@intel.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>, Jeff Layton <jlayton@kernel.org>,
 Ilya Dryomov <idryomov@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Anna Schumaker <anna.schumaker@netapp.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 Paolo Valente <paolo.valente@linaro.org>, Jens Axboe <axboe@kernel.dk>
Date: Thu, 10 Feb 2022 16:37:52 +1100
Message-ID: <164447147258.23354.15753542879688740872.stgit@noble.brown>
In-Reply-To: <164447124918.23354.17858831070003318849.stgit@noble.brown>
References: <164447124918.23354.17858831070003318849.stgit@noble.brown>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If ->readpages doesn't process all the pages, then it is best
 to act as though they weren't requested so that a subsequent readahead can
 try again. So: - remove any 'ahead' pages from the page cache s [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [195.135.220.29 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1nI2AV-0006sX-37
Subject: [f2fs-dev] [PATCH 03/11] MM: improve cleanup when ->readpages
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
Cc: linux-nfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If ->readpages doesn't process all the pages, then it is best to act as
though they weren't requested so that a subsequent readahead can try
again.
So:
  - remove any 'ahead' pages from the page cache so they can be loaded
    with ->readahead() rather then multiple ->read()s
  - update the file_ra_state to reflect the reads that were actually
    submitted.

This allows ->readpages() to abort early due e.g.  to congestion, which
will then allow us to remove the inode_read_congested() test from
page_Cache_async_ra().

Signed-off-by: NeilBrown <neilb@suse.de>
---
 mm/readahead.c |   19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/mm/readahead.c b/mm/readahead.c
index c44b2957f59f..35a7ebfcb504 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -104,7 +104,13 @@
  * for necessary resources (e.g.  memory or indexing information) to
  * become available.  Pages in the final ``async_size`` may be
  * considered less urgent and failure to read them is more acceptable.
- * They will eventually be read individually using ->readpage().
+ * In this case it is best to use delete_from_page_cache() to remove the
+ * pages from the page cache as is automatically done for pages that
+ * were not fetched with readahead_page().  This will allow a
+ * subsequent synchronous read ahead request to try them again.  If they
+ * are left in the page cache, then they will be read individually using
+ * ->readpage().
+ *
  */
 
 #include <linux/kernel.h>
@@ -226,8 +232,17 @@ static void read_pages(struct readahead_control *rac, struct list_head *pages,
 
 	if (aops->readahead) {
 		aops->readahead(rac);
-		/* Clean up the remaining pages */
+		/*
+		 * Clean up the remaining pages.  The sizes in ->ra
+		 * maybe be used to size next read-ahead, so make sure
+		 * they accurately reflect what happened.
+		 */
 		while ((page = readahead_page(rac))) {
+			rac->ra->size -= 1;
+			if (rac->ra->async_size > 0) {
+				rac->ra->async_size -= 1;
+				delete_from_page_cache(page);
+			}
 			unlock_page(page);
 			put_page(page);
 		}




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
