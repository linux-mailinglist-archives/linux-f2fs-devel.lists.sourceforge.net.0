Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9561CC4180C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 07 Nov 2025 21:05:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aUl0MEl0o2eNOZjEsiNElhtktONkxmT3GTuc9OMv9Pg=; b=RxtNsJxSVqwh+JP8b7306iMrie
	f3F858NWeUfDj364Fc3CzBM8ATHjQXVwLKJiFOkZPsxadFOqghGnHIRzQ26hE2japnD8qX24okqdP
	jVv5wqaQFZDeVDPRKxgmy6yIIbCjlRLFS0YcxEldU0HxSwrbMP3ssFmRiIOKJcY9Zjdw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vHShe-0007hF-Je;
	Fri, 07 Nov 2025 20:04:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1vHShd-0007h9-49
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Nov 2025 20:04:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KtC7rzSK0aTgwHJiLrZd7KjHwgNeZ15oPHoIeGdUNXA=; b=RBUmGKt0p6li+gZCkjvA+5Rnj5
 NNQgMPvISCh5X4RbEOz+Myo7+W/Z6WXMTxyHn+DOQlEmU/1bH/HZYsQki6j+AFm8hOQs3KUcHQ9Te
 jBy+ZLlIO7T+aqDXb/xFSN1Koa3KSNFIRv6PEQAv7dYQUErh345/OXHDl4ageCUP3Zdc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=KtC7rzSK0aTgwHJiLrZd7KjHwgNeZ15oPHoIeGdUNXA=; b=G
 9B7uQ+AqCI0FJdZD8jkBuUItEG8acqTWVmLqETDeNqJ/VdYhpmj6QhzEqtPNgUX8l8HxM0zrUKjn9
 ioRg5eik1b0FnNbMLoSOB2xVcBp72rAcbFaWAKAKzCWzUfT9arWjH6IOQXljAasfXJZEatUJ8kEvH
 F/Y6h7x5bysF6G68=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vHShc-0000nS-Fe for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Nov 2025 20:04:57 +0000
Received: from pathway.suse.cz (unknown [10.100.208.146])
 by smtp-out2.suse.de (Postfix) with ESMTP id 9CF432057A;
 Fri,  7 Nov 2025 19:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1762544876; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=KtC7rzSK0aTgwHJiLrZd7KjHwgNeZ15oPHoIeGdUNXA=;
 b=rkvbqOoLf/C/5wQktFj0MjJl0kWvB1Y/VlxHjJm4yYgjz4pdo+nzkCZ1V1IbsAY+whRSDQ
 8CuVv8FFzC9Sk/cgk8VuWeB3rBfjguZB3bBmqQTT08wgh5S1kls6Sz/KprVLoEkK5pPk2P
 JtchIAocLGTX7/9zj2+n1bQ/IK6D5C0=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1762544875; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=KtC7rzSK0aTgwHJiLrZd7KjHwgNeZ15oPHoIeGdUNXA=;
 b=JAQh3SljtpaRNpy8XtXBtdDrcg6qpsHyxTJ69siFOUXMzSS2fh1Ov9qye8HHQ7UNaWOGHf
 Ou4vNqzCdzWFhe4qkvH5EdXRXLW52AfxJ43Us360WIQbeGPMUM+7tnzlTWpowfNzpRxsr9
 +gAGBHFsXEtmbaOqJeOlNdRoJLXs5+I=
To: John Ogness <john.ogness@linutronix.de>
Date: Fri,  7 Nov 2025 20:47:18 +0100
Message-ID: <20251107194720.1231457-1-pmladek@suse.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Spam-Level: 
X-Spamd-Result: default: False [-2.78 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.18)[-0.907];
 MIME_GOOD(-0.10)[text/plain];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_TWELVE(0.00)[13]; ARC_NA(0.00)[];
 RCVD_COUNT_ZERO(0.00)[0];
 DKIM_SIGNED(0.00)[suse.com:s=susede1];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_CC(0.00)[gmail.com,thegoodpenguin.co.uk,kernel.org,lists.sourceforge.net,vger.kernel.org,googlegroups.com,suse.com];
 TO_DN_SOME(0.00)[]; FROM_HAS_DN(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -2.78
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This is outcome of the long discussion about the regression
 caused by 67e1b0052f6bb82 ("printk_ringbuffer: don't needlessly wrap data
 blocks around"), see https://lore.kernel.org/all/69096836.a70a0220 [...] 
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
X-Headers-End: 1vHShc-0000nS-Fe
Subject: [f2fs-dev] [PATCH 0/2] printk_ringbuffer: Fix regression in
 get_data() and clean up data size checks
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

This is outcome of the long discussion about the regression caused
by 67e1b0052f6bb82 ("printk_ringbuffer: don't needlessly wrap data blocks around"),
see https://lore.kernel.org/all/69096836.a70a0220.88fb8.0006.GAE@google.com/

The 1st patch fixes the regression as agreed, see
https://lore.kernel.org/all/87ecqb3qd0.fsf@jogness.linutronix.de/

The 2nd patch adds a helper function to unify the checks whether
a more space is needed. I did my best to address all the concerns
about various proposed variants.

Note that I called the new helper function "need_more_space()" in the end.
It avoids all the problems with "before" vs. "lt" vs "le",
and "_safe" vs. "_sane" vs. "_bounded".

IMHO, the name "need_more_space()" fits very well in all three
locations, surprisingly even in data_realloc(). But it is possible
that you disagree. Let me know if you hate it ;-)


The patchset applies on top of printk/linux.git, branch for-6.19.
It should apply on top of linux-next as well.

Petr Mladek (2):
  printk_ringbuffer: Fix check of valid data size when blk_lpos
    overflows
  printk_ringbuffer: Create a helper function to decide whether a more
    space is needed

 kernel/printk/printk_ringbuffer.c | 40 +++++++++++++++++++++++++------
 1 file changed, 33 insertions(+), 7 deletions(-)

-- 
2.51.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
