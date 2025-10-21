Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7FCBF4F5C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Oct 2025 09:29:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FPUn3kuBrxxo7CAc8jOpEZe1unS5tsX/2XXVZowYuho=; b=my4g8lG/uCx4hCtqmVlx8fkXSc
	DV/dtHT7hJEwN4NdSymojN8XMuyDI1OrH2ApNeE4brWlvzIc0NijqbWxw5cCGl5VLXA7ZOgEOZuAb
	iVyMmdlz95IJAhNgNidhKphOwd5MenSmSm/hMzRjHYBaNQYXt9sQ0MWVgfAnOAxEzxZ4=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vB6no-00054m-C4;
	Tue, 21 Oct 2025 07:29:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=382e81130=mngyadam@amazon.de>)
 id 1vB6nn-00054e-ME for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Oct 2025 07:29:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JG6/21Kc3LPmm7ifFU0zEa7/qVfomGnzIkk8iphJ08Q=; b=Y4nkh/VK1Zl0wH8aRNKNv5g3br
 l35Iq2ZUYKpoECayuyGesHzjqxX/MYXslp9V69fbyk8ncdxTMOYVZCCKZBqTq5MhAl+1fKNhHjTiy
 KrNqJiIutL0mzNK1lvdMt0hfMwMCn46S++pdl3KrIjXcwLbB/a8rn+BLqm7Scy3AEubM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JG6/21Kc3LPmm7ifFU0zEa7/qVfomGnzIkk8iphJ08Q=; b=QCmCDitEEImr9Fr6d4GKvVJKnv
 EaWwQDCeHMMbl69d/SDrerBVVwGxvR1JgeLtA20c09JC0JJvV9RXhCTGVePExC1U68CpByZFB58Pt
 d9eovNU+cDT/oqtW62BhpMwKolZd+0uY3bPWzCy7MncG66pgFRMntzOfhlSs2jLRNU90=;
Received: from fra-out-009.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 ([3.64.237.68]) by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vB6nm-0007iM-TE for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Oct 2025 07:29:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
 t=1761031742; x=1792567742;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JG6/21Kc3LPmm7ifFU0zEa7/qVfomGnzIkk8iphJ08Q=;
 b=Qxmp6mzGGuV028Gs31PsrQMWJgk9r97E7rl8wcuwi921iTeBUeLfPd8C
 M7dkGZdCaNbwWcyoo9Qfn+1m1eow8xokdkzND8UO6nAIdDPm3dr31b/rs
 DDlGaCUUm7YkfL3pCQF4DHmK34VPOdeiLaC/dWgeU2gsdWnGUd2g8aPYv
 aITv9PQ1zax1vkOvlwV4M9PN/Suwi9tcQTZYIWYFxgvN7XwPNdsmRaJRc
 JcHAOHFw0rWvoCLYzVJHhiGuKuov8nr6LO3+rUhJq+iBeUayJ/mpM0cXN
 QViEPICIMc1Ub+N0NrLbyX6YTtAa/sWaCsHBtZ7zgTpLF+3B8tZlPbCNS A==;
X-CSE-ConnectionGUID: 9ajDuW3IRAqJTQOmqwROGg==
X-CSE-MsgGUID: w3M+VODYSFGUxfTSLykcsw==
X-IronPort-AV: E=Sophos;i="6.19,244,1754956800"; 
   d="scan'208";a="3832773"
Received: from ip-10-6-3-216.eu-central-1.compute.internal (HELO
 smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.3.216])
 by internal-fra-out-009.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 07:12:56 +0000
Received: from EX19MTAEUC002.ant.amazon.com [54.240.197.228:1068]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.47.14:2525]
 with esmtp (Farcaster)
 id 1553515b-eb11-4da4-8ddb-b9d47464950e; Tue, 21 Oct 2025 07:12:56 +0000 (UTC)
X-Farcaster-Flow-ID: 1553515b-eb11-4da4-8ddb-b9d47464950e
Received: from EX19D013EUB004.ant.amazon.com (10.252.51.92) by
 EX19MTAEUC002.ant.amazon.com (10.252.51.245) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Tue, 21 Oct 2025 07:12:55 +0000
Received: from dev-dsk-mngyadam-1c-cb3f7548.eu-west-1.amazon.com
 (10.253.107.175) by EX19D013EUB004.ant.amazon.com (10.252.51.92) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20; Tue, 21 Oct 2025
 07:12:46 +0000
