Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D9EC417E2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 07 Nov 2025 21:03:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hmdUHVWPcfzoyLjw86IHUYo01fxk2EexkleQ81nDNLI=; b=Pfxs225fIN6CQPpoj29KRASvl/
	/aDLvbUkS8+R5sty2pLIle/jpwmwzldpyuVOkB6bXDCu5ODsQlBYg852/UjB1pxhCkxZvLlMGPeEO
	jFXbPBJrOcb2PAzrB+NKRLirz9ygayEEs7LeQYv2IPjAEOUxnk4RDcQUoJpSbKeRlikA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vHSg1-0002sH-Dm;
	Fri, 07 Nov 2025 20:03:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1vHSg0-0002s7-K9
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Nov 2025 20:03:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IeO70OJ5TY7FEk0BCI4hVN3mDp8lmCuzmxRyi+G2tng=; b=QE39I6m4pPV7E62lDUkvf+8b85
 CZ/diXBrVydUma7M7weZJuJxwHZ820dzNpvQNpfTGY9zL6chaYEY9hesjrv202cQM+M+1HPa8GOQB
 AFjl4resyj+A6DfOSN4Wr0Iv56pIsdGYqHkDQnJuslYu1XppS7SoNJSQSkLwJEkq70Hc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IeO70OJ5TY7FEk0BCI4hVN3mDp8lmCuzmxRyi+G2tng=; b=i90qBv2nrhJB+Faqj21FPWvaW6
 Z3PDMPj/nY+wfsdv19ftI936utk2bowjNb1/e3vNrMgDFsWMlkttNIsO5ZANv8m3o5angp61Ag2U5
 G4OQcu/odXXeBAXZ3Q59nxrCNnOZ6boI14lJyEEYOXf9rhGFxyBAPGXlvof3CR3UXbVs=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vHSg0-0000hf-MQ for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Nov 2025 20:03:17 +0000
Received: from pathway.suse.cz (unknown [10.100.208.146])
 by smtp-out2.suse.de (Postfix) with ESMTP id 14CC32056D;
 Fri,  7 Nov 2025 19:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1762544899; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IeO70OJ5TY7FEk0BCI4hVN3mDp8lmCuzmxRyi+G2tng=;
 b=qkvbxtBQDmIDilJnTOR0vYQytDAYcCw71oDIP3POIkLEhr8bapI3sWiATSNDFvTeRucO8H
 LIPX1a3YE3GSiy6axv1llPkccnytvEYkFxzhT98XYRO1rfkRjHLL56Ile/Y7srAVPSM4yN
 Wh1TV2iE8VQSmTV4FVbXIZHKINQOAAg=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1762544898; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IeO70OJ5TY7FEk0BCI4hVN3mDp8lmCuzmxRyi+G2tng=;
 b=qDmQYczDGUxbgVIUIjLuV4gS0bREuJF+39GbqXFP+0r/zTMv+p7W8nNHpW5N2tdqeAOCt6
 2m6dtwSCm6xiG1m1D4OKACkz/bwP1gft3kKFiW0IdHQX4f8je6VBm4eSN3JxEVoDbiC1oH
 RlvIJmhpoywOTxhEAVMBPPDpTIxuuIg=
To: John Ogness <john.ogness@linutronix.de>
Date: Fri,  7 Nov 2025 20:47:20 +0100
Message-ID: <20251107194720.1231457-3-pmladek@suse.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251107194720.1231457-1-pmladek@suse.com>
References: <20251107194720.1231457-1-pmladek@suse.com>
MIME-Version: 1.0
X-Spam-Level: 
X-Spamd-Result: default: False [-6.79 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.19)[-0.942]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[13];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.com:s=susede1];
 R_RATELIMIT(0.00)[to_ip_from(RLreigq8okzrb3g3qsqhoz9iaq)];
 FREEMAIL_CC(0.00)[gmail.com,thegoodpenguin.co.uk,kernel.org,lists.sourceforge.net,vger.kernel.org,googlegroups.com,suse.com];
 RCVD_COUNT_ZERO(0.00)[0]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -6.79
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The decision whether some more space is needed is tricky in
 the printk ring buffer code: 1. The given lpos values might overflow. A
 subtraction
 must be used instead of a simple "lower than" check. 2. Another CPU might
 reuse the space in the mean time. It can be detected when the subtraction
 is bigger than DATA_SIZE(data_ring). 
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
X-Headers-End: 1vHSg0-0000hf-MQ
Subject: [f2fs-dev] [PATCH 2/2] printk_ringbuffer: Create a helper function
 to decide whether a more space is needed
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
From: Petr Mladek via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Petr Mladek <pmladek@suse.com>
Cc: Petr Mladek <pmladek@suse.com>, brauner@kernel.org, djwong@kernel.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 Joanne Koong <joannelkoong@gmail.com>,
 "amurray @ thegoodpenguin . co . uk" <amurray@thegoodpenguin.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The decision whether some more space is needed is tricky in the printk
