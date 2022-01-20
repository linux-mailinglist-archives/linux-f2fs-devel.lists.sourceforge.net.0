Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC5749497A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Jan 2022 09:30:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nASq1-0000By-5x; Thu, 20 Jan 2022 08:30:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2) (envelope-from
 <BATV+0328028a7a74e2859a11+6724+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1nASq0-0000Br-2O
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Jan 2022 08:30:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4YLv12vaH5SBxgO/VH+IFNLxgK8TDHDUDIGloGpzq0o=; b=h76SPJ3u6H1JJOGdtovEYoAu5s
 9FLgwmRWDiSLyPAKfnjc5itp0gCspIWWVoJL0/GinyX463O4ibtNEpVgllMv0bT183Zw7+tvWfyd3
 ketPxzcDxollIGbuuiwihdLma02g2fjLfaaEwJ94AAQkN0kfpyXhNPTZxqBxXnBVpJ08=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4YLv12vaH5SBxgO/VH+IFNLxgK8TDHDUDIGloGpzq0o=; b=XjrolYinY3wRbq/kZSxp7nojGz
 zUAUDX1ytws8tembr+myzoRY+O7zX8HRW8+wMrpKOeJJPlelAjTff8ZHIWndC9fZeuT6r7nX6DXEF
 gbIoSOkQTG1QreYkPFCEFUUgyO4OkQvissP9WNczK+FmmEdoTvHXWNkX38XzVRyJ5N0w=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1nASpy-004fIA-2T
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Jan 2022 08:30:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=4YLv12vaH5SBxgO/VH+IFNLxgK8TDHDUDIGloGpzq0o=; b=Q3dHqDRR7It61x+wYLIdNp05S/
 u6VPSwFrw0IY2CI7N3H2ifaUZ68axyBfGF181H5kwwOhrafeJWImtn1gRt+0d0IBDN99yIfge1PJG
 hP9BReWxiFQ3g/pJxQ+RMonEZ0AjNLRvDSKEXm1JMv2oKnyCo1oU5TnOZAmkQQ0dQbhJeODMJJSov
 Jh1B1T+BW+K3aI5Oxe7eJZnwq95ZaW94LU/r4X7TmJNogOB+WlE3woZv0Oiko+7qp6E/nli6pMZFI
 vMTM9Wn0SwZIO73GEuuNAmtZiXw0BILywxroF0GSo4m8pPMgSas9xV2RAeoAbgk8cQ3qeOPcLohCa
 1cV9RIUA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nASpr-009lmb-O7; Thu, 20 Jan 2022 08:30:23 +0000
Date: Thu, 20 Jan 2022 00:30:23 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YekdnxpeunTGfXqX@infradead.org>
References: <20220120071215.123274-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220120071215.123274-1-ebiggers@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jan 19, 2022 at 11:12:10PM -0800, Eric Biggers wrote:
 > > Given the above, as far as I know the only remaining objection to this
 > patchset would be that DIO constraints aren't sufficiently di [...] 
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1nASpy-004fIA-2T
Subject: Re: [f2fs-dev] [PATCH v10 0/5] add support for direct I/O with
 fscrypt using blk-crypto
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
Cc: Christoph Hellwig <hch@infradead.org>, Theodore Ts'o <tytso@mit.edu>,
 "Darrick J . Wong" <djwong@kernel.org>, Dave Chinner <david@fromorbit.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jan 19, 2022 at 11:12:10PM -0800, Eric Biggers wrote:
> 
> Given the above, as far as I know the only remaining objection to this
> patchset would be that DIO constraints aren't sufficiently discoverable
> by userspace.  Now, to put this in context, this is a longstanding issue
> with all Linux filesystems, except XFS which has XFS_IOC_DIOINFO.  It's
> not specific to this feature, and it doesn't actually seem to be too
> important in practice; many other filesystem features place constraints
> on DIO, and f2fs even *only* allows fully FS block size aligned DIO.
> (And for better or worse, many systems using fscrypt already have
> out-of-tree patches that enable DIO support, and people don't seem to
> have trouble with the FS block size alignment requirement.)

It might make sense to use this as an opportunity to implement
XFS_IOC_DIOINFO for ext4 and f2fs.

> I plan to propose a new generic ioctl to address the issue of DIO
> constraints being insufficiently discoverable.  But until then, I'm
> wondering if people are willing to consider this patchset again, or
> whether it is considered blocked by this issue alone.  (And if this
> patchset is still unacceptable, would it be acceptable with f2fs support
> only, given that f2fs *already* only allows FS block size aligned DIO?)

I think the patchset looks fine, but I'd really love to have a way for
the alignment restrictions to be discoverable from the start.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
