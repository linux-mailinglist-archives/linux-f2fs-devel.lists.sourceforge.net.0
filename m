Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A998778F7F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Aug 2023 14:28:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qURFG-0003n8-7o;
	Fri, 11 Aug 2023 12:27:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+10530082ca17b6f7899b+7292+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1qURFD-0003ms-Bx; Fri, 11 Aug 2023 12:27:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=96Jyxa0hgrG24aZgu2ilDmsPaDJbIFT8CvAcqFGq7ak=; b=DciJ7ZWMQ4S+3A1eP+qdCNxrny
 03nm2ElvfMD5LQTrFZ3V6sr/AwEeN9tcdfvTdWW5IQU7vu3YQutw6Wxbg3cV7VGmMdPuzZTe2DhEK
 CScU/kCKn9kba9BZIllFDAS3ySk8PVDwVEh0jcpDmF887ou3idSGmEcKvNH0dfQrOcbQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=96Jyxa0hgrG24aZgu2ilDmsPaDJbIFT8CvAcqFGq7ak=; b=Gh3XAD1ZAMnt4sDMZPPM+HTDKv
 eKhJqH1ZEcTElTzRWnGbVGPzODdXoi3LDB4BZKBVNQBQKvAZzmG6ifm7RYQP9SNpKTwHzzKiNroG7
 LSaBwebZ+WsjbROCJxTM0NKiMBDAREYsm2QmH2PWA987FLA/RcwAwqtUMj+9gUz9K6ek=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qURFC-002Uf6-4p; Fri, 11 Aug 2023 12:27:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=96Jyxa0hgrG24aZgu2ilDmsPaDJbIFT8CvAcqFGq7ak=; b=Lt8QMt/qiwPklQXJKNxAAayl50
 ejm5z3TauQQgWXDYeiy6ev7CoxuktCUjLml+tQTXB0FrmwYo9bGjhm2G8bwiVtr2qWkYfM3c8FNl1
 cPDaz7ayPa6vktH3ev1ZeHUse0hr9sV3dSKzn62142iTuA8TTM4tDaiYAHOFhJAm7nP3aQxRbODoe
 cl8s2GHmVFeXScu6jrXcZHGDTmN2udO8XZ0pPwfpsd5QoOiRLOiFHXD6KYR9f2MEyvA/KeT9RzHmF
 DIvDgADu/AxqynsuMYC3hcwdLyXOsBeZQBLnrFNVOoRqDCMnS+8kcWICKZ1ml8I/4TT3bYAOcmKWy
 N15IsxAA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qUREm-00Abyw-17; Fri, 11 Aug 2023 12:27:28 +0000
Date: Fri, 11 Aug 2023 05:27:28 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <ZNYpMPM5o4q1xcIt@infradead.org>
References: <20230810171429.31759-1-jack@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230810171429.31759-1-jack@suse.cz>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Except for a mostly cosmetic nitpick this looks good to me:
 Acked-by: Christoph Hellwig <hch@lst.de> That's not eactly the deep review
 I'd like to do, but as I'm about to head out for vacation that's probably
 as good as it gets. 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qURFC-002Uf6-4p
Subject: Re: [f2fs-dev] [PATCH v2 0/29] block: Make blkdev_get_by_*() return
 handle
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
Cc: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net,
 "Darrick J. Wong" <djwong@kernel.org>, linux-nvme@lists.infradead.org,
 Joseph Qi <joseph.qi@linux.alibaba.com>, dm-devel@redhat.com,
 target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Jack Wang <jinpu.wang@ionos.com>, Alasdair Kergon <agk@redhat.com>,
 drbd-dev@lists.linbit.com, linux-s390@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Christoph Hellwig <hch@infradead.org>, xen-devel@lists.xenproject.org,
 Gao Xiang <xiang@kernel.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Kent Overstreet <kent.overstreet@gmail.com>,
 Sven Schnelle <svens@linux.ibm.com>, linux-pm@vger.kernel.org,
 Mike Snitzer <snitzer@kernel.org>, Joern Engel <joern@lazybastard.org>,
 reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-bcache@vger.kernel.org, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>, linux-raid@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org, Ted Tso <tytso@mit.edu>,
 linux-mm@kvack.org, Song Liu <song@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Minchan Kim <minchan@kernel.org>, ocfs2-devel@oss.oracle.com,
 Anna Schumaker <anna@kernel.org>, linux-fsdevel@vger.kernel.org,
 "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Except for a mostly cosmetic nitpick this looks good to me:

Acked-by: Christoph Hellwig <hch@lst.de>

That's not eactly the deep review I'd like to do, but as I'm about to
head out for vacation that's probably as good as it gets.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