ring buffer code:

  1. The given lpos values might overflow. A subtraction must be used
     instead of a simple "lower than" check.

  2. Another CPU might reuse the space in the mean time. It can be
     detected when the subtraction is bigger than DATA_SIZE(data_ring).

  3. There is exactly enough space when the result of the subtraction
     is zero. But more space is needed when the result is exactly
     DATA_SIZE(data_ring).

Add a helper function to make sure that the check is done correctly
in all situations. Also it helps to make the code consistent and
better documented.

Suggested-by: John Ogness <john.ogness@linutronix.de>
Link: https://lore.kernel.org/r/87tsz7iea2.fsf@jogness.linutronix.de
Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 kernel/printk/printk_ringbuffer.c | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/kernel/printk/printk_ringbuffer.c b/kernel/printk/printk_ringbuffer.c
index 3e6fd8d6fa9f..ede3039dd041 100644
--- a/kernel/printk/printk_ringbuffer.c
+++ b/kernel/printk/printk_ringbuffer.c
@@ -411,6 +411,23 @@ static bool data_check_size(struct prb_data_ring *data_ring, unsigned int size)
 	return to_blk_size(size) <= DATA_SIZE(data_ring) / 2;
 }
 
+/*
+ * Compare the current and requested logical position and decide
+ * whether more space needed.
+ *
+ * Return false when @lpos_current is already at or beyond @lpos_target.
+ *
+ * Also return false when the difference between the positions is bigger
+ * than the size of the data buffer. It might happen only when the caller
+ * raced with another CPU(s) which already made and used the space.
+ */
+static bool need_more_space(struct prb_data_ring *data_ring,
+			    unsigned long lpos_current,
+			    unsigned long lpos_target)
+{
+	return lpos_target - lpos_current - 1 < DATA_SIZE(data_ring);
+}
+
 /* Query the state of a descriptor. */
 static enum desc_state get_desc_state(unsigned long id,
 				      unsigned long state_val)
@@ -577,7 +594,7 @@ static bool data_make_reusable(struct printk_ringbuffer *rb,
 	unsigned long id;
 
 	/* Loop until @lpos_begin has advanced to or beyond @lpos_end. */
-	while ((lpos_end - lpos_begin) - 1 < DATA_SIZE(data_ring)) {
+	while (need_more_space(data_ring, lpos_begin, lpos_end)) {
 		blk = to_block(data_ring, lpos_begin);
 
 		/*
@@ -668,7 +685,7 @@ static bool data_push_tail(struct printk_ringbuffer *rb, unsigned long lpos)
 	 * sees the new tail lpos, any descriptor states that transitioned to
 	 * the reusable state must already be visible.
 	 */
-	while ((lpos - tail_lpos) - 1 < DATA_SIZE(data_ring)) {
+	while (need_more_space(data_ring, tail_lpos, lpos)) {
 		/*
 		 * Make all descriptors reusable that are associated with
 		 * data blocks before @lpos.
@@ -1148,8 +1165,14 @@ static char *data_realloc(struct printk_ringbuffer *rb, unsigned int size,
 
 	next_lpos = get_next_lpos(data_ring, blk_lpos->begin, size);
 
-	/* If the data block does not increase, there is nothing to do. */
-	if (head_lpos - next_lpos < DATA_SIZE(data_ring)) {
+	/*
+	 * Use the current data block when the size does not increase.
+	 *
+	 * Note that need_more_space() could never return false here because
+	 * the difference between the positions was bigger than the data
+	 * buffer size. The data block is reopened and can't get reused.
+	 */
+	if (!need_more_space(data_ring, head_lpos, next_lpos)) {
 		if (wrapped)
 			blk = to_block(data_ring, 0);
 		else
-- 
2.51.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
