Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC1E52C99F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 May 2022 04:11:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nrVcx-0008Pw-Ic; Thu, 19 May 2022 02:10:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <tytso@mit.edu>) id 1nrVcv-0008Pn-Fi
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 May 2022 02:10:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tR13JwUbXXXeiykjLNhK4pqKKdnGUOdKfC+6Atr7Qec=; b=mhje6KWXU3m2t7XcQZeH3mKT/z
 rVNwfqyKvlwsYIZM909VHWWN8gvggPxjjEbZwc0/4mHgA+fTkFHFaLG26PvvMnnF57XLhj/Ieg+3P
 VCIEC13xsFc8xWIOioNJ/aNJp9IdQt7qyXLzjVxs+qTQyNfXGzOwtbobhiu1QH8TSOgM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tR13JwUbXXXeiykjLNhK4pqKKdnGUOdKfC+6Atr7Qec=; b=Yn18dN81DutZBF2CJTSaDKArkb
 lUUH2rf2WzJmo7/CC859wbc5iGkDcEt87FWyCmsQRGNynajRU7FDABLge6MLciyxFlJFfhTt+w0u8
 iAGpUYHFQOyJfK57yGoYvc2NijFUfJeQuCmazajpdDjp2ZZtQ+1g769EjWUgcyS24/Ts=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nrVcq-0004WM-VB
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 May 2022 02:10:55 +0000
Received: from cwcc.thunk.org (pool-108-7-220-252.bstnma.fios.verizon.net
 [108.7.220.252]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 24J2Absr020685
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 May 2022 22:10:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1652926239; bh=tR13JwUbXXXeiykjLNhK4pqKKdnGUOdKfC+6Atr7Qec=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=KY3MZRCTmd2jkp++r3S74yh8ujOH46dVzROEXMoxhUYCq6YqEsVLiNa9z56gC2bJX
 12fgbb9hMeavEFfQmzO9FZEqge1/QMMZ4KLrBJQHwtF0qY6SLff4ZctdYz4q1G8WiI
 WUPRss6ao9UlJIXxLBVxjKqHTO3rYM8bmP6r4gfuXXhblBUHbZ2m+WscMUjoH03biB
 4HHxTjXPUR0xA1wBvEZmZkuxuMsjc7FI4HwBMcMnzW54ONA3RZn/YTLQjIxT6ZWNKG
 HjvYP7WCH7HrcY5Z7YAEAiify4VsKjVBlw+bIXSahQiubRkTsxq2sXNvxkdQA2iXYk
 AOyQNsCLz86TQ==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id 86D8015C3EC0; Wed, 18 May 2022 22:10:37 -0400 (EDT)
Date: Wed, 18 May 2022 22:10:37 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YoWnHXZSQZA4CL6+@mit.edu>
References: <20220513231605.175121-1-ebiggers@kernel.org>
 <20220513231605.175121-2-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220513231605.175121-2-ebiggers@kernel.org>
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, May 13, 2022 at 04:16:01PM -0700, Eric Biggers wrote:
 > From: Eric Biggers <ebiggers@google.com> > > If processing the on-disk
 mount options fails after any memory was > allocated in the ext4_ [...] 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [18.9.28.11 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
X-Headers-End: 1nrVcq-0004WM-VB
Subject: Re: [f2fs-dev] [PATCH v3 1/5] ext4: fix memory leak in
 parse_apply_sb_mount_options()
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
Cc: Jeff Layton <jlayton@kernel.org>, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 Lukas Czerner <lczerner@redhat.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, May 13, 2022 at 04:16:01PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> If processing the on-disk mount options fails after any memory was
> allocated in the ext4_fs_context, e.g. s_qf_names, then this memory is
> leaked.  Fix this by calling ext4_fc_free() instead of kfree() directly.
> 
> Reproducer:
> 
>     mkfs.ext4 -F /dev/vdc
>     tune2fs /dev/vdc -E mount_opts=usrjquota=file
>     echo clear > /sys/kernel/debug/kmemleak
>     mount /dev/vdc /vdc
>     echo scan > /sys/kernel/debug/kmemleak
>     sleep 5
>     echo scan > /sys/kernel/debug/kmemleak
>     cat /sys/kernel/debug/kmemleak
> 
> Fixes: 7edfd85b1ffd ("ext4: Completely separate options parsing and sb setup")
> Cc: stable@vger.kernel.org
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Thanks, applied.

					- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
