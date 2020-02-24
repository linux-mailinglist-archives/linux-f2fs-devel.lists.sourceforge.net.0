Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 320DE16B337
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Feb 2020 22:53:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j6LfR-0001Jx-W3; Mon, 24 Feb 2020 21:53:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+fd4c774fa746ae91f5d1+6028+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1j6LfP-0001Jk-Dh
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Feb 2020 21:53:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mw9BVCxn7pfkdLzlqdnU62sf9jMMFSFqSbqAU1P/njM=; b=X/+8tkqZGW5eTOKZp4OQK8hF1F
 SjUSiH70Fx2H/l3pKAdbHKfu0Wfa9e0JGffZ566Rz8kI3cqCJZTtkQKv0k6+kOW+Q+nn1gZeSYTz3
 XNDkCNsd6r+bZuPd8aJEUNOnVrEJqHmkmQ0xnTMh0JRRQC1Z9QwjoVcl0ZnIUI+0Ve14=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mw9BVCxn7pfkdLzlqdnU62sf9jMMFSFqSbqAU1P/njM=; b=ib9qgHPWfwj/YOr3m5kq5LwU/T
 Aw6PcS/tfDivNSQU2nFfcSb2Q8hx2+pQ6+T3l0EBtKE4782Q5JU2XALeeuehs69vdX/Vh3AkVgBAy
 WshkHAKXzfeUs6LooYtmJ94gkbbT0xLvcCYWVNnghS6P+oTSDs2WxmPBVH/lyMAvbiY4=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j6LfO-00FSRw-Dm
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Feb 2020 21:53:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=mw9BVCxn7pfkdLzlqdnU62sf9jMMFSFqSbqAU1P/njM=; b=RwxpBsPsAgcRXU3+CiEQvZpAse
 L2XfCTem5LohmiBMGiEV7Hm4Q3mq7vEyPk+b+gdQxjievErsV1U0sY4fKiS2rqk8DgPLM6tE/jyo7
 RUfRapcRZfourQ1+8voII3tkr9GhwLaPUKBKdb6fQeopIO4chmzl/v5t6FIfWR7wbQiRF1O6EBK0h
 WaTduDEs7a07V+6hmEAGyqVmyNUglmconIZmqhNx+20JaYUAmyxvUJX8V1fiSDOy0IFJWCuWrnlre
 puYN8dx/kZQdNIUe/ZOCrJV6SjguxVWedPzERekOT5SPrIVJ6wsJiCGW49A+qXEg0yXWQjvam0IVc
 Md0CFWPg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j6LfI-0004DG-G7; Mon, 24 Feb 2020 21:53:24 +0000
Date: Mon, 24 Feb 2020 13:53:24 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200224215324.GA16051@infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
 <20200219210103.32400-13-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219210103.32400-13-willy@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
X-Headers-End: 1j6LfO-00FSRw-Dm
Subject: Re: [f2fs-dev] [Cluster-devel] [PATCH v7 12/24] mm: Add
 page_cache_readahead_unbounded
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
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Feb 19, 2020 at 01:00:51PM -0800, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> 
> ext4 and f2fs have duplicated the guts of the readahead code so
> they can read past i_size.  Instead, separate out the guts of the
> readahead code so they can call it directly.

I don't like this, but then I like the horrible open coded versions
even less..  Can you add a do not use for new code comment to the
function as well?

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
