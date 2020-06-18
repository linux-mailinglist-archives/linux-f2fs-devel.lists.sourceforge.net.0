Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1321FFA2B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Jun 2020 19:27:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jlyK4-0005Gb-3z; Thu, 18 Jun 2020 17:27:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jlyK2-0005GT-LQ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 17:27:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d7D+lWAhq/G86CkPcYSet6AUCCMA5c5gsm5q0gSeCIg=; b=XsIwoNhcThEFcHCUIoEmafcl7i
 6cN5AuRorzJ3qE6wWJ8nX/AvQE29IpNouVixkNpxvH1xA4H0lKguWSpDgP/IPCQCor6aoRcnmSLH0
 U+Xby6S0zhKLXigRn79WJRQnkm053dUBKvofnX7iZwYPOvWgbigMn9/3JBeLHOin857M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=d7D+lWAhq/G86CkPcYSet6AUCCMA5c5gsm5q0gSeCIg=; b=XKlulNlUOPS8SCw35FBfL8fk0j
 aRbBTO3G6C5tEDJqiTUK6giFgxNz6nm8WkIJ49Kii+pBC44Hv/bNYXtJ2a91PzQC16/JKadiWNLMd
 G0SGjzwicMOYW91zklqe+g80aBHm4hGYqAcCqtMt2/hncj9BjjP4/x5fEj/NOwFjuA/Q=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jlyK0-00AysJ-If
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 17:27:30 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1E40920890;
 Thu, 18 Jun 2020 17:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592501231;
 bh=TjmLKSO1Nhc9L5WT6Ph5Sftq66DD91glxmgDoaZe2V4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PV1iFkiuyMiFLgJcbVe34Dxn0Lkw+nIq+CFntgs3Fcb6w9OHUzPGaZw7NBu9hYGcV
 pAgyRbAqaANA+PQv0sDqz5p5ny107XWdY0G1bCAtAdkYgKHsXrWpB7tMlHWF9dDhAL
 n4vfoLPY2D89AQJgkxgqnnOOUXeY8urS/s3azF0U=
Date: Thu, 18 Jun 2020 10:27:09 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200618172709.GA2957@sol.localdomain>
References: <20200617075732.213198-1-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200617075732.213198-1-satyat@google.com>
X-Spam-Score: -0.5 (/)
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
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jlyK0-00AysJ-If
Subject: Re: [f2fs-dev] [PATCH 0/4] Inline Encryption Support for fscrypt
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
Cc: linux-fsdevel@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jun 17, 2020 at 07:57:28AM +0000, Satya Tangirala wrote:
> This patch series adds support for Inline Encryption to fscrypt, f2fs
> and ext4. It builds on the inline encryption support now present in
> the block layer, and has been rebased on v5.8-rc1.
> 
> Patch 1 introduces the SB_INLINECRYPT sb options, which filesystems
> should set if they want to use blk-crypto for file content en/decryption.
> 
> Patch 2 adds inline encryption support to fscrypt. To use inline
> encryption with fscrypt, the filesystem must set the above mentioned
> SB_INLINECRYPT sb option. When this option is set, the contents of
> encrypted files will be en/decrypted using blk-crypto.
> 
> Patches 3 and 4 wire up f2fs and ext4 respectively to fscrypt support for
> inline encryption, and e.g ensure that bios are submitted with blocks
> that not only are contiguous, but also have contiguous DUNs.
> 
> Eric Biggers (1):
>   ext4: add inline encryption support
> 
> Satya Tangirala (3):
>   fs: introduce SB_INLINECRYPT
>   fscrypt: add inline encryption support
>   f2fs: add inline encryption support
> 

Like I said on the UFS patchset: as this previously went through a number of
iterations as part of the "Inline Encryption Support" patchset (latest v13:
https://lkml.kernel.org/r/20200514003727.69001-1-satyat@google.com), it would be
helpful to list the changelog from v13 (though I can see that not too much
changed).  And I probably would have called it v14, but it doesn't matter much.

Explicit mentioning how this was tested would also be helpful.  And for that
matter, we should update the "Tests" section of the fscrypt documentation file
to mention also using the inlinecrypt mount option, e.g.:

diff --git a/Documentation/filesystems/fscrypt.rst b/Documentation/filesystems/fscrypt.rst
index f517af8ec11c..f5d8b0303ddf 100644
--- a/Documentation/filesystems/fscrypt.rst
+++ b/Documentation/filesystems/fscrypt.rst
@@ -1255,6 +1255,7 @@ f2fs encryption using `kvm-xfstests
 <https://github.com/tytso/xfstests-bld/blob/master/Documentation/kvm-quickstart.md>`_::
 
     kvm-xfstests -c ext4,f2fs -g encrypt
+    kvm-xfstests -c ext4,f2fs -g encrypt -m inlinecrypt
 
 UBIFS encryption can also be tested this way, but it should be done in
 a separate command, and it takes some time for kvm-xfstests to set up
@@ -1276,6 +1277,7 @@ This tests the encrypted I/O paths more thoroughly.  To do this with
 kvm-xfstests, use the "encrypt" filesystem configuration::
 
     kvm-xfstests -c ext4/encrypt,f2fs/encrypt -g auto
+    kvm-xfstests -c ext4/encrypt,f2fs/encrypt -g auto -m inlinecrypt
 
 Because this runs many more tests than "-g encrypt" does, it takes
 much longer to run; so also consider using `gce-xfstests
@@ -1283,3 +1285,4 @@ much longer to run; so also consider using `gce-xfstests
 instead of kvm-xfstests::
 
     gce-xfstests -c ext4/encrypt,f2fs/encrypt -g auto
+    gce-xfstests -c ext4/encrypt,f2fs/encrypt -g auto -m inlinecrypt


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
