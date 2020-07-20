Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 366CD2254E2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Jul 2020 02:14:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jxJRT-0004fg-RZ; Mon, 20 Jul 2020 00:14:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <rdunlap@infradead.org>) id 1jxJRR-0004fY-Vw
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jul 2020 00:14:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w3ocKZG4wB9+BN3HWi6dTE1pwLbH0jUZXg8mdu1fAZE=; b=ZbCU4N1BlOf/EqAgCrsrQeWv0B
 RzBGOPuNbsu4rt3vUdDsEqmT8tLhhRwJw/VJxZVc8ZxXlb862d89NqpKbh2JTr4MkGQDJp8iNMaHh
 aO/SguGqNebmERLdWfSus5khMHf7jkIb/em6zQ++R2SrJ4VdVyNCml8DL2HWDwSfXOoY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=w3ocKZG4wB9+BN3HWi6dTE1pwLbH0jUZXg8mdu1fAZE=; b=G
 Bb64GbjaPSx8EWUmx5gWe8t5/2CjR5ddXE3ZVIM1+h0uz0LScrxvnA7Y/V4fNeQ/ozYcZ3bDrXYVy
 zMrXoRd2OlaSaiIiBAmMiEGTM1onsD111h6Md1d0/rYBIqGC2mSAnsIyXB0DbL+UTGWzsVMEqA9uV
 vw0QWvjDnnvsZ3ZA=;
Received: from merlin.infradead.org ([205.233.59.134])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jxJRP-00C11w-4z
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jul 2020 00:14:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=w3ocKZG4wB9+BN3HWi6dTE1pwLbH0jUZXg8mdu1fAZE=; b=IfvaB5pjviEa3rTvLBwVBYZVfI
 p9QNyt5uyU28PO7PozjAJipC0XsS+cIcnJ8fa1JINcIyT96WBmzTnBSEyBB1MHAdSrmCwvWgyB9dm
 tptQ2GMgiqfJrLebL6qva7Cw7KAfkbmfQgd04vcHL4ivCWW5q6T5qNqL4PTN50eQmdMEOAHE9gcWH
 ufVg0DcyAKzJf7S6ywmCuy+rS7V+Ve27QKmSvbrU9m3n1+dsePyT+1QIE+E5tAV5mDkXd7X9uRBoK
 lXSx+VX8Zb9Zn4GzdlgORNlYbEkUkpnYz3px3nIW6h+HAj1BMkxfN0cFH99ZK0Up48mAwRHWQu9n0
 x1RDlqKg==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxJRE-0003y3-Ow; Mon, 20 Jul 2020 00:13:49 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Date: Sun, 19 Jul 2020 17:13:44 -0700
Message-Id: <20200720001344.25138-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [205.233.59.134 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jxJRP-00C11w-4z
Subject: [f2fs-dev] [PATCH] f2fs: segment.h: delete a duplicated word
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Drop the repeated word "the" in a comment.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
---
 fs/f2fs/segment.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200717.orig/fs/f2fs/segment.h
+++ linux-next-20200717/fs/f2fs/segment.h
@@ -187,7 +187,7 @@ struct seg_entry {
 	unsigned char *cur_valid_map_mir;	/* mirror of current valid bitmap */
 #endif
 	/*
-	 * # of valid blocks and the validity bitmap stored in the the last
+	 * # of valid blocks and the validity bitmap stored in the last
 	 * checkpoint pack. This information is used by the SSR mode.
 	 */
 	unsigned char *ckpt_valid_map;	/* validity bitmap of blocks last cp */


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
