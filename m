Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Gw2CmoRCWpXHQQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 17 May 2026 02:52:58 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B5155ED13
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 17 May 2026 02:52:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UGPF++r+DTmnqFi2YCDELKy399i61yhNo93iYvKP+vY=; b=OzLS5JvWVw1a+KLpvQwbDjIdF7
	1gfcrNm43R6LF4JbkSSwUeOnE7d6s9NENdaSqxnKLXOHvCGLwOKBPiwMk9mXpx4hQ2YvYqUfV25yd
	Ylxm14jfWro5fkS0Ntt4V88gVWWA3WvbFzbTCNaxvQSrTwukiG53DiwVyyRstqxgpNv8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wOPkM-0007G1-70;
	Sun, 17 May 2026 00:52:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kartikey406@gmail.com>) id 1wOPkL-0007Fp-4R
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 17 May 2026 00:52:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Af16G8zYt4/YY8vU9QwSZfvcmcjmWzXY8R6f0FYmWII=; b=Ojdv/zKqUcCb2xujeL1dNIUe7V
 9ZvK8L6n3582p7dS0wL3od04/0CvdoBXBI+dgx6wbDG4XEqRxtFsZcxaEAkvyvgfr1uQ4fu6bBvgz
 km+bNG/rHxMHk/srBnu8NrAnSNSwdvc8Hf55nxdOsPwikVlKpNpjkM2zQiq23mCjtgvc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Af16G8zYt4/YY8vU9QwSZfvcmcjmWzXY8R6f0FYmWII=; b=J
 RnFbENzbkkJe8/i/JbDqNpKF7DMyAgqCGDSYNvrM/EgTMMKYWNyf1ERSOcxZJtbO/5JTra3JHYDYJ
 WZZvNF9chL0lQq4BTqHuIgfrhQ5gsBQaHXy3xyDPFiz8GNrNXEN5E2Q+xVS8ojZU7Y+4wEqbBGbDF
 h9eriebgB1yfXwbM=;
