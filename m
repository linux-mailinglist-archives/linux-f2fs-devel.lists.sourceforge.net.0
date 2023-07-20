Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE54F75ADE8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Jul 2023 14:09:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qMSTD-0006t7-0u;
	Thu, 20 Jul 2023 12:09:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1qMSTA-0006t0-TB
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Jul 2023 12:09:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CgNOtes5J1KEGl7r8pdH5e6D9XPEpOwPui3cmJO+D8k=; b=J1wSVDG9fxe61Iu5jJy7rk1P2P
 My8L0kdMZ9yEv52O94vM93DCuCJIQFht1T9TFZENV2rI5IAMv2p903SX2PZcKLMOwGn7fjPJV9bHL
 n00VR0W409vwtoFJfdho0SFcLkrWEgyMtYClxzhMgkbKaNsIc+J9gDglemCWqkx67XaE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CgNOtes5J1KEGl7r8pdH5e6D9XPEpOwPui3cmJO+D8k=; b=YGsZ/DLukGM4g8rjOYkz6vmG7W
 qXnZJVmWqt1eSOFXTJTDwed33T264nBeWCsALwmhoQr8Pbb5pyT+s4lCMjse3EOIPX+VIdaktpems
 I97qfoQF20aFVIf7QSYWf9W2hZsYwlrX8cGgV3X8QvuS+aiHqxbUoUhAznd5Ei1HwChY=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qMST9-00E2Dj-RZ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Jul 2023 12:09:20 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id E90C16732D; Thu, 20 Jul 2023 14:09:10 +0200 (CEST)
Date: Thu, 20 Jul 2023 14:09:10 +0200
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20230720120910.GB13266@lst.de>
References: <20230424054926.26927-1-hch@lst.de>
 <20230424054926.26927-17-hch@lst.de>
 <b96b397e-2f5e-7910-3bb3-7405d0e293a7@suse.de>
 <ZG09wR4WOI8zDxJK@dread.disaster.area>
 <ZG4SGYOogQtEZrll@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZG4SGYOogQtEZrll@casper.infradead.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 24, 2023 at 02:33:13PM +0100,
 Matthew Wilcox wrote:
 > As you can see, do_page_cache_ra() does limit readahead to i_size. > Is
 ractl->mapping->host the correct way to find the inode? I alwa [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
X-Headers-End: 1qMST9-00E2Dj-RZ
Subject: Re: [f2fs-dev] [PATCH 16/17] block: use iomap for writes to block
 devices
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 linux-nfs@vger.kernel.org, cluster-devel@redhat.com, linux-xfs@vger.kernel.org,
 Miklos Szeredi <miklos@szeredi.hu>, "Darrick J. Wong" <djwong@kernel.org>,
 Dave Chinner <david@fromorbit.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, Hannes Reinecke <hare@suse.de>,
 linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, May 24, 2023 at 02:33:13PM +0100, Matthew Wilcox wrote:
> As you can see, do_page_cache_ra() does limit readahead to i_size.
> Is ractl->mapping->host the correct way to find the inode?  I always
> get confused.

As far as I can tell it is the right inode, the indirection through
file->f_mapping ensures it actually points to the backing inode.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
