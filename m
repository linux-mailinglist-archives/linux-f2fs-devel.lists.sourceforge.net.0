Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAC892DB21
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Jul 2024 23:40:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sRf3K-0006tf-QX;
	Wed, 10 Jul 2024 21:40:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1sRf3J-0006tY-2e
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jul 2024 21:40:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t4jvbJ7n8PAGp09Txkl3fReWKpqoTyQAeWAGk4qQm/o=; b=fe+paabaGmaMLyhFKq6yEbvICL
 BUxA19iD4uS611fT9Z1eep95swilpHBBltWLm4GzM1XSOFAv9c1cWhKcIflT0PdeRN7j9/nwKQ7aF
 YWi7GXnLf5Kq0ZPKHMOvodYJhE3tWn6fwHdE0t6FJmRmTMVvrNdbjIVkpSHECKzjXJzs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=t4jvbJ7n8PAGp09Txkl3fReWKpqoTyQAeWAGk4qQm/o=; b=D
 uTplbQ+LsfiUjJp4n1QR4FcDKwnox5iHpj1Ij92mnw8TintKlJAvu3U7s6juuQSrO9iFbbq7nQvio
 n4M4HM6spwkicNC/mCVV4EK2u9wR/ABFX+/WCXGz230AxVNowFoxbN2RwuymbAexO5EHU+FeXfhdl
 gArrprGMmDDwLirs=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sRf3I-0006fg-LK for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jul 2024 21:40:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=t4jvbJ7n8PAGp09Txkl3fReWKpqoTyQAeWAGk4qQm/o=; b=pmRu7gZQLcNyFlN272TC6n+Pfl
 0uX+C6vTTtndMxjKm5byN5vFdxVg0GwLIoEoJwWuns0WUGdROO2+1dhzZdKWoWp4/6I0qHZXSvO3V
 b0UHmFkud2zX/YFmg+nENEt+OXUQh5LT3Gs3nhF3EeiCDkKHe/K+S9GYaq7eqiSfXHn3+tBGM4ynd
 Cz0mbigeg0DtzD6U0hCaJxnixGOU0TmvkUubdRu7YLQRCTiu9O4jyMHOPEFlpG6QftsSvbxvtqzgA
 6gbAiIzwS/WK4J1HlwxETq0/JNEPhHZQ5GzpkGWBbWs+I7RVC0kZ8QkO9qyzUyXG5PUpgQPdCglft
 j8Hxw89g==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1sRf2x-00000009uiC-3NoI;
 Wed, 10 Jul 2024 21:40:19 +0000
Date: Wed, 10 Jul 2024 22:40:19 +0100
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Message-ID: <Zo7_w-BjbbbrxadX@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  For the 6.12 merge window, I intend to submit a patch series
 loosely similar to the one you can find at
 http://git.infradead.org/?p=users/willy/pagecache.git; a=shortlog;
 h=refs/heads/write-end
 (aka git://git.infradead.org/users/willy/pagecache.git write-end) 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-trusted.bondedsender.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [90.155.50.34 listed in list.dnswl.org]
X-Headers-End: 1sRf3I-0006fg-LK
Subject: [f2fs-dev] [6.12] Conversion of aops->write_end to use a folio
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
Cc: Martin Brandenburg <martin@omnibond.com>, ecryptfs@vger.kernel.org,
 Miklos Szeredi <miklos@szeredi.hu>, Richard Weinberger <richard@nod.at>,
 reiserfs-devel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Hans de Goede <hdegoede@redhat.com>, linux-nilfs@vger.kernel.org,
 linux-mtd@lists.infradead.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Tyler Hicks <code@tyhicks.com>, David Woodhouse <dwmw2@infradead.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, devel@lists.orangefs.org,
 Mike Marshall <hubcap@omnibond.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

For the 6.12 merge window, I intend to submit a patch series loosely
similar to the one you can find at

http://git.infradead.org/?p=users/willy/pagecache.git;a=shortlog;h=refs/heads/write-end

(aka git://git.infradead.org/users/willy/pagecache.git write-end)

This is split into a few pieces:

 - Directory handling conversion for ufs, sysv, minix & qnx6, all posted
   recently.
 - Various prep patches in reiserfs, jffs2, block fops, nilfs2, ntfs3,
   ecryptfs, f2fs, fuse, orangefs and vboxsf
 - The big bang conversion that is now appropriately trivial in each
   affected filesystem.

It would be nice to get sign-offs from the various fs maintainers on
the prep patches.  I'll send those out in the next 24 hours.  If you
want to take them through your tree, I ask that you do that for 6.11 so
we're not juggling git trees trying to resolve conflicts in 6.12.

I don't think we need signoffs from the various fs maintainers for the
big bang patch as the individual changes are so trivial.  But if you
want to give it a look-over, the more eyes the better.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