Received: from mail-pg1-f182.google.com ([209.85.215.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wOPkK-0008L5-QG for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 17 May 2026 00:52:45 +0000
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-c8021c8c42fso345126a12.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 16 May 2026 17:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778979159; x=1779583959; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Af16G8zYt4/YY8vU9QwSZfvcmcjmWzXY8R6f0FYmWII=;
 b=c6cMewpDUZNGVdJ7ls/d0at03wmvWO/+1Suu9g0TZCb0y6v+iF3KU5ZWbZcGOqmvPG
 aRYhQ1E1NQJD3Cl3gbSIv81z0tzDu5L1l26Vm+rWR08U6iOzW+jh+eMNAcYylsg3z2va
 At7GW+cqERRjNJYmPjBS49VkkHTkm29bZIBFjN+dDP3hddlEZGVvHbssZ9FgahM5T1eR
 HqGEWEWPNwROfWbGAXTdWDsGUlSkVqGnWbop8eKkImI486Pp/7Eqr8x8sU/B7XbKNGoj
 lTVCT4cxIj5sBEqt+kfl3tVcWBNAJUXox2h5JDE+b3NbyOiQbHKpPL7hbq/SFJm98Iv6
 oRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778979159; x=1779583959;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Af16G8zYt4/YY8vU9QwSZfvcmcjmWzXY8R6f0FYmWII=;
 b=Ap2/B+CCiG/wELfXWU0bL9sw8ICp9MG2AUrFtUIUKoVB9NEkazwgV4mwBtfKffxUfY
 38qXN3e70WiGLJWF0OsU9x3iJBtOL7eVbNc17b/O07wdsWLn2qp2JdkN9TNkvdnQWsvH
 htsJK/gRv+31NQ0eoi9D2C2mA1U/1pNupw3yyQgE/YIQe2IUo5a9zWMmd8n9fdGUGubo
 lLhRh8tuzcI67G8H2a14EVH/lsELdps1Y5bVkAubwMztI4E8X6kH4KvrCbJQLVPpvfgL
 0EYCLozll1r9uUvhNk54gdSXcXGe42E4qIm3NTR2r7pJ+0hmsupDCqGWUJlOA72lNiAK
 WANg==
X-Gm-Message-State: AOJu0Yy5cZ2z2Y5EEfqnuVVMensbL9XoeeoK/+QmfyvHnqJWcWwPcdof
 WW18VtW/V282jt14CXtoe1piYweC2RfkHj8tfKWIKgs0UosfiFVu7Jww
X-Gm-Gg: Acq92OGHWlXdg0Kn4vrOOk/SKV/j6aNrLVFoL5vlcmzltqrJMZJU+NxSMJY3L7HIUGN
 qO8LJczEGVd36yG8Hald0KTJ1yITcSWemDjMP6iqcr9jk+s3ggYAMkA1lFOqh8Y40C0b5Wmgz0G
 aLpNL2cm/4wd7n27QU4ZQ/lY6rAVtQEIF4vOgGIUuK+TaLOolP7nU1RIQjbabC5TAVM6bLKAU/p
 GTkuU3rC0PGSQlKjzSHPdsKCI2rco9E5pfgW2wSQbaxQ5YDqZ3uNs79Y8WTHs1/b3/6RPEh5Ib1
 SNaEkJw9D0RQ2l/Ef6tF4JzkgcapByYmw+A/0/GRkQUcbTMN4DiH+hPFWbRxeJ89sw0orxzOU5y
 gfm8NYFlvol1Crccds2eUW640BOnPQe1istSFttwwjiM2/z0yexmcZjbnaTb88z/4gyC+XxPVeA
 bHqq/IqLJIJrgSI4bTpRSvFxXlZYMtAhXbuzNptNGJtc6LwWdJFoBv4yPX1DOMPy9pQSgpyKUjN
 x9XJkc=
X-Received: by 2002:a05:6a00:1904:b0:82f:38:a5b2 with SMTP id
 d2e1a72fcca58-83f33d835b8mr10093396b3a.40.1778979159339; 
 Sat, 16 May 2026 17:52:39 -0700 (PDT)
Received: from deepanshu-kernel-hacker..
 ([2405:201:682f:383f:29ea:98ba:649e:3b6e])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-83f19c7809esm12627735b3a.44.2026.05.16.17.52.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2026 17:52:38 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sun, 17 May 2026 06:22:30 +0530
Message-ID: <20260517005230.28172-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Syzbot reports a recurrence of the kernel BUG in
 f2fs_write_end_io:
 kernel BUG at fs/f2fs/data.c:388! Oops: invalid opcode: 0000 [#1] SMP KASAN
 PTI CPU: 0 UID: 0 PID: 15 Comm: ksoftirqd/0 PREEMPT_{RT,
 (full)} RIP: 0010:f2fs_write_end_io+0x16df/0x1740
 Call Trace: blk_u [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [kartikey406(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [kartikey406(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.182 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wOPkK-0008L5-QG
Subject: [f2fs-dev] [PATCH] f2fs: don't BUG on node footer mismatch in
 f2fs_write_end_io
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
Cc: Deepanshu Kartikey <kartikey406@gmail.com>,
 syzbot+4af46ee83100e99bce09@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 59B5155ED13
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:kartikey406@gmail.com,m:syzbot+4af46ee83100e99bce09@syzkaller.appspotmail.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[kartikey406@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,syzkaller.appspotmail.com,vger.kernel.org,lists.sourceforge.net];
	FROM_NEQ_ENVFROM(0.00)[kartikey406@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-0.995];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	TAGGED_RCPT(0.00)[linux-f2fs-devel,4af46ee83100e99bce09];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Action: no action

Syzbot reports a recurrence of the kernel BUG in f2fs_write_end_io:

  kernel BUG at fs/f2fs/data.c:388!
  Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
  CPU: 0 UID: 0 PID: 15 Comm: ksoftirqd/0 PREEMPT_{RT,(full)}
  RIP: 0010:f2fs_write_end_io+0x16df/0x1740
  Call Trace:
   blk_update_request+0x57e/0xe60
   blk_mq_end_request+0x3e/0x70
   blk_done_softirq+0x10a/0x160
   handle_softirqs+0x1de/0x6d0
   run_ksoftirqd+0x52/0x180

Commit 50ac3ecd8e05 ("f2fs: fix to do sanity check on node footer
in {read,write}_end_io") added f2fs_sanity_check_node_footer() to
both end_io paths to catch corrupted node footers reachable from
fuzzed on-disk images. In f2fs_write_end_io(), however, the
existing

  f2fs_bug_on(sbi, folio->index != nid_of_node(folio));

was left in place immediately after the new helper call. The
helper detects the mismatch, sets SBI_NEED_FSCK and emits a
ratelimited warning, but its return value is discarded and the
following f2fs_bug_on() panics on the exact same condition.

Tracing the reproducer confirms the failure path. A node folio
with index=11 is looked up via __get_node_folio(), the
synchronous sanity check at page_hit fails with -EFSCORRUPTED
and out_err clears uptodate but leaves the dirty bit set from
the folio's earlier lifecycle. A subsequent read_node_folio()
fails with the same error (footer_nid=0, ino=0), and
folio_end_read(folio, false) does not clear dirty either. The
writeback iterator then finds the still-dirty folio via the
PAGECACHE_TAG_DIRTY tag and submits it. f2fs_write_end_io()
observes folio->index=11 with nid_of_node(folio)=0 and panics
from softirq context via blk_done_softirq, even though
f2fs_sanity_check_node_footer() has already correctly identified
the corruption and would have signalled it via its return value.

A filesystem inconsistency reachable from a mounted image must
not panic the kernel. Mirror the handling already used in
f2fs_finish_read_bio(): capture the helper's return value and
mark the bio with BLK_STS_IOERR on mismatch instead of issuing
BUG_ON. SBI_NEED_FSCK is set by the helper, so fsck.f2fs will
repair the inconsistency on the next mount.

Reported-by: syzbot+4af46ee83100e99bce09@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=4af46ee83100e99bce09
Fixes: 50ac3ecd8e05 ("f2fs: fix to do sanity check on node footer in {read,write}_end_io")
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 fs/f2fs/data.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 8d4f1e75dee3..c149b0ccf22d 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -382,11 +382,11 @@ static void f2fs_write_end_io(struct bio *bio)
 						STOP_CP_REASON_WRITE_FAIL);
 		}
 
-		if (is_node_folio(folio)) {
-			f2fs_sanity_check_node_footer(sbi, folio,
-				folio->index, NODE_TYPE_REGULAR, true);
-			f2fs_bug_on(sbi, folio->index != nid_of_node(folio));
-		}
+		if (is_node_folio(folio) &&
+		    f2fs_sanity_check_node_footer(sbi, folio,
+						  folio->index, NODE_TYPE_REGULAR, true))
+			bio->bi_status = BLK_STS_IOERR;
+
 		if (f2fs_in_warm_node_list(folio))
 			f2fs_del_fsync_node_entry(sbi, folio);
 
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
