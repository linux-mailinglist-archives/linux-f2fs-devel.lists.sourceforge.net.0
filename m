Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C5A55B018
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 26 Jun 2022 10:02:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o5NE1-0005Ub-62; Sun, 26 Jun 2022 08:02:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2) (envelope-from
 <BATV+65d228a9ba3d1088b97d+6881+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1o5NE0-0005UR-6S
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 26 Jun 2022 08:02:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SK+swlcj6rLcYyyEH22hFIwnnjq41UijC+puP+o30FM=; b=fuJRB5crjq1yrbl+gmxRSLbmbW
 N3gCqnfxcyD9grTGUaBWH36GzWLGe2rEwbtUeQCS1BWXbaPszvnhcuyF6hpDOHvtkc8oNaXxP0k4T
 cWWiFh4tRNpUfc3J8ZR0Ive9NuycqLRnPaAFGK4IdBSH4fxhvyryaOr3GpB7M6E+vwu0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SK+swlcj6rLcYyyEH22hFIwnnjq41UijC+puP+o30FM=; b=jHA2FOKLvOZe+3fMRkKyt53+v9
 PXNRxiJzMjfmW61RSYlkc+ObmtRQINKMA2bOZ63CeT4mntNfwasTywafNmCmhLR4IjXfRKP44gY9f
 WNQ4Uva7IPkl7tZILCqsX6noSVBs/1bzACtB0hhl6Nn9jeRLTCwBC4os78wURKvOIjR4=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o5NDy-00EEex-B8
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 26 Jun 2022 08:02:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=SK+swlcj6rLcYyyEH22hFIwnnjq41UijC+puP+o30FM=; b=wN58s+9LPW73zb5DoSpwvMBn9P
 O/0NbR77FfD6DhAmB+MTVnzTVn8/OfidqNggFO2TJyTP3S4XOhaiKax3LUFsBYb4ecM+vYKuy17ps
 XfP6jWHbB8eIpF2w9OzL9re1M/XfHRq4g8WaXepqS5sdNIn7YVYWBEAYYTJLYHc0l+orBDSeW/s9Y
 sDQ9RLe/7W0KZO3jhcRkotRD33Ygde6DunnVQAzX/kqS0jsMFPH6vT/QGaNF6eT31kMkfYYJEiTBN
 WVYRtwkq2pzsOM6jx/SVS4iEfk0a+8LJxrt8Kf4MHvo8TO86kVLBLNDyjUyEA675JY82UgpOEawTn
 jEluIU6w==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1o5NDr-00AWLf-UX; Sun, 26 Jun 2022 08:02:23 +0000
Date: Sun, 26 Jun 2022 01:02:23 -0700
From: Christoph Hellwig <hch@infradead.org>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <YrgSj8w+Q3HmSEwv@infradead.org>
References: <20220616201506.124209-1-ebiggers@kernel.org>
 <20220616201506.124209-2-ebiggers@kernel.org>
 <YrSNlFgW6X4pUelg@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YrSNlFgW6X4pUelg@magnolia>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jun 23, 2022 at 08:58:12AM -0700, Darrick J. Wong
 wrote: > Hmm. Does the XFS port of XFS_IOC_DIOINFO to STATX_DIOALIGN look
 like > this? > > struct xfs_buftarg *target = xfs_inode_buftarg(ip); [...]
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1o5NDy-00EEex-B8
Subject: Re: [f2fs-dev] [PATCH v3 1/8] statx: add direct I/O alignment
 information
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
Cc: linux-xfs@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, Keith Busch <kbusch@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jun 23, 2022 at 08:58:12AM -0700, Darrick J. Wong wrote:
> Hmm.  Does the XFS port of XFS_IOC_DIOINFO to STATX_DIOALIGN look like
> this?
> 
> 	struct xfs_buftarg	*target = xfs_inode_buftarg(ip);
> 
> 	kstat.dio_mem_align = target->bt_logical_sectorsize;
> 	kstat.dio_offset_align = target->bt_logical_sectorsize;
> 	kstat.result_mask |= STATX_DIOALIGN;

Yes, I think so.  And it would be very good to include the XFS conversion
with this series as the only file systems that already supports
reporting alignment constraints.

I also suspect that lifting XFS_IOC_DIOINFO to common code by calling
->getattr would be useful because now all existing software using that
will also do the right thing on ext4 and f2fs now.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