To: <stable@vger.kernel.org>
Date: Tue, 21 Oct 2025 09:03:43 +0200
Message-ID: <20251021070353.96705-10-mngyadam@amazon.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251021070353.96705-2-mngyadam@amazon.de>
References: <20251021070353.96705-2-mngyadam@amazon.de>
MIME-Version: 1.0
X-Originating-IP: [10.253.107.175]
X-ClientProxiedBy: EX19D036UWC002.ant.amazon.com (10.13.139.242) To
 EX19D013EUB004.ant.amazon.com (10.252.51.92)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Ryusuke Konishi <konishi.ryusuke@gmail.com> commit
 fb881cd7604536b17a1927fb0533f9a6982ffcc5
 upstream. After commit c0e473a0d226 ("block: fix race between set_blocksize
 and read paths") was merged, set_blocksize() called by sb_set_blocksize()
 now locks the inode of the backing device file. As a result [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vB6nm-0007iM-TE
Subject: [f2fs-dev] [PATCH 6.1 8/8] nilfs2: fix deadlock warnings caused by
 lock dependency in init_nilfs()
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
Cc: linux-nilfs@vger.kernel.org, "Darrick J. Wong" <djwong@kernel.org>,
 nagy@khwaternagy.com, linux-mm@kvack.org,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 syzbot+00f7f5b884b117ee6773@syzkaller.appspotmail.com, "Matthew
 Wilcox \(Oracle\)" <willy@infradead.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Christoph Hellwig <hch@infradead.org>, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, linux-block@vger.kernel.org,
 Damien Le Moal <dlemoal@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, linux-nfs@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>,
 syzbot+f30591e72bfc24d4715b@syzkaller.appspotmail.com,
 gregkh@linuxfoundation.org, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 Anna Schumaker <anna@kernel.org>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Hannes Reinecke <hare@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Ryusuke Konishi <konishi.ryusuke@gmail.com>

commit fb881cd7604536b17a1927fb0533f9a6982ffcc5 upstream.

After commit c0e473a0d226 ("block: fix race between set_blocksize and read
paths") was merged, set_blocksize() called by sb_set_blocksize() now locks
the inode of the backing device file.  As a result of this change, syzbot
started reporting deadlock warnings due to a circular dependency involving
the semaphore "ns_sem" of the nilfs object, the inode lock of the backing
device file, and the locks that this inode lock is transitively dependent
on.

This is caused by a new lock dependency added by the above change, since
init_nilfs() calls sb_set_blocksize() in the lock section of "ns_sem".
However, these warnings are false positives because init_nilfs() is called
in the early stage of the mount operation and the filesystem has not yet
started.

The reason why "ns_sem" is locked in init_nilfs() was to avoid a race
condition in nilfs_fill_super() caused by sharing a nilfs object among
multiple filesystem instances (super block structures) in the early
implementation.  However, nilfs objects and super block structures have
long ago become one-to-one, and there is no longer any need to use the
semaphore there.

So, fix this issue by removing the use of the semaphore "ns_sem" in
init_nilfs().

Link: https://lkml.kernel.org/r/20250503053327.12294-1-konishi.ryusuke@gmail.com
Fixes: c0e473a0d226 ("block: fix race between set_blocksize and read paths")
Signed-off-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Reported-by: syzbot+00f7f5b884b117ee6773@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=00f7f5b884b117ee6773
Tested-by: syzbot+00f7f5b884b117ee6773@syzkaller.appspotmail.com
Reported-by: syzbot+f30591e72bfc24d4715b@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=f30591e72bfc24d4715b
Tested-by: syzbot+f30591e72bfc24d4715b@syzkaller.appspotmail.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Mahmoud Adam <mngyadam@amazon.de>
---
 fs/nilfs2/the_nilfs.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/fs/nilfs2/the_nilfs.c b/fs/nilfs2/the_nilfs.c
index be41e26b782469..05fdbbc63e1f5f 100644
--- a/fs/nilfs2/the_nilfs.c
+++ b/fs/nilfs2/the_nilfs.c
@@ -680,8 +680,6 @@ int init_nilfs(struct the_nilfs *nilfs, struct super_block *sb, char *data)
 	int blocksize;
 	int err;
 
-	down_write(&nilfs->ns_sem);
-
 	blocksize = sb_min_blocksize(sb, NILFS_MIN_BLOCK_SIZE);
 	if (!blocksize) {
 		nilfs_err(sb, "unable to set blocksize");
@@ -757,7 +755,6 @@ int init_nilfs(struct the_nilfs *nilfs, struct super_block *sb, char *data)
 	set_nilfs_init(nilfs);
 	err = 0;
  out:
-	up_write(&nilfs->ns_sem);
 	return err;
 
  failed_sbh:
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
