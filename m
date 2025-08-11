Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A13B20658
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Aug 2025 12:52:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hTk2Wm4wCXw3UIg71xiBRKm+GXxi7b8MflpB3bZmgIU=; b=XJx7MlESEVlELq9DHGHNmtUqIz
	ueKSQvZoXbKQr6/GZZT0fIf3bqZF0k54iZqBe2CIvIJDdAq0NqPwnqvCbix9uRZdyJ4zfS0uxcpzJ
	7T0SmB1NEusDoe/QoGHrkof7HCA/DCTdpNjCi7tJlseD1GPbeuzHJB0eX5ZUPq/ZiXgU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ulQ93-0000uV-AT;
	Mon, 11 Aug 2025 10:52:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+a9f12cc7f841024afb7c+8023+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1ulQ8f-0000u6-He for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Aug 2025 10:52:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r0kNG01CA6dOzzsRnPvIcMq2oWocxxH3LcP8Ljz9034=; b=PPwaFmOhGJ6ZmOKdsh7D7jE5hc
 /AP+2m7368LH+C7TFVuqL/bD1DUuIMO5oct2Fie4Xmwmx4XHj7j1LoZMchMXOrMBogeleYMcJ/ws5
 xXHm6w7AQETBmgdIWwbUkLSWscI4UHwcxxnjDXDDRYAEONFa5oOgGxxhVa3xVDKjhLJY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r0kNG01CA6dOzzsRnPvIcMq2oWocxxH3LcP8Ljz9034=; b=Jl+aSK3XgJoQ30SdfI8NR7DHV3
 P8qID4PbqIzRqeUz5tq3XgLdXvwl+qy3b2Yins2uk6E9oxbGbtICK3l95AArqVeC+Cr5rxU+pj3/c
 pTeO5VJW92yg13hrxw6zt2j40xNjGgX3mG/+klTc4J8QH57iP5pjLamoyYO9q0+uSzpM=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ulQ8f-0005re-6P for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Aug 2025 10:52:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=r0kNG01CA6dOzzsRnPvIcMq2oWocxxH3LcP8Ljz9034=; b=g8SAFBFU7m+GF+PrkhLKmFMoVv
 aTlPYoUoQxhawI1WRbb6rB+6ky+vo+mzcKjFCLYDo2Wlx3Jn5gnBP9JhbBdUWweYbEkgm7ZXkQeC0
 rRRJtqtfZPc49dnFElvG6m0stugCZWJbxnbsdjzlVLhly1tqCHHiY5guJcTS8a5eqVs5SncvdE5WP
 SkmGvWu9/bUKB8MtNWxlURk1WhT3ykWhV7WPjfGlfEcGVCs5cbgTaglajbm7SUd30A3qQxD1OTBSm
 o+un9nWU4NtNbgZEPj5Gy/hl9qLx/Fyn/pfIP0/RcLPalLad9zGGNh0Hq7XIqGPB322mXb2bvJH3x
 AKzFzeiQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1ulQ8U-00000007PQj-3cIg;
 Mon, 11 Aug 2025 10:52:14 +0000
Date: Mon, 11 Aug 2025 03:52:14 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <aJnLXmepVBD4V2QH@infradead.org>
References: <20250807034838.3829794-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250807034838.3829794-1-chao@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Aug 07, 2025 at 11:48:38AM +0800, Chao Yu wrote: >
 This patch introduces a new sysfs entry /sys/fs/f2fs/<disk>/flush_policy
 > in order to tune performance of f2fs data flush flow. > > For exam [...]
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1ulQ8f-0005re-6P
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: introduce flush_policy sysfs entry
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
Cc: linux-block@vger.kernel.org, jaegeuk@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Aug 07, 2025 at 11:48:38AM +0800, Chao Yu wrote:
> This patch introduces a new sysfs entry /sys/fs/f2fs/<disk>/flush_policy
> in order to tune performance of f2fs data flush flow.
> 
> For example, checkpoint will use REQ_FUA to persist CP metadata, however,
> some kind device has bad performance on REQ_FUA command, result in that
> checkpoint being blocked for long time, w/ this sysfs entry, we can give
> an option to use REQ_PREFLUSH command instead of REQ_FUA during checkpoint,
> it can help to mitigate long latency of checkpoint.

That's and odd place to deal with this.  If that's a real issue it
should be a block layer tweak to disable FUA, potentially with a quirk
entry in the driver to disable it rather than having to touch a file
system sysfs attribute.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
