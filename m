Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D2EC3A9B5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 06 Nov 2025 12:36:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:References:In-Reply-To:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hkRMYrjCTd+j4hDr7rD4BA/+g9FeGhBZUCJrVmRkG38=; b=eBc505PhtUDxROBR+R7apqRI0k
	NYlaEf8Kc30OdVa6n+qJDaWODLP8u3MzNP4KjsMa1uyMR/hSsrG2UJ6AAT1BNcEHNGZGIvqyyAAkG
	YySKwqem0BS17DxSpCHMzOqmV4lvyATEPNpTLM6Gd8f7Ny6l8N+aqR6ucQRm+W02+56E=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vGyI3-00014G-TX;
	Thu, 06 Nov 2025 11:36:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1vGyI1-000149-V5
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Nov 2025 11:36:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3OFVSDhbG36SsIf5lzC388elLqvaZZTmYLAdGi/UGDg=; b=MsQzoMHBa5rY3V50s9oRRAzcq6
 ySyumfzkosILr3yHqhTf0kD0lY+9z1V/8syWsTcjppvdzeGyM4HxiWHrykeZJibdN9p6MCvpgbi5O
 xSlZDnR6LZ1S8LLUJMRTSbk5D8Dqc2TPmTuehpTu7WdmKQHiQlxOH5m7gz1z/IcH2+OA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3OFVSDhbG36SsIf5lzC388elLqvaZZTmYLAdGi/UGDg=; b=Y52LippC8ySKJhGQEQ2vJyT2qH
 inYOwLwXB0BDq5wR+KG6pSTncNs/VMFF+BbWT6QV5WWhiu9aTg6/9zB0nMS5tkj830lMvsNRPNTTm
 9eF64iI5b6vL6AWX4iTP1QtrrpxRZ6NR+p80TNyePWe7oMEfsgxWu7jYyfyTOtCqK9p0=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vGyI1-00030a-BI for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Nov 2025 11:36:29 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1762428982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3OFVSDhbG36SsIf5lzC388elLqvaZZTmYLAdGi/UGDg=;
 b=VfHVcgmpJH3uTfDhchkD4wuvXiCeO6Y0cgIqWhodPDv0n2WVyYSiJgJJpsP+TuMeWHGFhk
 awrfiT1E4sgpQl/J9FkfBBes3xk5bIN19ceahwVKoZUp77RiupUePOYXKRjfWcOOZNzJyI
 nEGwsjZJXoedyhMd+JsaSo0915zq3oA0kUISJHkpjhjfUhWqF7la7YqWpyki7iPmNWmakE
 1xhtxvITVT9bFAfdxm0ZQDDm4fTBoi6xT7qZeJDMw7135L0MoVUU7nVX9ZV0r7kk20V5Hd
 8BnaSJ/s1Q5JnQT8KCr/Flgxrv/goYiQYt5i7ji3eoWtF4DinD6WOF+xYK6ieQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1762428982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3OFVSDhbG36SsIf5lzC388elLqvaZZTmYLAdGi/UGDg=;
 b=o1GL4jP2YCiTuyko5Z4t0WrMdYgexNYHQsUuVxE4kxErQm/WLMPqalMwDn0asv1C6ScxeV
 1J3sSKVoaU//4sBA==
To: Petr Mladek <pmladek@suse.com>
In-Reply-To: <87bjlgqmk5.fsf@jogness.linutronix.de>
References: <CAJnrk1bF8sLU6tG2MGkt_KR4BoTd_k01CMVZJ9js2-eyh80tbw@mail.gmail.com>
 <69096836.a70a0220.88fb8.0006.GAE@google.com>
 <CAJnrk1Yo4dRVSaPCaAGkHc+in03KaTXJ+KxckhLoSrRxbEdDBg@mail.gmail.com>
 <aQpFLJM96uRpO4S-@pathway.suse.cz> <87ldkk34yj.fsf@jogness.linutronix.de>
 <aQuABK25fdBVTGZc@pathway.suse.cz> <87bjlgqmk5.fsf@jogness.linutronix.de>
Date: Thu, 06 Nov 2025 12:42:21 +0106
Message-ID: <87tsz7iea2.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025-11-05, John Ogness <john.ogness@linutronix.de> wrote:
 >> Another question is whether this is the only problem caused the patch.
 > > This comparison is quite special. It caught my attention whi [...] 
 Content analysis details:   (0.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not exist)
