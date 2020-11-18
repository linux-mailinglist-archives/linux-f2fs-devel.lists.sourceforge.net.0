Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C29472B745A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Nov 2020 03:51:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kfDYz-00024y-4q; Wed, 18 Nov 2020 02:51:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kfDYx-00024U-AJ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Nov 2020 02:51:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ILylTZmtViR+7+WZAll7N1BisayuDVzjg399Vf0Chfg=; b=gLmPLsHBZecWSpoFDwRU1QW/mN
 +EfGnF1ru8N8Xf8O63zbBCMz8rzbefEMMHHPP9cFb7Tv47exztpDsPys36InESuVFl+dENIacn9L6
 G5K4Gu/5r60wsjs3irsnjkDTGk9SaWYgxqzmQ021LwCf8NGEPAY62kNRFF2UkAXVYJd4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ILylTZmtViR+7+WZAll7N1BisayuDVzjg399Vf0Chfg=; b=fvHCByBl/xo1YXZsVkiSgbvASX
 nutIKsOVFQZHpNqYXEODPwmLJVlsMcjZqUR4f/UGd+DKXUOAFBsowx1Tu2NU2wOqtYHM1J7Ndc4Bm
 XlvbIORwxX98rBf+6JQMLjUCwAW9BwncSsDQKT71L2y8gGhTwtHwmoDxwVf2ISxyYa/0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kfDYr-00C0vY-C8
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Nov 2020 02:51:15 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A27A52168B;
 Wed, 18 Nov 2020 02:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605667864;
 bh=yQLMqwIXjBjRAFtQBs5wUsPvR7JiE//0NeTddTe+FTY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ph8iDYNt3/JLiNU/2Xtn6irLPFDpoop2/QKV7tOrRNZjd/Q4R5JwJSWQx6mUuNhPd
 vTu5PzGdoWTo8E4SOZVwQaSVjpaM9xLgagUhfVoiv8S8pZRFOn2rPTzkAz03MYAJGh
 f8ZdbI8ic5P5jhX15uu0Bo3stnebkLqsNFYLGPHQ=
Date: Tue, 17 Nov 2020 18:51:02 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <X7SMFj8cQGjP/xip@sol.localdomain>
References: <20201117140708.1068688-1-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117140708.1068688-1-satyat@google.com>
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
X-Headers-End: 1kfDYr-00C0vY-C8
Subject: Re: [f2fs-dev] [PATCH v7 0/8] add support for direct I/O with
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 "Theodore Y . Ts'o" <tytso@mit.edu>,
 "Darrick J . Wong" <darrick.wong@oracle.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Nov 17, 2020 at 02:07:00PM +0000, Satya Tangirala wrote:
> This patch series was tested by running xfstests with test_dummy_encryption
> with and without the 'inlinecrypt' mount option, and there were no
> meaningful regressions. One regression was for generic/587 on ext4,
> but that test isn't compatible with test_dummy_encryption in the first
> place, and the test "incorrectly" passes without the 'inlinecrypt' mount
> option - a patch will be sent out to exclude that test when
> test_dummy_encryption is turned on with ext4 (like the other quota related
> tests that use user visible quota files).

It would be helpful to have some more testing results that show that the direct
I/O support is really working as intended, especially in the new case where
logical_block_size < data_unit_size and buffers are only logical_block_size
aligned --- both with real hardware and with blk-crypto-fallback.  Using my
patchset https://lkml.kernel.org/r/20201112194011.103774-1-ebiggers@kernel.org
it should be possible to test with real eMMC inline encryption hardware on
Snapdragon 630; it has logical_block_size=512.

Also note, generic/587 was already added to the ext4/encrypt and ext4/encrypt_1k
exclusion lists by xfstests-bld commit 02e4bfe628b4.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
