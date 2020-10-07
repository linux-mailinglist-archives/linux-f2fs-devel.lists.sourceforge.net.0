Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C150328573B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Oct 2020 05:48:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kQ0RZ-0001lC-5l; Wed, 07 Oct 2020 03:48:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kQ0RX-0001l3-TR
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Oct 2020 03:48:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OV5o2NczlKU7Pjs0Vu/50U97nvxvdbAazpXbRz5PEBI=; b=XdcPEdIsZupmoWwHYUa5J3ET3s
 m7VAHnTFeK0C562EG1ySAUrZ1T45hQKYBDZ3bDmMkXJxMzZiDWbR0ZnZdcdzLCknKSTscVXOlrYuS
 IPK036/hGIKJbu0Hm3s4j2xTffBsGGXqDq9dFDPlzOwTR9Y2ktZtunSFC8fD4oVnrvGw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OV5o2NczlKU7Pjs0Vu/50U97nvxvdbAazpXbRz5PEBI=; b=GQogAeAJB7v/UVwFaaAzh810C8
 0B9aq+ZADqQE8JIyDa6aPCD4+zqt9uAGi5b2wCzZYWyYxw/XGzhx+Yl/jYrPKc3yVzf8+dondntk/
 c1uMiFIaSlbxAxYnxFIEJ4Xjiqb2pfiklGHVZjWQLVPH182D6szoXG7jcp8OMh5iDlF8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kQ0RQ-005ZFr-Gr
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Oct 2020 03:48:43 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9D231208C3;
 Wed,  7 Oct 2020 03:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602042511;
 bh=utdOvzVHh89b4CpLVpb/B52DJTCKTgZ4TatN41r7vCM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DAaVPOwJ/Oo5GVLzk9uGENtdZtKxJUoCECj95UyceMUuaD19dko63qK5FPJ0xYvZH
 pAKVj9DaXhWCjJPiqysw5TgaBKd2mEoW5WKs4CXTgaScgMmgfnSbCFukXhjCwI1ueM
 RNPVtN8K/4Gz3YjOidGulDFCDFo3g2LJKJ30WO5c=
Date: Tue, 6 Oct 2020 20:48:29 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 Daeho Jeong <daehojeong@google.com>
Message-ID: <20201007034829.GA912@sol.localdomain>
References: <20201001002508.328866-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201001002508.328866-1-ebiggers@kernel.org>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kQ0RQ-005ZFr-Gr
Subject: Re: [f2fs-dev] [PATCH 0/5] xfstests: test f2fs
 compression+encryption
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
Cc: linux-fscrypt@vger.kernel.org, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Sep 30, 2020 at 05:25:02PM -0700, Eric Biggers wrote:
> Add a test which verifies that encryption is done correctly when a file
> on f2fs uses both compression and encryption at the same time.
> 
> Patches 1-4 add prerequisites for the test, while patch 5 adds the
> actual test.  Patch 2 also fixes a bug which could cause the existing
> test generic/602 to fail in extremely rare cases.  See the commit
> messages for details.
> 
> The new test passes both with and without the inlinecrypt mount option.
> It requires CONFIG_F2FS_FS_COMPRESSION=y.
> 
> I'd appreciate the f2fs developers taking a look.
> 
> Note, there is a quirk where the IVs in compressed files are off by one
> from the "natural" values.  It's still secure, though it made the test
> slightly harder to write.  I'm not sure how intentional this quirk was.
> 
> Eric Biggers (5):
>   fscrypt-crypt-util: clean up parsing --block-size and --inode-number
>   fscrypt-crypt-util: fix IV incrementing for --iv-ino-lblk-32
>   fscrypt-crypt-util: add --block-number option
>   common/f2fs: add _require_scratch_f2fs_compression()
>   f2fs: verify ciphertext of compressed+encrypted file

Jaegeuk, Chao, Daeho: any comments on this?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
