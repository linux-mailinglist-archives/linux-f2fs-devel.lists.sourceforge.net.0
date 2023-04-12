Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D56A6DF5A8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Apr 2023 14:41:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pmZmU-0006mQ-LP;
	Wed, 12 Apr 2023 12:40:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+76e3400107323edf7514+7171+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1pmZmS-0006ly-Ns for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Apr 2023 12:40:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E0KHAAQwHuVG+JUkhMNXRzfAxWNr8pB44DMS1FIDYiU=; b=Xi1v4u2s1ZyHILrSLo6OeaFp2K
 4KEjfGIt2xtAwZtfWpY8CpQcq9kykAKNAfuzZHGe9owHMhfP/JK5lBotHFnvEr29JMh6B+P+qajfh
 ViBe0avo54IgRSfVGb8B3molr1eliqkEA3yOkQObvyd6NinP7O+BNcK+Q68FTMM1Q8QE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E0KHAAQwHuVG+JUkhMNXRzfAxWNr8pB44DMS1FIDYiU=; b=cFVWx1v2QdmQTS0o750wTo5lxv
 0ztYkcvX1iMfz9GBWat+F8gvQyLZbxSK3PSaSDCRxMh46+YECw2WuAR3LIBwVbFHrq1OQuVhMJDm4
 Dsy8/qj8B1J8z5y616mcralLqrvEhNREGt2MTvnHIHczjV5Bd8BfS0sXS3gKGfuig7/Q=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pmZmQ-005IpO-9z for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Apr 2023 12:40:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=E0KHAAQwHuVG+JUkhMNXRzfAxWNr8pB44DMS1FIDYiU=; b=VL2Xq3mXsX5zJ0mUpgFdjyqzch
 uwDtv5eusczS8yue8CmgTqmgQlhiERF1JwLtsis14nYKk+RIdUpZM47LPD2BFHt6UpXsa1xX7MUlq
 QnekFKGKo9ViGfaiGcAq6s4YKopGqFR+iW722YWss5oQKb9l+u8zu789Ruzb9HbRx/zZzFsQ0umAx
 slzq+P5/cNMhF2GmdH3M1qVbcfQCtTUpgUHQhqO9u68CXXozNoINOdCVMV5plzm+dz1gNP7jGrZvE
 ZlrzIKFvEvvcxXN0E09iz3XsChVPky8ItYBLK1I+opyB93pWAQHQtWawRH5b332rI/xu7+YxbuakL
 SS0C2vgQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pmZlw-003AdB-0z; Wed, 12 Apr 2023 12:40:24 +0000
Date: Wed, 12 Apr 2023 05:40:24 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <ZDamuPYV8khwDzRJ@infradead.org>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <ZDTt8jSdG72/UnXi@infradead.org>
 <20230412023319.GA5105@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230412023319.GA5105@sol.localdomain>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Apr 11, 2023 at 07:33:19PM -0700, Eric Biggers wrote:
 > It seems it's really just the Merkle tree caching interface that is causing
 > problems, as it's currently too closely tied to the page c [...] 
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
X-Headers-End: 1pmZmQ-005IpO-9z
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
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, agruenba@redhat.com, djwong@kernel.org,
 Andrey Albershteyn <aalbersh@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 cluster-devel@redhat.com, dchinner@redhat.com, rpeterso@redhat.com,
 xiang@kernel.org, jth@kernel.org, linux-erofs@lists.ozlabs.org,
 damien.lemoal@opensource.wdc.com, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Apr 11, 2023 at 07:33:19PM -0700, Eric Biggers wrote:
> It seems it's really just the Merkle tree caching interface that is causing
> problems, as it's currently too closely tied to the page cache?  That is just an
> implementation detail that could be reworked along the lines of what is being
> discussed.

Well, that and some of the XFS internal changes that seem a bit ugly.

But it's not only very much tied to the page cache, but also to
page aligned data, which is really part of the problem.

> But anyway, it is up to the XFS folks.  Keep in mind there is also the option of
> doing what btrfs is doing, where it stores the Merkle tree separately from the
> file data stream, but caches it past i_size in the page cache at runtime.

That seems to be the worst of both worlds.

> I guess there is also the issue of encryption, which hasn't come up yet since
> we're talking about fsverity support only.  The Merkle tree (including the
> fsverity_descriptor) is supposed to be encrypted, just like the file contents
> are.  Having it be stored after the file contents accomplishes that easily...
> Of course, it doesn't have to be that way; a separate key could be derived, or
> the Merkle tree blocks could be encrypted with the file contents key using
> indices past i_size, without them physically being stored in the data stream.

xattrs contents better be encrypted as well, fsverity or not.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
