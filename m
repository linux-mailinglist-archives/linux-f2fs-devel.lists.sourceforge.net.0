Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F3C6DF5B5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Apr 2023 14:42:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pmZno-0006sG-Bn;
	Wed, 12 Apr 2023 12:42:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+76e3400107323edf7514+7171+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1pmZnn-0006sA-IL for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Apr 2023 12:42:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ddg0vAHFen4K0AUyZN8TD9RJ8e2AKTjO8ch3srJurzE=; b=ADVJEdaKDGumdtMeUstB87ywQ/
 RjgtfrRfSDl5mS4n16ud7lZ6Wf5+BXH2zIPAETA+pGsdWznRLnBzLDQxrQQ1x4ECWB18F5qlrmsfx
 NWjjT1AJ6kMEp0JHn/pDdfAbOiI0P9jYP+Dyp0XXe6N2qT8YExZQ0vPD5hr/unKVzC3k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ddg0vAHFen4K0AUyZN8TD9RJ8e2AKTjO8ch3srJurzE=; b=Kv+NG4Yy+guiEQ3A6UfWre+H/s
 bXDjSUo1ChaSeVPOU8ldT7u4WWzTLUzVJhVGl5o/GVrzcRB2VoOlKQuN/jmWFaLolxKn5v0RHpZhH
 G8NVYAnH9NWCigwL/fw5ObM3cNd2Rb1ZOOKU7kfD+aMTKGPnXaw8gQjXeFhobYplFKOo=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pmZnn-005Itw-C7 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Apr 2023 12:42:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ddg0vAHFen4K0AUyZN8TD9RJ8e2AKTjO8ch3srJurzE=; b=0NE81cyrNaY13C8K9Ohz51hMMT
 H8xLDlox7rtYU3JMpi/o1SAdWWlvObLHFQJfTqJCbAGM9dcW5OL8gHOZ2ZyXZ5JEpZ35YBRQ/SJDw
 Awg6JdUVWLxnk5KF/M2Zl8rnE5rVIWXzbsN5geWGxL03pJgn+yPqrtFK/f1rScaWvqKNiob9Q1uq4
 zwBzDQd4VSvi9A91DWhyreN5V2CWY4ROZWwPn6JruDwiEvPhDvD3Tdms4YsiY3X3AIsTMbXL2g90M
 hMjXbvq2r3mP+FN6fVrvENh5aI7Debl3VW76+MlDBh6fTbdSchuGtO8uG4TwA5+cmLhI6OwLIqLCA
 8ozb6KTg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pmZnb-003BFA-1a; Wed, 12 Apr 2023 12:42:07 +0000
Date: Wed, 12 Apr 2023 05:42:07 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <ZDanH46VI7KmQeSV@infradead.org>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <ZDTt8jSdG72/UnXi@infradead.org>
 <20230412023319.GA5105@sol.localdomain>
 <20230412031826.GI3223426@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230412031826.GI3223426@dread.disaster.area>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Apr 12, 2023 at 01:18:26PM +1000, Dave Chinner wrote:
 > Right. It's not entirely simple to store metadata on disk beyond EOF >
 in XFS because of all the assumptions throughout the IO path and [...] 
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
X-Headers-End: 1pmZnn-005Itw-C7
Subject: Re: [f2fs-dev] [PATCH v2 00/23] fs-verity support for XFS
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
Cc: fsverity@lists.linux.dev, Christoph Hellwig <hch@infradead.org>,
 jth@kernel.org, agruenba@redhat.com, djwong@kernel.org,
 Andrey Albershteyn <aalbersh@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 cluster-devel@redhat.com, linux-ext4@vger.kernel.org, dchinner@redhat.com,
 rpeterso@redhat.com, xiang@kernel.org, damien.lemoal@opensource.wdc.com,
 linux-erofs@lists.ozlabs.org, linux-xfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Apr 12, 2023 at 01:18:26PM +1000, Dave Chinner wrote:
> Right. It's not entirely simple to store metadata on disk beyond EOF
> in XFS because of all the assumptions throughout the IO path and
> allocator interfaces that it can allocate space beyond EOF at will
> and something else will clean it up later if it is not needed. This
> impacts on truncate, delayed allocation, writeback, IO completion,
> EOF block removal on file close, background garbage collection,
> ENOSPC/EDQUOT driven space freeing, etc.  Some of these things cross
> over into iomap infrastructure, too.

To me that actually makes it easier to support the metadata beyond
i_size.  Remember that the file is immutable after add fsverity
hash is added.  So basically we just need to skip freeing the
eofblocks if that flag is set.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
