Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KhBLuQ712lQLwgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 09 Apr 2026 07:40:52 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DCF3C65A2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 09 Apr 2026 07:40:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4EIbfDZcJUgXoyW6VMij1j1mZZWwu7DOG8hHi8KrYOo=; b=Lfa02IVGAGRs8F9kfYUUYg7pLz
	az0Z6CZspipY2IuhRbVMKGnhKxApuyJ3+PCR1C6JSUs7sU4jPop1L7UH0xkJO+7CJy8NgvjwScEAR
	u6xRW6TRL5NV6I3oir2bO5beUzDTNmKKPrQS7fq4Dw10QxEjkwF2sjx+Ee8680XH3qYA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wAi87-00073a-KH;
	Thu, 09 Apr 2026 05:40:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+a4de8e1a1e27f13a2878+8264+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1wAi85-00073S-LG for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Apr 2026 05:40:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o0ScfNlJGSA2uAJMI4ulU1pLyWdBug8Lf8guz+qT7sY=; b=SDkr7S1VYbu64f16vmUojRTjla
 uJ/0wh9UpWKalPyt3NyfEUCY6/qkh8pCpvqvEnNNyjSrd7pFsl0T4DHEngmw7HDjhGXQVJ7onK4sS
 H8QMJo1cQxn1F9akKybFzJtOOdal+398b0uFi1IBI8cUfl9O6kboyQyvcdpX39ZJ6wfE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o0ScfNlJGSA2uAJMI4ulU1pLyWdBug8Lf8guz+qT7sY=; b=j5JLl7IhYI9CELMp49+XwBkpeZ
 ofcaaU31I6t++WuwNN5XZf3HgTsE6EZQZFtuUdCTxTjT6GBeVubpHZYvUX0zrlD3lmY0yXWK61B/l
 S/Zy9eqBuOTWJVbVshfGjz/Z6avnjBIqj3J8GhQBzY+ZiLz5HwAFBCMZ1I7wNTxMkolE=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wAi84-0007li-Ip for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Apr 2026 05:40:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=o0ScfNlJGSA2uAJMI4ulU1pLyWdBug8Lf8guz+qT7sY=; b=4edJFwxsbyJkPqyn1XaMjCDdSC
 FlJdc1layEXP+v7Bc2DUT78tlL2tMpEQhzr+g6u7TDB1lpdV4g2ptYtaNmR0IxILvz7kv4ix348K1
 uNyP3t9DRWiyviPTTydvWMvAMXtodrCA9szonPWUyLmrJTF2zQ/O6koGmwppKavXVt0HE5ZsWy91N
 vqSKoWtyS0HwFYqXcu345tgJGIeqvR0MlM9eOUGlttvMcq9nnZ8c7LmlKHquJloOJMU7S4CIoNFPg
 cxwyYH4tgGgBWNt8y9CmG1B2vkuN98d9XXsUKAnLFzbvg8I9PwHtYf0gNE0QXt4LUi7Nui/3cTqwq
 WmfrJCWw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1wAi7u-00000009jBY-0Up6;
 Thu, 09 Apr 2026 05:40:26 +0000
Date: Wed, 8 Apr 2026 22:40:26 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <adc7yo1_sr_eeV33@infradead.org>
References: <20260406154940.2407853-1-jaegeuk@kernel.org>
 <adaasm42rLxRY2GN@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <adaasm42rLxRY2GN@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  [adding back fsdevel and mm to the discussion] On Wed, Apr
 08, 2026 at 06:13:06PM +0000, Jaegeuk Kim wrote: > Let's check mmap writes
 onto the large folio, since we don't support writing > large folios. 
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URI: infradead.org]
X-Headers-End: 1wAi84-0007li-Ip
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: do not support mmap write for large
 folio
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
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[hch@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=bombadil.20210309];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[hch@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:mid,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 42DCF3C65A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

[adding back fsdevel and mm to the discussion]

On Wed, Apr 08, 2026 at 06:13:06PM +0000, Jaegeuk Kim wrote:
> Let's check mmap writes onto the large folio, since we don't support writing
> large folios.

What does this fix?  As state in the previous round of discussion f2fs
only support large folios for immutable files, how do you get ->mkwrite
called for them.

The only way I can think of that is when clearing the immutable flag,
but simply rejecting writes with SIGBUS after that seems like it's
breaking the expected API, and I don't see handling for normal writes
after that either.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
