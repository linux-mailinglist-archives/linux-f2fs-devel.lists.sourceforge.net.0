Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EFEEF269
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Nov 2019 02:03:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iRnFn-0000KF-Jw; Tue, 05 Nov 2019 01:03:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iRnFm-0000K3-5n
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Nov 2019 01:03:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2ZuNN206j8b1MKtHVoTJMW1lTuw7UtJnN31fkWCww+o=; b=D9bBvAEPfa6TmxseU/E2oiD2Xl
 rn5iCMtkEg2Mlnz0P95eMU5H+6wNwvkeeY2l3s2qqxX+eRAbWllFpyzDdUc/ZYeAEoKTrGBZekgAy
 rLvimHkIxp8Ftw2DkWXS0YPZByqmulyanG2lMfS5C8B2zPXAuHHp6650z8IuzdIf+fYA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2ZuNN206j8b1MKtHVoTJMW1lTuw7UtJnN31fkWCww+o=; b=K2hGoCl+DgT+KMtxy1njZ0Jcu7
 aA1J0HOzTUxmlh4v9N64uNlyedjybRQR8BrH2CqHmXj/h9NGUvwBXk4/acAck6I+41yBdkzCEdypm
 SfW4iAkOWK2lDpkw8eOjF5n0aSEzbpYN9kLPAOIY9I4z35FE1lFJb1YIHlBpKE+L3mZc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iRnFj-000GKF-6M
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Nov 2019 01:03:26 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C60232067D;
 Tue,  5 Nov 2019 01:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572915797;
 bh=4Jmct+axA8jAkXluFcFQI+uLkQTpqnvf/DA6hb5ReCI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nnl5cMFG8BKuRG8ENOvinMxVE3HupXrzgoCoDukHlYgCMGI8K0oFkbfYfvj8iwGMZ
 BzncIGhzlSd8Tq4p78mCz6fMFe+r9sH1z08KjMRUBKDvvQhIRWVYb/8d92xKHoIJYQ
 zdX4RS+7YST5kTD4rUt+3j18FC1y0Lf5NWHcquyk=
Date: Mon, 4 Nov 2019 17:03:15 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20191105010315.GA692@sol.localdomain>
Mail-Followup-To: Christoph Hellwig <hch@infradead.org>,
 Satya Tangirala <satyat@google.com>, linux-scsi@vger.kernel.org,
 Kim Boojin <boojin.kim@samsung.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org
References: <20191028072032.6911-1-satyat@google.com>
 <20191028072032.6911-8-satyat@google.com>
 <20191031183217.GF23601@infradead.org>
 <20191031202125.GA111219@gmail.com>
 <20191031212103.GA6244@infradead.org>
 <20191031222500.GB111219@gmail.com>
 <20191105001554.GA24056@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191105001554.GA24056@infradead.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iRnFj-000GKF-6M
Subject: Re: [f2fs-dev] [PATCH v5 7/9] fscrypt: add inline encryption support
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
Cc: linux-scsi@vger.kernel.org, Kim Boojin <boojin.kim@samsung.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Satya Tangirala <satyat@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Nov 04, 2019 at 04:15:54PM -0800, Christoph Hellwig wrote:
> > I don't think combining these things is a good idea because it would restrict
> > the use of inline encryption to filesystems that allow IV_INO_LBLK_64 encryption
> > policies, i.e. filesystems that have stable inode numbers, 32-bit inodes, and
> > 32-bit file logical block numbers.
> > 
> > The on-disk format (i.e. the type of encryption policy chosen) and the
> > implementation (inline or filesystem-layer crypto) are really two separate
> > things.  This was one of the changes in v4 => v5 of this patchset; these two
> > things used to be conflated but now they are separate.  Now you can use inline
> > encryption with the existing fscrypt policies too.
> > 
> > We could use two separate SB_* flags, like SB_INLINE_CRYPT and
> > SB_IV_INO_LBLK_64_SUPPORT.
> 
> Yes, I think that is a good idea.
> 
> > However, the ->has_stable_inodes() and
> > ->get_ino_and_lblk_bits() methods are nice because they separate the filesystem
> > properties from the question of "is this encryption policy supported".
> > Declaring the filesystem properties is easier to do because it doesn't require
> > any fscrypt-specific knowledge.  Also, fs/crypto/ could use these properties in
> > different ways in the future, e.g. if another IV generation scheme is added.
> 
> I don't really like writing up method boilerplates for something that
> is a simple boolean flag.

fs/crypto/ uses ->has_stable_inodes() and ->get_ino_and_lblk_bits() to print an
appropriate error message.  If we changed it to a simple flag we'd have to print
a less useful error message.  Also, people are basically guaranteed to not
understand what "SB_IV_INO_LBLK_64_SUPPORT" means exactly, and are likely to
copy-and-paste it incorrectly when adding fscrypt support to a new filesystem.
Also it would make it more difficult to add other fscrypt IV generation schemes
in the future as we'd then need to add another sb flag (e.g. SB_IV_INO_LBLK_128)
and make filesystem-specific changes, rather than change fs/crypto/ only.

So personally I'd prefer to keep ->has_stable_inodes() and
->get_ino_and_lblk_bits() for now.

Replacing ->inline_crypt_enabled() with SB_INLINE_CRYPT makes much more sense
though.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