X-Headers-End: 1vGyI1-00030a-BI
Subject: Re: [f2fs-dev] [syzbot] [iomap?] kernel BUG in folio_end_read (2)
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
Cc: brauner@kernel.org, djwong@kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 syzbot <syzbot+3686758660f980b402dc@syzkaller.appspotmail.com>,
 jaegeuk@kernel.org, Joanne Koong <joannelkoong@gmail.com>,
 "amurray@thegoodpenguin.co.uk" <amurray@thegoodpenguin.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025-11-05, John Ogness <john.ogness@linutronix.de> wrote:
>> Another question is whether this is the only problem caused the patch.
>
> This comparison is quite special. It caught my attention while combing
> through the code.

The reason that this comparison is special is because it is the only one
that does not take wrapping into account. I did it that way originally
because it is AND with a wrap check. But this is an ugly special
case. It should use the same wrap check as the other 3 cases in
nbcon.c. If it had, the bug would not have happened.

I always considered these wrap checks to be non-obvious and
error-prone. So what if we create a nice helper function to simplify and
unify the wrap checks? Something like this:

diff --git a/kernel/printk/printk_ringbuffer.c b/kernel/printk/printk_ringbuffer.c
index 839f504db6d30..8499ee642c31d 100644
--- a/kernel/printk/printk_ringbuffer.c
+++ b/kernel/printk/printk_ringbuffer.c
@@ -390,6 +390,17 @@ static unsigned int to_blk_size(unsigned int size)
 	return size;
 }
 
+/*
+ * Check if @lpos1 is before @lpos2. This takes ringbuffer wrapping
+ * into account. If @lpos1 is more than a full wrap before @lpos2,
+ * it is considered to be after @lpos2.
+ */
+static bool lpos1_before_lpos2(struct prb_data_ring *data_ring,
+			       unsigned long lpos1, unsigned long lpos2)
+{
+	return lpos2 - lpos1 - 1 < DATA_SIZE(data_ring);
+}
+
 /*
  * Sanity checker for reserve size. The ringbuffer code assumes that a data
  * block does not exceed the maximum possible size that could fit within the
@@ -577,7 +588,7 @@ static bool data_make_reusable(struct printk_ringbuffer *rb,
 	unsigned long id;
 
 	/* Loop until @lpos_begin has advanced to or beyond @lpos_end. */
-	while ((lpos_end - lpos_begin) - 1 < DATA_SIZE(data_ring)) {
+	while (lpos1_before_lpos2(data_ring, lpos_begin, lpos_end)) {
 		blk = to_block(data_ring, lpos_begin);
 
 		/*
@@ -668,7 +679,7 @@ static bool data_push_tail(struct printk_ringbuffer *rb, unsigned long lpos)
 	 * sees the new tail lpos, any descriptor states that transitioned to
 	 * the reusable state must already be visible.
 	 */
-	while ((lpos - tail_lpos) - 1 < DATA_SIZE(data_ring)) {
+	while (lpos1_before_lpos2(data_ring, tail_lpos, lpos)) {
 		/*
 		 * Make all descriptors reusable that are associated with
 		 * data blocks before @lpos.
@@ -1149,7 +1160,7 @@ static char *data_realloc(struct printk_ringbuffer *rb, unsigned int size,
 	next_lpos = get_next_lpos(data_ring, blk_lpos->begin, size);
 
 	/* If the data block does not increase, there is nothing to do. */
-	if (head_lpos - next_lpos < DATA_SIZE(data_ring)) {
+	if (!lpos1_before_lpos2(data_ring, head_lpos, next_lpos)) {
 		if (wrapped)
 			blk = to_block(data_ring, 0);
 		else
@@ -1262,7 +1273,7 @@ static const char *get_data(struct prb_data_ring *data_ring,
 
 	/* Regular data block: @begin less than @next and in same wrap. */
 	if (!is_blk_wrapped(data_ring, blk_lpos->begin, blk_lpos->next) &&
-	    blk_lpos->begin < blk_lpos->next) {
+	    lpos1_before_lpos2(data_ring, blk_lpos->begin, blk_lpos->next)) {
 		db = to_block(data_ring, blk_lpos->begin);
 		*data_size = blk_lpos->next - blk_lpos->begin;
 
This change also fixes the issue. Thoughts?

John


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
