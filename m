Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9F0E0536
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Oct 2019 15:37:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iMuLr-0004np-4t; Tue, 22 Oct 2019 13:37:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1iMuLq-0004ni-Ew
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Oct 2019 13:37:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GsBYi5v9BsB5DsrG/6gHghdK7YwKX1r2G/hPXjE3+jE=; b=MucT/mo8nuaiuuYZCddfkIxo2b
 qpFk88HgT6brzxr5Um5aAL6yBhdKp2MInH+6DlfNAMVwEDUxP2nHmI/KdaG2dCyDJkHAXuEj591Xc
 RtetoptVspcnK9ybsIVSubwdWSh7QYimWRM0FMuJlir+M9FzBpbqKUwWEY5dypf9bLHM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GsBYi5v9BsB5DsrG/6gHghdK7YwKX1r2G/hPXjE3+jE=; b=cMniiBliiIBSwI1Nkr4iDYDePC
 P7d6J0zGyMxFlvFrH/B+MHpAKc30FUSzv9T+rV6n2Evf5vb9IzT9w/vtqV9SV53kphCaLwcmqGuET
 wNTdos3uAyvbBljNP+qjnHcbacHrqJLtxrUuD7qrKjTzi6tUQyUqYdVTDaVzoQRtsdVU=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iMuLo-00BV2m-5L
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Oct 2019 13:37:30 +0000
Received: from callcc.thunk.org (guestnat-104-133-0-98.corp.google.com
 [104.133.0.98] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x9MDbIXp024473
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Oct 2019 09:37:19 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 52E2C420456; Tue, 22 Oct 2019 09:37:16 -0400 (EDT)
Date: Tue, 22 Oct 2019 09:37:16 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20191022133716.GB23268@mit.edu>
References: <20191021230355.23136-1-ebiggers@kernel.org>
 <20191021230355.23136-3-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191021230355.23136-3-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 MAY_BE_FORGED          Relay IP's reverse DNS does not resolve to IP
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iMuLo-00BV2m-5L
Subject: Re: [f2fs-dev] [PATCH 2/3] ext4: add support for
 INLINE_CRYPT_OPTIMIZED encryption policies
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
Cc: linux-f2fs-devel@lists.sourceforge.net, Satya Tangirala <satyat@google.com>,
 Paul Lawrence <paullawrence@google.com>, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Oct 21, 2019 at 04:03:54PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> INLINE_CRYPT_OPTIMIZED encryption policies have special requirements
> from the filesystem:
> 
> - Inode numbers must never change, even if the filesystem is resized
> - Inode numbers must be <= 32 bits
> - File logical block numbers must be <= 32 bits

You need to guarantee more than this; you also need to guarantee that
the logical block number may not change.  Fortunately, because the
original per-file key scheme used a logical block tweak, we've
prohibited this already, and we didn't relax this restriction for
files encrpyted using DIRECT_KEY.  So it's a requirement which we
already meet, but we should document this requirement explicitly ---
both here and also in Documentations/filesystems/fscrypt.rst.

Otherwise, looks good.  Feel free to add:

Reviewed-by: Theodore Ts'o <tytso@mit.edu>

						- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
