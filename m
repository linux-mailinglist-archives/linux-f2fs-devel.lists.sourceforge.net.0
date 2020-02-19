Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C56164B85
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Feb 2020 18:07:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4SoM-0000ER-J0; Wed, 19 Feb 2020 17:06:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j4SoG-0000Dx-6p
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 17:06:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6hWL64aU7/cD1s4UTpPss89s1pka8CcWGCJ5BHjUC9M=; b=dxktpkN7XbUxoK9YVmkF183xZF
 VgH4TGCHFXHzcTRizU+kQckfQWHq0yxapuGsMIiVE2eIQSCs4Vhqhxd9cF1kcEySAYHzpxcdsOzzp
 A+z1OkUOxwnfhraeOITOw3HZSChoToutX/cE7vWi/2pm51OwVz5Twy9eipgZ2KzUhjrM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6hWL64aU7/cD1s4UTpPss89s1pka8CcWGCJ5BHjUC9M=; b=kje/b9hwcFaniYx1B5H8YZXhQQ
 193AkbW4YkrwsI++uu2JtsqiAH/tmRn27Lpj113RCZNiaWgCaO1qPAsbyqOG7YWKop9iUCdcYrojZ
 /8CwnxIVphswuzlVaG9s+3tKK2wK/cWOSLdqRhll7qCT4dwHdsRp4Fw/65WdTmeDlHD0=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4SoF-0006eA-5x
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 17:06:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=6hWL64aU7/cD1s4UTpPss89s1pka8CcWGCJ5BHjUC9M=; b=YD6KASfCXNzBE2g7U8C3OPAIMa
 RN+ihaDs+TqA1PVmJY/G+571Br5Ulv0XQc9EhsoYwQWJIGDt5eVY3v+7OW0ZDPPydpAvd+XANKK7o
 Yieli5fHS4G8IkuA6ZGWdtYi3uF69BcBtjkIg1txQfTuEC38FUNQpMva7d6LZIwTpJqOi2eTnjQ26
 vNRvjsTCftaqhGEu3hEvctNIgYhTUrWaBzOu7hsE+5KmGRNAeS2s5R2DU2EMQh/fz/4XG6YC8Yfkl
 lb7zA1cZfGKpjcKVeyriFSjz0Jf9srJLBGVWu7kMAFznlMRG+bjJHweFWDFekIpMDNj5yFPnAlDOG
 rO8cGwug==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j4So6-00016p-If; Wed, 19 Feb 2020 17:06:42 +0000
Date: Wed, 19 Feb 2020 09:06:42 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20200219170642.GS24185@bombadil.infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
 <20200217184613.19668-31-willy@infradead.org>
 <20200219032900.GE10776@dread.disaster.area>
 <20200219060415.GO24185@bombadil.infradead.org>
 <20200219064005.GL10776@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219064005.GL10776@dread.disaster.area>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j4SoF-0006eA-5x
Subject: Re: [f2fs-dev] [PATCH v6 17/19] iomap: Restructure
 iomap_readpages_actor
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
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Feb 19, 2020 at 05:40:05PM +1100, Dave Chinner wrote:
> Ok, that's what the ctx.cur_page_in_bio check is used to detect i.e.
> if we've got a page that the readahead cursor points at, and we
> haven't actually added it to a bio, then we can leave it to the
> read_pages() to unlock and clean up. If it's in a bio, then IO
> completion will unlock it and so we only have to drop the submission
> reference and move the readahead cursor forwards so read_pages()
> doesn't try to unlock this page. i.e:
> 
> 	/* clean up partial page submission failures */
> 	if (ctx.cur_page && ctx.cur_page_in_bio) {
> 		put_page(ctx.cur_page);
> 		readahead_next(rac);
> 	}
> 
> looks to me like it will handle the case of "ret == 0" in the actor
> function just fine.

Here's what I ended up with:

@@ -400,15 +400,9 @@ iomap_readpages_actor(struct inode *inode, loff_t pos, loff_t length,
                void *data, struct iomap *iomap, struct iomap *srcmap)
 {
        struct iomap_readpage_ctx *ctx = data;
-       loff_t done, ret;
-
-       for (done = 0; done < length; done += ret) {
-               if (ctx->cur_page && offset_in_page(pos + done) == 0) {
-                       if (!ctx->cur_page_in_bio)
-                               unlock_page(ctx->cur_page);
-                       put_page(ctx->cur_page);
-                       ctx->cur_page = NULL;
-               }
+       loff_t ret, done = 0;
+
+       while (done < length) {
                if (!ctx->cur_page) {
                        ctx->cur_page = iomap_next_page(inode, ctx->pages,
                                        pos, length, &done);
@@ -418,6 +412,20 @@ iomap_readpages_actor(struct inode *inode, loff_t pos, loff_t length,
                }
                ret = iomap_readpage_actor(inode, pos + done, length - done,
                                ctx, iomap, srcmap);
+               done += ret;
+
+               /* Keep working on a partial page */
+               if (ret && offset_in_page(pos + done))
+                       continue;
+
+               if (!ctx->cur_page_in_bio)
+                       unlock_page(ctx->cur_page);
+               put_page(ctx->cur_page);
+               ctx->cur_page = NULL;
+
+               /* Don't loop forever if we made no progress */
+               if (WARN_ON(!ret))
+                       break;
        }
 
        return done;
@@ -451,11 +459,7 @@ iomap_readpages(struct address_space *mapping, struct list_head *pages,
 done:
        if (ctx.bio)
                submit_bio(ctx.bio);
-       if (ctx.cur_page) {
-               if (!ctx.cur_page_in_bio)
-                       unlock_page(ctx.cur_page);
-               put_page(ctx.cur_page);
-       }
+       BUG_ON(ctx.cur_page);
 
        /*
         * Check that we didn't lose a page due to the arcance calling

so we'll WARN if we get a ret == 0 (matching ->readpage), and we'll
BUG if we ever see a page being leaked out of readpages_actor, which
is a thing that should never happen and we definitely want to be noisy
about if it does.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
