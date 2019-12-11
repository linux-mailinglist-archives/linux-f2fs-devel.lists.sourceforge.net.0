Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B04CD11AC43
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Dec 2019 14:40:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1if2EO-0005ih-TE; Wed, 11 Dec 2019 13:40:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1if2EN-0005iW-Ry
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Dec 2019 13:40:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TO/NQu43CwshSv+vhfJaELWZCqACamoqyzyHY52rGyI=; b=baLUhmfcnzQzwCfiew9jmZg6os
 8CWiBgckEP4DWBwOVVZC1sgl+RTP6qE5MeSgRaUoWYg5lGCuEFJGxtnWqfkh2WyH6WtnkivdK5z3P
 ZVtr5Sd7qQ2B1vJU2CfOz1yEnSVeCK82btFSw51n18vXCf9yrLg+97rN8x5AcHnwSdYc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TO/NQu43CwshSv+vhfJaELWZCqACamoqyzyHY52rGyI=; b=QJ6Jx2XaDSqHI0Bcn7bxp563WK
 O3tr8YvzcNBgOIR4AI96RWcsWiOaL/TI9I5WH4YR5oCADtR/71s9e1hyZcpK1WdGC3WMpLiDBf7Vm
 WM9PpdovEKPcQjfiwl/Yk5GnFuxRFovdP8FeiUYSbkBin4dc0Zqsq3MHJzs0WqL8pOf8=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1if2EL-0066JQ-S7
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Dec 2019 13:40:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TO/NQu43CwshSv+vhfJaELWZCqACamoqyzyHY52rGyI=; b=Hm5ukJbKRW/dIRfBb/2QNZWe2
 Vae7uQ8jSnwfWdaHao9+Puztkj99WQrJ7zQDtxi3TKPOo51rd+fWVnahFZcDzJMLSfqaeCVOxY8r8
 hSDFkS06G9RcE/1zSS+DssYsnx/A7E90d2pwJo7gUwe3HnBcGCaB6EInTzmXq7MjnqZrB6PQ9l80I
 7ew0MBvO3B1tKmL5VXVbKgHK2ypAVx9SJpNzWZYDva4N0EkaT4mjOj0OdxLfNDh2Hm0LJ+ExnAOxv
 /fglK8GQjc+Ilwz9wP2d/9ugBdBSYMjmgf/rR71BiJvLC/FiZ8ANkzJvpE2LyxvPeev4t3IujdjyX
 vbRr8RJTA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1if2Du-00050n-Qc; Wed, 11 Dec 2019 13:40:14 +0000
Date: Wed, 11 Dec 2019 05:40:14 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Gao Xiang <gaoxiang25@huawei.com>
Message-ID: <20191211134014.GM32169@bombadil.infradead.org>
References: <1576030801-8609-1-git-send-email-yangtiezhu@loongson.cn>
 <20191211024858.GB732@sol.localdomain>
 <febbd7eb-5e53-6e7c-582d-5b224e441e37@loongson.cn>
 <20191211044723.GC4203@ZenIV.linux.org.uk>
 <4a90aaa9-18c8-f0a7-19e4-1c5bd5915a28@loongson.cn>
 <20191211071711.GA231266@architecture4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191211071711.GA231266@architecture4>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
X-Headers-End: 1if2EL-0066JQ-S7
Subject: Re: [f2fs-dev] [PATCH v5] fs: introduce is_dot_or_dotdot helper for
 cleanup
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
Cc: ecryptfs@vger.kernel.org, "Theodore Y. Ts'o" <tytso@mit.edu>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, linux-kernel@vger.kernel.org,
 Tyler Hicks <tyhicks@canonical.com>, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Dec 11, 2019 at 03:17:11PM +0800, Gao Xiang wrote:
> > static inline bool is_dot_or_dotdot(const unsigned char *name, size_t len)
> > {
> >         if (len >= 1 && unlikely(name[0] == '.')) {
> 
> 
> And I suggest drop "unlikely" here since files start with prefix
> '.' (plus specical ".", "..") are not as uncommon as you expected...

They absolutely are uncommon.  Even if you just consider
/home/willy/kernel/linux/.git/config, only one of those six path elements
starts with a '.'.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
