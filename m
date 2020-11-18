Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A264E2B7439
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Nov 2020 03:39:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kfDN4-0001Zj-OV; Wed, 18 Nov 2020 02:38:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kfDN3-0001Zb-2V
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Nov 2020 02:38:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0xBS4bl1HG6FHMZyBv854rnwnYW4g9JK5pyX1iZXkXQ=; b=Vv+AqhzfX/WajtJbe8bBqH7/Zb
 8SQ1yhjxIRzgtw1Udm7H0ta6HJt7udhM/X4XyUkQtg/rqCQM0tNBvVhu+X3m2LY1fkYSnHXQgq7Ev
 z0nK5bHnex3vFB4xpUbTjrL4ml3bGWesNGjQ7cV2zUtIf3V0XXZN89VdtszLxeXcMDuo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0xBS4bl1HG6FHMZyBv854rnwnYW4g9JK5pyX1iZXkXQ=; b=Tiz7fdOeFrmpZewfiIy9NmrAYL
 1LhbSrfWNHSt/6lzQLP+mc+96qTvicvU6rW69Pymhz0XhcKQcwaGqocYc56aAar/wXuA/aohWFC9q
 IE3oJ/hpzHkQYdpGrQ8zznzzb4v25uC0GObr8Cm7vzGggAS7/F08Y+67ZHGN13SV6ggo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kfDMw-00Bzqe-GS
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Nov 2020 02:38:56 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7974820DD4;
 Wed, 18 Nov 2020 02:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605667112;
 bh=0xBS4bl1HG6FHMZyBv854rnwnYW4g9JK5pyX1iZXkXQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CcVCAHnfikOI7obL4iDkX+pvxV6BkoVhq3i/nMv2YQGL3dWvNP1JNTF5fTrtwpN93
 f73dmtTBLP6+ftYAdEFbfMbYoah6meAKGR7YgEn/KW+Ly6WbpnJD6yQ/YU4YuTsvDG
 n9jx4eTxwSArJUNexi06Kz57cAZar0eTEOVpb7nY=
Date: Tue, 17 Nov 2020 18:38:30 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <X7SJJp7yBhp1t1VX@sol.localdomain>
References: <20201117140708.1068688-1-satyat@google.com>
 <20201117140708.1068688-9-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117140708.1068688-9-satyat@google.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kfDMw-00Bzqe-GS
Subject: Re: [f2fs-dev] [PATCH v7 8/8] fscrypt: update documentation for
 direct I/O support
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 "Theodore Y . Ts'o" <tytso@mit.edu>,
 "Darrick J . Wong" <darrick.wong@oracle.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Nov 17, 2020 at 02:07:08PM +0000, Satya Tangirala wrote:
> +Direct I/O support
> +==================
> +
> +Direct I/O on encrypted files is supported through blk-crypto. In
> +particular, this means the kernel must have CONFIG_BLK_INLINE_ENCRYPTION
> +enabled, the filesystem must have had the 'inlinecrypt' mount option
> +specified, and either hardware inline encryption must be present, or
> +CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK must have been enabled. Further,
> +the length of any I/O must be aligned to the filesystem block size
> +(*not* necessarily the same as the block device's block size). If any of
> +these conditions isn't met, attempts to do direct I/O on an encrypted file
> +will fall back to buffered I/O. However, there aren't any additional
> +requirements on user buffer alignment (apart from those already present
> +when using direct I/O on unencrypted files).

Actually the position in the file the I/O is targeting must be fs-block aligned
too, not just the length of the I/O.

It's only the pointer to the user data buffer that no longer needs to be
fs-block aligned (this changed between v6 and v7).

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
