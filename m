Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC3B3F0743
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Aug 2021 16:58:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mGN1O-0007YK-Vo; Wed, 18 Aug 2021 14:58:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hch@lst.de>) id 1mGN1N-0007YE-FW
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Aug 2021 14:58:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AdDChgYKFP5pDXKjILxzg9xwSt+lGrgGqLpKDvBxBd0=; b=QJBljwcsRASBdUAqloxCUke6VL
 w+Dfrqr3umaoHjLCmWb5BzToXOJDiR/E5n+IJvfuZDtslNQG1cjTMG0vOZFHvjwuE5P0j3yT8Q/1B
 RbJ14qRvsgBwUTHX0SW3CdCy4G1KMBtNQ6KfZFwyB5Y/E0XgPrMRCKK98SE41aD9F1+I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AdDChgYKFP5pDXKjILxzg9xwSt+lGrgGqLpKDvBxBd0=; b=SQWzyc33ziMhu1Zb1Z5oSb5BeM
 JAoZcTBskVSIjDGJBBi1Onz8Pz/xuLTHQ8jOfF1LTnScfAzDsW8KVKAC+7yFTFONY7F1Wlgy6oX26
 FKCYx8PC8DJSLnvUv3T0M75tW6DbJ544IyeEQIo8QafeNNKM2LyoUjgphcgGfrU2P3oM=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mGN1L-00027w-NB
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Aug 2021 14:58:25 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1787E67373; Wed, 18 Aug 2021 16:58:14 +0200 (CEST)
Date: Wed, 18 Aug 2021 16:58:13 +0200
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20210818145813.GA13343@lst.de>
References: <20210818140651.17181-1-hch@lst.de>
 <20210818140651.17181-12-hch@lst.de> <YR0fuyqe7NS+mCf9@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YR0fuyqe7NS+mCf9@casper.infradead.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1mGN1L-00027w-NB
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
Cc: Gabriel Krisman Bertazi <krisman@collabora.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Shreeya Patel <shreeya.patel@collabora.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Aug 18, 2021 at 03:56:59PM +0100, Matthew Wilcox wrote:
> On Wed, Aug 18, 2021 at 04:06:51PM +0200, Christoph Hellwig wrote:
> > The exported symbols in utf8-norm.c are not needed for normal
> > file system consumers, so move them to conditional _GPL exports
> > just for the selftest.
> 
> Would it be better to use EXPORT_SYMBOL_NS_GPL()?

Maybe.  Even better would be the EXPORT_SYMBOL_FOR I've been prototyping
for a while but which is still not ready.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
