Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAC51D9A4A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 May 2020 16:45:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jb3Ub-0000fR-Rd; Tue, 19 May 2020 14:45:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jb3UY-0000fA-Ro
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 May 2020 14:45:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y3f7tya+NWj2ieplTYQdGdxjv7L1nS5KXXCCypUG66s=; b=UBoMb5G999b9fQXVXU76JC/JO6
 TdbK6BqxkL1m386/1JpdUKT6+J9cHsWCFrMFWNyyBwHyIl8hvxj5vEOl5CZqWUE+C9vd+49cMGaUJ
 ZPGFeIVKJ8Ih/T0i/OkgnVFkjf6v8eXSbhURX65RIawotAN/lU6f1fiEtmjceDWIuhWg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Y3f7tya+NWj2ieplTYQdGdxjv7L1nS5KXXCCypUG66s=; b=AqV8ON30VseUokaJeI4Y8xOBCg
 tixlskjgWeX4Ufh/lrmeuRe4KgGmoN6hu66m83Sx7iOskvtud6QY81EEatlk8OyGEPViCq9QcJnvG
 OCogWVp1HQpkx3BHya91nsfEVB2QdJmgpdqhR72i6GJDU4UMmncqitDffmlJo/ZUyRLg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jb3US-000nzH-IK
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 May 2020 14:45:14 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BB3C920825;
 Tue, 19 May 2020 14:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589899503;
 bh=IaVjtUjZRfD5n9+imvde6GZIZTX/UXJ/zi0G9EtqwY8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mJzQ71AZohKqnmu/hIb1vJojWlq7pnCYd6ePvm+HoHwhRH6gnFUNWLJbDW6vXlxy+
 Sjjoqco6E4dO0ac3gZYa7/CYDGb5rG1spEg7Ug7kjnlZETQtiS4HugobFC8VDghAls
 srvR1sb43gH1vlDywH6XqoHrdvbMx4qhRYGcQXCE=
Date: Tue, 19 May 2020 07:45:01 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: "Theodore Y. Ts'o" <tytso@mit.edu>
Message-ID: <20200519144501.GA857@sol.localdomain>
References: <20200515204141.251098-1-ebiggers@kernel.org>
 <20200519111321.GE2396055@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200519111321.GE2396055@mit.edu>
X-Spam-Score: -0.3 (/)
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
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jb3US-000nzH-IK
Subject: Re: [f2fs-dev] [PATCH] fscrypt: add support for IV_INO_LBLK_32
 policies
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
Cc: Satya Tangirala <satyat@google.com>, linux-mmc@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, May 19, 2020 at 07:13:21AM -0400, Theodore Y. Ts'o wrote:
> On Fri, May 15, 2020 at 01:41:41PM -0700, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > The eMMC inline crypto standard will only specify 32 DUN bits (a.k.a. IV
> > bits), unlike UFS's 64.  IV_INO_LBLK_64 is therefore not applicable, but
> > an encryption format which uses one key per policy and permits the
> > moving of encrypted file contents (as f2fs's garbage collector requires)
> > is still desirable.
> > 
> > To support such hardware, add a new encryption format IV_INO_LBLK_32
> > that makes the best use of the 32 bits: the IV is set to
> > 'SipHash-2-4(inode_number) + file_logical_block_number mod 2^32', where
> > the SipHash key is derived from the fscrypt master key.  We hash only
> > the inode number and not also the block number, because we need to
> > maintain contiguity of DUNs to merge bios.
> > 
> > Unlike with IV_INO_LBLK_64, with this format IV reuse is possible; this
> > is unavoidable given the size of the DUN.  This means this format should
> > only be used where the requirements of the first paragraph apply.
> > However, the hash spreads out the IVs in the whole usable range, and the
> > use of a keyed hash makes it difficult for an attacker to determine
> > which files use which IVs.
> > 
> > Besides the above differences, this flag works like IV_INO_LBLK_64 in
> > that on ext4 it is only allowed if the stable_inodes feature has been
> > enabled to prevent inode numbers and the filesystem UUID from changing.
> > 
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> 
> Reviewed-by: Theodore Ts'o <tytso@mit.edu>
> 
> I kind of wish we had Kunit tests with test vectors, but that's for
> another commit I think.
> 

We do have ciphertext verification tests in xfstests for all the existing
fscrypt options.  Actually, I had hacked one together for IV_INO_LBLK_32 before
sending this patch
(https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/xfstests-dev.git/commit/?id=55153ceee2948269c0359bd97fc0d58a26139c87).
I'll be sending it for review after I've looked over it again.

Similarly, since earlier this year, we now also have ciphertext verification
tests in Android's VTS (Vendor Test Suite)
(https://android.googlesource.com/platform/test/vts-testcase/kernel/+/refs/heads/master/encryption/).
I'll be adding one for this new flag.

These ciphertext verification tests test the round-trip from the key added by
userspace to the data on-disk -- even if the data is encrypted by inline crypto
hardware rather than the kernel itself.  So they're better than Kunit tests.

The thing I'm struggling with a bit is actually that when inline crypto is used,
IV_INO_LBLK_32 introduces a case where the DUN can wrap from 0xffffffff to 0,
and that case is new/special in that blocks can't be merged over that boundary
even if they are both logically and physically contiguous.  So, we could also
use a test that tests doing I/O around this boundary where the DUN wraps around.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
