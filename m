Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9612D10A230
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Nov 2019 17:33:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iZdmI-0000oM-Kk; Tue, 26 Nov 2019 16:33:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+d4a54a23a33e22f09709+5938+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1iZdmH-0000ny-Dz
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Nov 2019 16:33:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cP6D8d93btaoA8qKKMvE5cAQ11moEVEbDuB/dLF9EyE=; b=brUx2ZAPOytIq/ZanI2jycZ1ur
 ZeyLAHcZ4pwgUZJsQQugfXDEVYLFwv9/h/nUn1F8BxueK0lXbrdSG1bugaimuBDckX5HB9DBl9Tax
 NEvUfvLxqeQhAtx6LN8IL6bAQhCA4V74DhWsZh6UAlK0zeZ/sks3rzleWy6u2CbPQhU0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cP6D8d93btaoA8qKKMvE5cAQ11moEVEbDuB/dLF9EyE=; b=cUUyiZ6TWeliguqTeWnJEKTCCN
 7Zda1B4loDYgZnFar4gO0vDQOcGnSc1pBTrvwSgBx6bbacQsL+UYGGt+aLTtKlxCZB9elO+FKHkPB
 fMnmU5UISyku1cuqLUn4lkK+5Q5KsTfy2LQhLKFMi/IbYhPoomhYw4VQreafINzlfrT8=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iZdmG-00EAFs-0r
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Nov 2019 16:33:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cP6D8d93btaoA8qKKMvE5cAQ11moEVEbDuB/dLF9EyE=; b=O865r2R5Df3+XvnupVgKsHKR7
 N+KUqyQTu01ck0k+RGuNCnvWDOXz7KHLCfS8l/GsJyvXcmIQ6RBDborEb6f0ta0fPiQDiIaVtsl2n
 iFvwBw8eA0/Z0sQ4qintTOrKzZbOzr56Rd/Jn15ThIhKWQ8N9HfajwHZ4vLTBm2ee7++zRj7QcnGD
 ROfwSDHIaVb7+UFgFQxUgequQ6/OY0xQGr0ihFwX+MqOJ9Di0d6e3TbsmfDPWrAj0KX+AFWh4ffv7
 Vug3oVJnr52Eav3PwickrC1puoquU+b/ti23rL5+SsQa6lYYe6uM3Je87dd9aoAKevQCasRMROtcX
 jyBhJcMWw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iZdm7-0005YJ-4G; Tue, 26 Nov 2019 16:33:15 +0000
Date: Tue, 26 Nov 2019 08:33:15 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Damien Le Moal <damien.lemoal@wdc.com>
Message-ID: <20191126163315.GB3794@infradead.org>
References: <20191126075719.1046485-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191126075719.1046485-1-damien.lemoal@wdc.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iZdmG-00EAFs-0r
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix direct IO handling
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
Cc: Javier Gonzalez <javier@javigon.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Nov 26, 2019 at 04:57:19PM +0900, Damien Le Moal wrote:
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 5755e897a5f0..8ac2d3b70022 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1073,6 +1073,8 @@ int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *from)
>  	int flag;
>  	int err = 0;
>  	bool direct_io = iocb->ki_flags & IOCB_DIRECT;
> +	bool do_direct_io = direct_io &&
> +		!f2fs_force_buffered_io(inode, iocb, from);

I don't think this is the right fix.  The proper fix is to clear
IOCB_DIRECT when falling back to buffered I/O, preferably in the
filemap.c helpers as well.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
