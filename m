Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B061448F1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Jan 2020 01:30:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iu3uh-0003Ng-FJ; Wed, 22 Jan 2020 00:30:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iu3ug-0003NZ-Ai
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jan 2020 00:30:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XbCKXkUbR3o5P3rf1d/D70vKwuNWyNy5DPf/q0xlbnw=; b=TfB7PeGK+XGTA63Q67giR2uTMP
 mySZxg1qmameBGdPVkfjrwOmf5XSPsEtiT39ZzGewmiGQnAykT2Q8MxKQmj7YEG/J49Qe4ptM2qrn
 Y0kv4WvPfkOQ+UCCCRnDgeQfZ0ntmm3lhBqNkR7CTZL2bIEkNcO0Igjhz9M4Inst41nQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XbCKXkUbR3o5P3rf1d/D70vKwuNWyNy5DPf/q0xlbnw=; b=XHj/sSsfHUt63AOHcfLvo8aUXo
 5qGWy66U9SQtn1S9DWCodti4et8dzkeNH5VAC+5XZnVnswOZsCJchrN6xfJbwZh7SLl6P2Kx5VNrj
 sKamtP3Ato9sBcy62X1yi8O8184I/WkVYx0VOm2kN+cIZIeo0KZ5eaaJ71gdThpxc39Q=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iu3ud-00D92S-C0
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jan 2020 00:30:30 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7D435217F4;
 Wed, 22 Jan 2020 00:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579653016;
 bh=H/qN5wQT4EZ5hYKWGp7yIkcoOLzjrk0gNanXBpiBRnI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qUmyGZfkQoEjSKG30mFMzVYmysM/ifNtNxjkA1RSMGQ7a09pMTLRQ51CbJ/WSqYbJ
 3X6LIerTmDJS8K4r629U6pRTw5tK+OB60JON9E76MkrGSspGCJVKneBB0fF2UOY/z7
 5i6O013odo5e0N2RxkVk+0bwfG0RbjP7IfDQNb50=
Date: Tue, 21 Jan 2020 16:30:15 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Richard Weinberger <richard@nod.at>
Message-ID: <20200122003014.GA180824@gmail.com>
References: <20200120223201.241390-1-ebiggers@kernel.org>
 <20200120223201.241390-5-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200120223201.241390-5-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 1.7 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.8 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iu3ud-00D92S-C0
Subject: Re: [f2fs-dev] [PATCH v5 4/6] ubifs: don't trigger assertion on
 invalid no-key filename
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
Cc: Daniel Rosenberg <drosen@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jan 20, 2020 at 02:31:59PM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> If userspace provides an invalid fscrypt no-key filename which encodes a
> hash value with any of the UBIFS node type bits set (i.e. the high 3
> bits), gracefully report ENOENT rather than triggering ubifs_assert().
> 
> Test case with kvm-xfstests shell:
> 
>     . fs/ubifs/config
>     . ~/xfstests/common/encrypt
>     dev=$(__blkdev_to_ubi_volume /dev/vdc)
>     ubiupdatevol $dev -t
>     mount $dev /mnt -t ubifs
>     mkdir /mnt/edir
>     xfs_io -c set_encpolicy /mnt/edir
>     rm /mnt/edir/_,,,,,DAAAAAAAAAAAAAAAAAAAAAAAAAA
> 
> With the bug, the following assertion fails on the 'rm' command:
> 
>     [   19.066048] UBIFS error (ubi0:0 pid 379): ubifs_assert_failed: UBIFS assert failed: !(hash & ~UBIFS_S_KEY_HASH_MASK), in fs/ubifs/key.h:170
> 
> Fixes: f4f61d2cc6d8 ("ubifs: Implement encrypted filenames")
> Cc: <stable@vger.kernel.org> # v4.10+
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Richard, can you review the two UBIFS patches in this series, and if you're okay
with them, provide Acked-by's so that we can take them through the fscrypt tree?
They don't conflict with anything currently in the UBIFS tree.

Thanks!

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
