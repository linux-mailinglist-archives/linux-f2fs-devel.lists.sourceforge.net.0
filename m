Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D0F3F0740
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Aug 2021 16:58:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mGN16-0001Qd-Hf; Wed, 18 Aug 2021 14:58:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <willy@infradead.org>) id 1mGN14-0001QR-Bn
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Aug 2021 14:58:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2g9pHgPWd8S7JZggCdeaLifcdNQhzjXv9Us4Fn7c/eI=; b=Yw1HlkHnrwIwUYZWV7mSpd73Cz
 r/SeAqioy/mkXSpoAxUg+lRHee4d2E6/KNrxP1p4y2iAYTKzpp4u+ydS1TZkuAZ/BVNmpnlswcj6n
 OKyKh6ueY7n2oiWwsrmztVZeiK1OUTx9oym7s1EAS3u3z+j3EWNmatQ5iUd9vHDyDUWk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2g9pHgPWd8S7JZggCdeaLifcdNQhzjXv9Us4Fn7c/eI=; b=m6t/cClWgFCOa11CYM5aSEfOCY
 0hELcDIRsfFttk1sI9BMTJ1+H2YFA8N0Gjh/VE9nvKGSjmwM4k3T5gVEgA44CBtwp+XkksUnzGemB
 Djke12g6HPzJzAL9RbpMRr/hjl/DbOVUT02sdZG9CTTKnDW4Ven2i7XiLUvhUEFmJjx0=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mGN12-000271-VQ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Aug 2021 14:58:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=2g9pHgPWd8S7JZggCdeaLifcdNQhzjXv9Us4Fn7c/eI=; b=N8qRgySgPaN8uFwsK80Yh+8FUX
 VR3QrfrKBDWlRNxVfoy9ZZH7x4PzD/Rq9q7K3Vsq+YSfsxbfK8mYMQf8gQhKILSXrkva9jhbPHmwt
 1epA5C+rpKIVUWfFLqSiEv34+yfGAeHpn0xDEacnhYKKdNG5rRurcqZGU8EqLTW+zIxJ3a/5wg2mq
 dR6pbhupiIJ/Mx6b7er3EtvyWEyzZ7JJn74hIKTJAcOpWkz6LiKTGiysweRIs3APr6/wBZAMAfAMk
 CFPtXiU94BMz6MAOVwCPFqoPvSsbkPuDsURTCJzG/g1if/amVJWLIofqClORmA2pEiStrDVmNAWsX
 fNUatxHw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1mGMzz-003xBU-UN; Wed, 18 Aug 2021 14:57:08 +0000
Date: Wed, 18 Aug 2021 15:56:59 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <YR0fuyqe7NS+mCf9@casper.infradead.org>
References: <20210818140651.17181-1-hch@lst.de>
 <20210818140651.17181-12-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210818140651.17181-12-hch@lst.de>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1mGN12-000271-VQ
Subject: Re: [f2fs-dev] [PATCH 11/11] unicode: only export internal symbols
 for the selftests
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
Cc: linux-fsdevel@vger.kernel.org, Shreeya Patel <shreeya.patel@collabora.com>,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Aug 18, 2021 at 04:06:51PM +0200, Christoph Hellwig wrote:
> The exported symbols in utf8-norm.c are not needed for normal
> file system consumers, so move them to conditional _GPL exports
> just for the selftest.

Would it be better to use EXPORT_SYMBOL_NS_GPL()?



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
