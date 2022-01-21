Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 723B1495A59
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Jan 2022 08:10:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nAo3u-0005xH-Nn; Fri, 21 Jan 2022 07:10:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2) (envelope-from
 <BATV+e38482cd6722563dea4e+6725+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1nAo3s-0005wz-T9
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Jan 2022 07:10:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/iWwKF5zBo+/YqnIlxI/fBLzy6wUHNMRmfKOAf2uK/0=; b=WIXIV9Wn+VSIaGyY5uXMJA1EFw
 8q0jk0pBnXbbvSU2nPtJTeGS7euaAVKtb3CF0mu2YZGGK+6Py+cYRI7jghwaNVOXI3Vxvf3ll+GMe
 TDIeFkPDPb15ZkxCqwFn3iYWTS7o6F5gtv8N8n0We9tr2fByi5anW+JARdKsWevjFlK4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/iWwKF5zBo+/YqnIlxI/fBLzy6wUHNMRmfKOAf2uK/0=; b=Qi9qT1Ea9fC7N/0V62SXSooKQK
 p7kd2eKm40x8aNK+mxTIhRZAKfAzhNLRodXyDksqwCGcjrDuMCyCJTfd7cFIsJQgXlEQJ0hXo5EtD
 intVIwmN7YLaETgg8882CLU6H7Ph7Hdparjqb1OlEr8g7gKsFawlkFB2mm9my6pa9DQg=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1nAo3n-005ycu-R6
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Jan 2022 07:10:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=/iWwKF5zBo+/YqnIlxI/fBLzy6wUHNMRmfKOAf2uK/0=; b=euNtdBdzwfCYHwQlnISZwlowHv
 Ghmi9l9Zl16SCmCwWK7jluHzRlhl52g/7nnfe1ORbcbWz9eDsTLODftQAP0tQHhTQXNKExIDhJWQR
 4fKqsCljldRSV8PZQHlegwZhFHZ9EtUloBylY5RK3eI/qjkyxiZFaZj6fQ4MiR0+zNZXQsGMAycnU
 2oWxcxPC/e7RJEfKpGZ3J1zNhH/rSYHEEISC9QO9qMPLt3qitFPkckTdxf3yffrudX0s+EP6cLkkY
 1UsupL+zm3akz9Ziutyd2iS7/vdibOYkDaUDgTd30H6/mok/dXO+eYc+FQsShPk5ewqwwszZTJ470
 kA5hUg5w==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nAo3c-00E1cx-0w; Fri, 21 Jan 2022 07:10:00 +0000
Date: Thu, 20 Jan 2022 23:10:00 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YepcSJGy2IbBrMZB@infradead.org>
References: <20220120071215.123274-1-ebiggers@kernel.org>
 <20220120071215.123274-2-ebiggers@kernel.org>
 <YekdAa4fCKw7VY3J@infradead.org> <Yeklkcc7NXKYDHUL@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yeklkcc7NXKYDHUL@sol.localdomain>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 20, 2022 at 01:04:17AM -0800, Eric Biggers wrote:
 > I actually had changed this from v9 because fscrypt_dio_supported() seemed
 > backwards, given that its purpose is to check whether DIO i [...] 
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
X-Headers-End: 1nAo3n-005ycu-R6
Subject: Re: [f2fs-dev] [PATCH v10 1/5] fscrypt: add functions for direct
 I/O support
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
Cc: linux-xfs@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 "Darrick J . Wong" <djwong@kernel.org>, Dave Chinner <david@fromorbit.com>,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, Satya Tangirala <satyat@google.com>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jan 20, 2022 at 01:04:17AM -0800, Eric Biggers wrote:
> I actually had changed this from v9 because fscrypt_dio_supported() seemed
> backwards, given that its purpose is to check whether DIO is unsupported, not
> whether it's supported per se (and the function's comment reflected this).  What
> ext4 and f2fs do is check a list of reasons why DIO would *not* be supported,
> and if none apply, then it is supported.  This is just one of those reasons.
> 
> This is subjective though, so if people prefer the old way, I'll change it back.

I find non-negated API much better and would also help with undinwinding
the ext4/f2fs mess.  But I'm not going to block the series on such a
minor detail, of course.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
