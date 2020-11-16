Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A332B51B1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Nov 2020 20:57:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kekdN-0003S9-Uc; Mon, 16 Nov 2020 19:57:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kekdI-0003Rp-AY
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Nov 2020 19:57:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=isREeoyB4Aro9Y+iL7aH2oILlPVf+44gsP+JGTg8IrI=; b=UuRovk7pBUPe9pDV6zvVuvngTY
 +uAB2uqUK8uxv3IEwT48DXgC8NqSB1CuvSlh06NeWofm9X2U24M4DLw9LUmrw5HU6oMiTHHCNbdld
 hRkBWjNAPpH0AYQixM3Q+DwZq8Ez4XoRu90ss2w5M4zLiTH7IOW98Vu5L6m/WGeR01Co=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=isREeoyB4Aro9Y+iL7aH2oILlPVf+44gsP+JGTg8IrI=; b=LYbzgjQDKLCsgsMV+vf+ST5gq9
 xi3WbwNCut65DAAwj5eVP5SuGlVqxcUAVQh8HN3cjq6KV2Ybvf9j/v87G7ksjW4CjNKDJvrKmuEqY
 4oqhjsWvQepBttzqsfMZywl6y19eR1RUy1lsxL/HMCI4mzt4czFSMZp29+VgrVdzvIW4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kekdD-007fuu-6D
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Nov 2020 19:57:48 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3F2E9208C7;
 Mon, 16 Nov 2020 19:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605556650;
 bh=6RPbSG5ZGTSSJuW1urRI9ZBEHEj5MnZv8gXJG/wiN6A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BrHroKrhpagvLzB8zargNvVRoz06679F5N42v8zCP6bQjk3fPVCrN9hgEfTn18kuC
 ua+EKY1SJLQwNd/92GqsZrUr1i01Ha3D75s/v0xJY67rQXR3xbTu+Yw+xQgi6v7fN6
 3+Yixow9Po01WG+62ru+iCDKn6DLD429XSBPB48I=
Date: Mon, 16 Nov 2020 11:57:28 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Message-ID: <X7LZqLKKwtse2tWy@sol.localdomain>
References: <20201113211918.71883-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201113211918.71883-1-ebiggers@kernel.org>
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
X-Headers-End: 1kekdD-007fuu-6D
Subject: Re: [f2fs-dev] [PATCH 0/4] fs-verity cleanups
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
Cc: Jes Sorensen <Jes.Sorensen@gmail.com>,
 Luca Boccassi <luca.boccassi@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net,
 Paul Lawrence <paullawrence@google.com>, linux-ext4@vger.kernel.org,
 Martijn Coenen <maco@android.com>, Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Nov 13, 2020 at 01:19:14PM -0800, Eric Biggers wrote:
> This patchset renames some names that have been causing confusion:
> 
> - fsverity_signed_digest is renamed to fsverity_formatted_digest
> 
> - "fs-verity file measurement" is renamed to "fs-verity file digest"
> 
> In addition, this patchset moves fsverity_descriptor and
> fsverity_formatted_digest to the UAPI header because userspace programs
> may need them in order to sign files.
> 
> Eric Biggers (4):
>   fs-verity: remove filenames from file comments
>   fs-verity: rename fsverity_signed_digest to fsverity_formatted_digest
>   fs-verity: rename "file measurement" to "file digest"
>   fs-verity: move structs needed for file signing to UAPI header
> 
>  Documentation/filesystems/fsverity.rst | 68 ++++++++++++--------------
>  fs/verity/enable.c                     |  8 +--
>  fs/verity/fsverity_private.h           | 36 ++------------
>  fs/verity/hash_algs.c                  |  2 +-
>  fs/verity/init.c                       |  2 +-
>  fs/verity/measure.c                    | 12 ++---
>  fs/verity/open.c                       | 24 ++++-----
>  fs/verity/signature.c                  | 14 +++---
>  fs/verity/verify.c                     |  2 +-
>  include/uapi/linux/fsverity.h          | 49 +++++++++++++++++++
>  10 files changed, 116 insertions(+), 101 deletions(-)

All applied to fscrypt.git#fsverity for 5.11.  But as always, more reviews are
always appreciated.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
