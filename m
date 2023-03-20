Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F216C13AF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Mar 2023 14:42:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1peFmI-0001nG-Vy;
	Mon, 20 Mar 2023 13:42:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+c562255d70dcb65b4262+7148+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1peFmG-0001n6-LP for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Mar 2023 13:42:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4nvdeTrbCGVI17LJ6CL04s20971xhX1bwQsBRYlV8qE=; b=Xn+RXv/iPAkugp7h2kj6idhRqR
 9ZI1FWZm8SuTfFxqL/+prV2Um4VVjrebAZRgvbPgbiiFEgdjZZqV58DF+os8GdK54plyPu+0MmhB6
 GZdVVxpn0uaEqzP0m9TErp8eEBTMyxWG/8vWVeu4eZddCoVw8tFvk9Tb3xWV3rqOIrAE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4nvdeTrbCGVI17LJ6CL04s20971xhX1bwQsBRYlV8qE=; b=FFK+pj8a83bncvTAnThyGKsyeb
 9QUbFiAPvLt5YIvmtfveyFnr8SNdsVlm1L+XQ3jHSwtDPWPij8PArg//GexO0Aufc63hvQqQRFbxA
 08ORrN6Ij9P3WZ5sD9ICSaK13R6xslTmLixUrHPL8PeMx9PDMZnxhibhOYlPyIs08LTc=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1peFmE-00EJHt-Vd for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Mar 2023 13:42:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=4nvdeTrbCGVI17LJ6CL04s20971xhX1bwQsBRYlV8qE=; b=n82AssvJ7n/9KqIF/sa0wF812L
 9iiP4WXFSqISNg/zwvDmPWd8CNQCTSb8E1t+lQwmFM9nafJiSPJyKq6XGVUUp0qWZ4lryMGehnaVE
 vC50fFwTZcIJg4y/pKgzJEcxKVtFMtehC6YclcoeCNcPL87wNwWZQXK1y7DA/RR9XbJZXJKOzR07Q
 EIuz4NBLXDNKeR4s5k6DCqHjoEM8W5cWB0CjfzeYHspRie+huHaTLJQ09IRoUUIOGSSCjbmjWaT/z
 7rjEsy5r7eU3isCXXjahi+g8LwT7337U0vN44M9VeArzieqET283zDbvLZSE4EYE4d4EmFdGN1usa
 8qCB1wSw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1peFm4-009DTd-0d; Mon, 20 Mar 2023 13:42:08 +0000
Date: Mon, 20 Mar 2023 06:42:08 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Hans Holmberg <hans.holmberg@wdc.com>
Message-ID: <ZBhisCo7gTitmKeO@infradead.org>
References: <20230220122004.26555-1-hans.holmberg@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230220122004.26555-1-hans.holmberg@wdc.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Feb 20, 2023 at 01:20:04PM +0100,
 Hans Holmberg wrote:
 > A) Supporting proper direct writes for zoned block devices would > be the
 best, but it is currently not supported (probably for > a goo [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1peFmE-00EJHt-Vd
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: preserve direct write semantics
 when buffering is forced
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
Cc: damien.lemoal@wdc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Feb 20, 2023 at 01:20:04PM +0100, Hans Holmberg wrote:
> A) Supporting proper direct writes for zoned block devices would
> be the best, but it is currently not supported (probably for
> a good but non-obvious reason). Would it be feasible to
> implement proper direct IO?

I don't think why not.  In many ways direct writes to zoned devices
should be easier than non-direct writes.

Any comments from the maintainers why the direct I/O writes to zoned
devices are disabled?  I could not find anything helpful in the comments
or commit logs.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
