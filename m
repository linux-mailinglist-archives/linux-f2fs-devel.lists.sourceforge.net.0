Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEY/D06QFmrHnQcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 May 2026 08:33:50 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E01885DFE38
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 May 2026 08:33:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=26QTzVprqzrdFJlRu8PeLDPBKKmPbpr6IFtkztMzRtU=; b=Qqa0cQ/xCq7j9SjSvk22uGAZGI
	icPA0yCEfZt5VCYtYiYngGQivzMKN343BeJ4M1XzEAZlISiYeBsx7uzPK81HXLRyZ6e+3hbB2KXd/
	+oTUBX5l1T2meknVtz3uxFXswYKC04Xc0D2QTXEwJVpyXEDD/+U4rSbgUmNo8ZeqNXuE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wS7po-00067o-Tg;
	Wed, 27 May 2026 06:33:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+e9735a96feccf8b5d28d+8312+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1wS7ph-00067d-47 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 May 2026 06:33:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eEdEkrkWD4PUlydL5ruu4HP9SQ8xgA8dkqdrg8+Pz5w=; b=CCFbimQrAHq7VKEBF+uQuQ2RvA
 /zOnuLqr1mJZs+VOP4kE7uSkHp04S8vw8OxcJed/DKN/sb0hZNEV7vhFTCty+aas+NCDO7oHDDo+Z
 MDNXzqqmYR6IatV/vAKz5e/ebmIIaTTBs9CI1OYkgB5q12npj2ZGQaOHYXHmSLx3IQ5o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eEdEkrkWD4PUlydL5ruu4HP9SQ8xgA8dkqdrg8+Pz5w=; b=PedjHoWn+3Vww72AhApF4ErBVb
 O2EIgUuchULz/pGiKx4V8UNjZsQLduDxhSnhlU1Ggy80nq0q1Pa1r00EEzIXHOqtY1quVfwuJS4Xf
 vFWhZTx0D88z/v+iZNGYtIL81eqRkRhFxIwT8KyhLnIhX4O6rt639TdwAyunJUPv4qiY=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wS7pb-0005OG-Ju for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 May 2026 06:33:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=eEdEkrkWD4PUlydL5ruu4HP9SQ8xgA8dkqdrg8+Pz5w=; b=L292o9BdhdzRX7dwCnyh8lXw/Q
 aInv3spzoL36ml6byXQJAIP6c9rHzdAI5XAEMaBYcWQ5td2NKk7V0VE8JKmrjzq8K62svpG9FXk+c
 TFZvUtfQPoTtDUuw2y7XIsGGA/r5AtmGWBqsmyTKCqbeS3wZjw+Ih11M0mxzTfHQRUa+vlwVSIcUc
 wbRyatrxwjWJ6C/55O3pN/OePsPXDeFlSRao18JdofJn3iJZRz7Rr3oLIEmwxK6SU/Fsbruyfp+YJ
 BUdSW/zV0p8QL1lTXQMNKb89ugT8wK+V4ePi1SkXf/I6ET/GgcXt4J5GTQ0YYHd1Igil+9vMYCg0t
 eLerb5vA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.99.1 #2 (Red
 Hat Linux)) id 1wS7pQ-00000003PH6-0KFC;
 Wed, 27 May 2026 06:33:20 +0000
Date: Tue, 26 May 2026 23:33:20 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <ahaQMKe7qf63wqni@infradead.org>
References: <ag7HfNryTmQ-bVIS@infradead.org>
 <20260521155748.GA79343@macsyma-wired.lan>
 <ag9D6_7dttbDGHZ6@casper.infradead.org>
 <ag_UsW_OrlXD9dWX@google.com>
 <ahBSXyOi9b1jxNkX@casper.infradead.org>
 <ahBii6bk0KbK_NHV@google.com> <ahPffhaOi2CBtWof@infradead.org>
 <ahT1nT3xsMGkyJab@google.com>
 <ahUF7HqSKFJ422bU@casper.infradead.org>
 <ahUX4tBeLykdQNxY@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ahUX4tBeLykdQNxY@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, May 26, 2026 at 03:47:46AM +0000, Jaegeuk Kim wrote:
 > Thanks for the feedback. Actually, I tried to do compact_memory before
 doing > read() for AI loading, but I got complaints where it took [...] 
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wS7pb-0005OG-Ju
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: another way to set large folio by
 remembering inode number
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
Cc: Theodore Tso <tytso@mit.edu>, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Akilesh Kailash <akailash@google.com>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:tytso@mit.edu,m:linux-api@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:hch@infradead.org,m:linux-mm@kvack.org,m:linux-fsdevel@vger.kernel.org,m:akailash@google.com,m:christian@brauner.io,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[hch@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=bombadil.20210309];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[hch@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,infradead.org:mid]
X-Rspamd-Queue-Id: E01885DFE38
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 03:47:46AM +0000, Jaegeuk Kim wrote:
> Thanks for the feedback. Actually, I tried to do compact_memory before doing
> read() for AI loading, but I got complaints where it took hundreds milliseconds
> to run that compact_memory. Is there a good way to secure high-order pages before
> that read()? It was quite hard to project when it will happen.

Make sure that all files use large folios as much as possible so that
you have a lot of clean pagecache to reclaim..   Same for any other
easily reclaimable memory through shrinkers.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
