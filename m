Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9907A82CE0B
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 13 Jan 2024 18:56:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rOiF1-0007AT-W5;
	Sat, 13 Jan 2024 17:56:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1rOiEz-0007AG-RG
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 13 Jan 2024 17:56:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RXtr9yRtGhXa1zQhI6TwJsTMLFKlBPoQucNPsafIx8w=; b=aLxBw0aMklsQk96Pem6b0WALhW
 PWW9kJxxeVy21NmOwSm6lmcXRtJKZJF7lhu/Vq3mX6n0xlUp/AmUBfxqwWUrABHrhdw7kxtkYCRwm
 LszcGIjOjK0hntPnjc3ibznvpSTSvlFCvDgb84t0DI2l/78eAtgzJMRmzRfQ2blUWY+g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=RXtr9yRtGhXa1zQhI6TwJsTMLFKlBPoQucNPsafIx8w=; b=a
 Lt1bOESH0H6VVeXFyOYAdGeSfTwNX9BCaGA8O/dHVygcJFrin/sHzGatEJAsVhKNGCgGjGQuVsBCA
 Sw+CrD5HZtVLJNGOkN1z8on1X2vLugMj+GkOeiKHkFkVLqKIx0E6Ecdy8vyuPiBf6NFmnT1KaXFgK
 2gIw4nLzlbMyu4IU=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rOiEv-0000Bd-5r for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 13 Jan 2024 17:56:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 6D054B80471;
 Sat, 13 Jan 2024 17:56:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86EC2C433C7;
 Sat, 13 Jan 2024 17:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705168566;
 bh=o0ViNHP3TScYhkELwvt+eygKREygV0KbiPNAvWpOviQ=;
 h=Date:From:To:Cc:Subject:From;
 b=q2NmofdohcSTZOCOVDonGkIyNmHLoKklk1ors4PoNFjlPxXY1x088uCM2B6W0+Aqd
 qkUH2lBLb+iF/I0rrtpZb7Xiuc6pNOR1OOeWqeu6JVFcW3oJ0rZx/gGcbd8OF9OxnC
 FWCD8p6w9rCHMRB0TZb34l6v/lDf3YFch6jYPTTw0l8d4UEojN1IFw0A9HEGveuykE
 /iWaPuyfcHC8+dDPC0rBdqsiHIzajh+CQ+S1QiUlvPl/jMDQy7NYn3ceHjuR5jlRgf
 nMrei7rO+3gM4273h6cMImSuAFS0yRKOIjwi/Q16LRSarHrjryT3Cwgw/xCuAzsziC
 0hizZK5hOKlhg==
Date: Sat, 13 Jan 2024 09:56:04 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20240113175604.GA1409@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The following changes since commit
 38814330fedd778edffcabe0c8cb462ee365782e:
 Merge tag 'devicetree-for-6.8' of
 git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux
 (2024-01-12 15:05:30 -0800) are available in the Git repository at: 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rOiEv-0000Bd-5r
Subject: [f2fs-dev] [GIT PULL] fscrypt fix for 6.8-rc1
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The following changes since commit 38814330fedd778edffcabe0c8cb462ee365782e:

  Merge tag 'devicetree-for-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux (2024-01-12 15:05:30 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/fs/fscrypt/linux.git tags/fscrypt-for-linus

for you to fetch changes up to c919330dd57835970b37676d377de3eaaea2c1e9:

  f2fs: fix double free of f2fs_sb_info (2024-01-12 18:55:09 -0800)

----------------------------------------------------------------

Fix a bug in my change to how f2fs frees its superblock info (which was
part of changing the timing of fscrypt keyring destruction).

----------------------------------------------------------------
Eric Biggers (1):
      f2fs: fix double free of f2fs_sb_info

 fs/f2fs/super.c | 1 +
 1 file changed, 1 insertion(+)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
