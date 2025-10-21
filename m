Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6587FBF4F53
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Oct 2025 09:27:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yP9gm0ww+lTkKubBvPTwCdJY9JOnBRBfLaPCc1RqkAY=; b=AiqWxIq7T2jTnic1PXVQFr3ZOg
	Z261d315vPpZjNW38bWXFWywgTwsX12TACop3ZRJg0nDreI9rdodVmCwqt1JuTWM07tyShaRLYARA
	b9UoxIU8qgY67GEtwtvv4YZBjXvbCFu8QdjRzXcRtNk8HxHwBAclWoN/R1zMtOlcv5iQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vB6mY-0002Mm-BU;
	Tue, 21 Oct 2025 07:27:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=382e81130=mngyadam@amazon.de>)
 id 1vB6mX-0002Mf-CJ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Oct 2025 07:27:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ER5cLgoC/4MdsBzdzUsBYBpn6poQFnbZbMEZNMZv5Vc=; b=FtqWfx6UxiXFbPpFwwHt68IxUG
 6RTpG/CFqGGsfqM49DW0Buk8lcMMIG2q8OlblicjJXKkwFQS34Q5uP8RVhMhDT5HKduGFSLogkzh+
 FCBQqLTYyZJZt1hstFfp7TkBhYE4wxbHT9q+D0ek3Pjq+8iID02YDfhlibqB3RLRPfF8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ER5cLgoC/4MdsBzdzUsBYBpn6poQFnbZbMEZNMZv5Vc=; b=IKWFBxqYBE546FtgSkJVCf5KTP
 cvtxpmrhUj8rf1kKZZSNCIRNAvC0W/lQlYxiyGzv153KSO8K2Hya3oMyZ5SYX0OVhRb8afM2xm2CG
 qZRaS0uRGvlO6ehVDhLDZCoqt3DEdSnYfRV1VA/Dmkdr/GSzjsXmXEWDrhFQvGDpzLhQ=;
Received: from fra-out-014.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 ([18.199.210.3]) by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vB6mW-0007cS-9k for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Oct 2025 07:27:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
 t=1761031664; x=1792567664;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ER5cLgoC/4MdsBzdzUsBYBpn6poQFnbZbMEZNMZv5Vc=;
 b=GZ/hPFPv+O3WvnipLw5obx4zDVoHNpJIycotaMjISi0PuSbKpNbCwSm+
 RXcIqbJGVY9OdfCfZxwZReYNWFDNpOmPTC1wjxdhqaS4gZ4XqDnbIQ3s/
 zkRVMucrf4vNUhRHr9KJ/2jk5VtYLT+64WlNaCS0fdSuXpwYgsDzlAfpu
 7A9mgHhOxvvX/+ysGTdXaFTXYC7AEMmJp5CtJ8k+LvQWQLZ7l5HOz4Tip
 N/9j+KjOPmU26OozZjYKqF16Zz67TntpCWO6v57NgtnDt4/Qm2xs915lG
 E/x3lJUYrn4+FFHPQ5RutfL5Wlt79p/Dd3xQ/pBa/oD8HkKjQCvH0PR30 w==;
X-CSE-ConnectionGUID: kUEZ2KC2Rfa44N6E7Rqgsw==
X-CSE-MsgGUID: epsBYkLXTYGjTRt8EkVXCA==
X-IronPort-AV: E=Sophos;i="6.19,244,1754956800"; 
   d="scan'208";a="3824996"
Received: from ip-10-6-11-83.eu-central-1.compute.internal (HELO
 smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.11.83])
 by internal-fra-out-014.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 07:11:29 +0000
Received: from EX19MTAEUC001.ant.amazon.com [54.240.197.225:28509]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.18.241:2525]
 with esmtp (Farcaster)
 id c31f0d4e-9a33-4d49-91df-70df47201fd2; Tue, 21 Oct 2025 07:11:28 +0000 (UTC)
X-Farcaster-Flow-ID: c31f0d4e-9a33-4d49-91df-70df47201fd2
Received: from EX19D013EUB004.ant.amazon.com (10.252.51.92) by
 EX19MTAEUC001.ant.amazon.com (10.252.51.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Tue, 21 Oct 2025 07:11:28 +0000
Received: from dev-dsk-mngyadam-1c-cb3f7548.eu-west-1.amazon.com
 (10.253.107.175) by EX19D013EUB004.ant.amazon.com (10.252.51.92) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20; Tue, 21 Oct 2025
 07:11:19 +0000
To: <stable@vger.kernel.org>
Date: Tue, 21 Oct 2025 09:03:40 +0200
Message-ID: <20251021070353.96705-7-mngyadam@amazon.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251021070353.96705-2-mngyadam@amazon.de>
References: <20251021070353.96705-2-mngyadam@amazon.de>
MIME-Version: 1.0
X-Originating-IP: [10.253.107.175]
X-ClientProxiedBy: EX19D046UWB003.ant.amazon.com (10.13.139.174) To
 EX19D013EUB004.ant.amazon.com (10.252.51.92)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Al Viro <viro@zeniv.linux.org.uk> commit
 8287474aa5ffb41df52552c4ae4748e791d2faf2
 upstream. If we fail filemap_write_and_wait_range() on the range the buffered
 write went into, we only report the "number of bytes which we direct-written", 
 to quote the comment in there. Which is fine, but buf [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [18.199.210.3 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vB6mW-0007cS-9k
Subject: [f2fs-dev] [PATCH 6.1 5/8] direct_write_fallback(): on error revert
 the ->ki_pos update from buffered write
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
From: Mahmoud Adam via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Mahmoud Adam <mngyadam@amazon.de>
Cc: "Darrick J. Wong" <djwong@kernel.org>, nagy@khwaternagy.com,
 linux-mm@kvack.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-nilfs@vger.kernel.org, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Christoph Hellwig <hch@infradead.org>, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Xiubo Li <xiubli@redhat.com>, Ryusuke
 Konishi <konishi.ryusuke@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 Christian Brauner <brauner@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 gregkh@linuxfoundation.org, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Luis
 Chamberlain <mcgrof@kernel.org>, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Hannes Reinecke <hare@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Al Viro <viro@zeniv.linux.org.uk>

commit 8287474aa5ffb41df52552c4ae4748e791d2faf2 upstream.

If we fail filemap_write_and_wait_range() on the range the buffered write went
into, we only report the "number of bytes which we direct-written", to quote
the comment in there.  Which is fine, but buffered write has already advanced
iocb->ki_pos, so we need to roll that back.  Otherwise we end up with e.g.
write(2) advancing position by more than the amount it reports having written.

Fixes: 182c25e9c157 "filemap: update ki_pos in generic_perform_write"
Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
Message-Id: <20230827214518.GU3390869@ZenIV>
Signed-off-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Mahmoud Adam <mngyadam@amazon.de>
---
 fs/libfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/libfs.c b/fs/libfs.c
index a5bbe8e31d6616..63bc52c20f7e03 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -1615,6 +1615,7 @@ ssize_t direct_write_fallback(struct kiocb *iocb, struct iov_iter *iter,
 		 * We don't know how much we wrote, so just return the number of
 		 * bytes which were direct-written
 		 */
+		iocb->ki_pos -= buffered_written;
 		if (direct_written)
 			return direct_written;
 		return err;
-- 
2.47.3




Amazon Web Services Development Center Germany GmbH
Tamara-Danz-Str. 13
10243 Berlin
Geschaeftsfuehrung: Christian Schlaeger
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
