Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 08648CFC269
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 07 Jan 2026 07:08:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zmXpyfIhChapB9GbWFcEx/ptSgjGp+Z3Vs8lwsyVz48=; b=jikCiqGHwCLeM5cJN9Hk8TCCSJ
	LESsKbDiaYq2n2KUHpFxS3WbEqlQbGgclYPIfHRHhRJBoMkmCvhzjHKj4sErHcyFKVVcEniPztyKc
	iiQjmMusK2f8BjpVtglP0Tn4jiIjy4O3aYYCo546MSa5FjCVsAEPOiqKmnjloymfhNsE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdMiw-0005VZ-5p;
	Wed, 07 Jan 2026 06:08:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+b20c6d4e813e90af7b7b+8172+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vdMit-0005VP-Pa for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 06:08:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uUK7t4Vymu+X40L8L7QXfKgtGhGr5yJBJiCcKwE8g38=; b=kgCu9x6vzrAUfqXj1qyzy1YhLi
 Vao4UbLJfHKtbjvAUeMRN5z1c8LuwkFrx4xmUA4REsFMksUhvX6fXkXWWfYFYWgtEDWORrovWyI1X
 9mN/CosnVrwGeVJjAp2FwoS63AfYeuMAwdClHa/LYFffLrFsIXKxio15TI0yGr2swgFk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uUK7t4Vymu+X40L8L7QXfKgtGhGr5yJBJiCcKwE8g38=; b=NGqeKMNCPLpFwufGobd1iI7orb
 3wh4npWUjp0QwCo3Ba/ZB2WsEH/GCOrBprPPcrGjltZOA3ZYXVqIFTBVX7VxJAMWIIEkSR9v20kit
 glUIsR31GUS8vXnhh6DIbo6F/GtwoXTObAvkVFxCwoJZayoMaYX3kocOzGlMNJfU0GMw=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdMis-0001mh-Oj for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 06:08:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=uUK7t4Vymu+X40L8L7QXfKgtGhGr5yJBJiCcKwE8g38=; b=TtfsuCfQhT9nJX3ScLTwq572T9
 lJ0uhvcEJp7vtVOKOdqn0urk1TZEOXyThO+TYmrlwCjYMwefdOdJ8GKz3oG/LIAOWGOMWP+2sImOn
 iXSCH9s4FHb7n2SI97O4lAbEEVk7AaHn3MPDQSoB+Xtto1qgTw6om4Fy6vI5fvtsqNglTziU85P3x
 C0/cpBfNicpO8afu8Xs5X7N/InEe6c1Y/wSXidj5Pa3d8+99rN9w+YWDi3vSKeuOEBRakrYW3FCuX
 40OnSHZ11Xo8BaIf6hCpBmpy+i3mr6UTXz4x62IapeHf2bqo1BtlTiyWrcWn8ywRDovNPFLZw2g14
 Zx6ci76Q==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vdMim-0000000ECXs-46ng;
 Wed, 07 Jan 2026 06:08:40 +0000
Date: Tue, 6 Jan 2026 22:08:40 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Joanne Chang <joannechien@google.com>
Message-ID: <aV34aGUeU0pQkwj2@infradead.org>
References: <20251229023145.1806877-1-joannechien@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251229023145.1806877-1-joannechien@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Dec 29, 2025 at 02:31:45AM +0000, Joanne Chang wrote:
 > generic/735 attempts to create a file with nearly 2^32 blocks. However,
 > some filesystems have a maximum file block limit below this th [...] 
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1vdMis-0001mh-Oj
Subject: Re: [f2fs-dev] [PATCH v2] common/rc: add _require_blocks_in_file
 helper
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
Cc: Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Dec 29, 2025 at 02:31:45AM +0000, Joanne Chang wrote:
> generic/735 attempts to create a file with nearly 2^32 blocks. However,
> some filesystems have a maximum file block limit below this threshold.
> For instance, F2FS is limited to approximately 2^30 blocks due to the
> capacity of the inode. So add _require_blocks_in_file helper to skip the
> test in such cases.

I still don't understand why we can't do this programmatically.  I guess
it would be simply too slow?  In that case that should probably be
documented here in the commit log.  Otherwise this looks good to me.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
