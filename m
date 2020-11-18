Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 223F62B7761
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Nov 2020 08:58:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kfILs-0003Po-HT; Wed, 18 Nov 2020 07:58:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kfILn-0003Oo-9U
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Nov 2020 07:57:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DtbXhUZHFqMmfVQC/nm5RdQleTUHXqcTTnidykFCvXQ=; b=NvpkzVD9VIyyLM3D3G/VHvz9jO
 5wYslyn+c4vttNF8snm8Tm6cJi1TMtOzCTd63Fc3p64oEojC4wnu3AddKCdQ/YoG/Ii8gXOYIOxCE
 LLTJ+V+pEIusIoHMtj+ePYbUhrJH/UFAsUV36KjaCHBP+yqlDUfR+C0eGBbxd7kFObp8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=DtbXhUZHFqMmfVQC/nm5RdQleTUHXqcTTnidykFCvXQ=; b=V
 zT254Xh3zyW7UVLo/7rb4J6+GIDbDKQ688XdZEaOybdmUiMwxaiStTTrl/FFMjQXk65u65bPk+OVL
 X78xGl+3ePYnJq1kEfpATob2IkaGvsV+V68Tf9cmqXN1V0bRiZrwul1HDtFdSPTOGZqL8xRnk/3S6
 1IwtsFdkvqSCW+QQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kfILZ-00Cf8W-AG
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Nov 2020 07:57:58 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3F55E2080A;
 Wed, 18 Nov 2020 07:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605686259;
 bh=RIC5mu+TPEgksMKT+f1TM2ePCUTrxlaadfpm5VMsKc8=;
 h=From:To:Cc:Subject:Date:From;
 b=A+6dqvcTRZ0pE0gw4wXXN7TtjV668JBEprEGLRRtaSe1TUym2p46zV8cyYiudUEHp
 eL2GK9KCkRG7AtMzZZ0NWXHxhG842DV39eUgIk1EyM/F/3uDDg2hd6ex1aLRM+K8DD
 qaaZ8Xz/2laZctKUbSMDbJkN6K4gTVZZ6U9x2dgo=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Tue, 17 Nov 2020 23:56:04 -0800
Message-Id: <20201118075609.120337-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Spam-Score: 2.4 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kfILZ-00Cf8W-AG
Subject: [f2fs-dev] [PATCH 0/5] fscrypt: prevent creating duplicate
 encrypted filenames
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This series fixes a longstanding race condition where a duplicate
filename can be created in an encrypted directory if a syscall that
creates a new filename (e.g. open() or mkdir()) races with the
directory's encryption key being added.

To close this race, we need to prevent creating files if the dentry is
still marked as a no-key name.  I.e. we need to fail the ->create() (or
other operation that creates a new filename) if the key wasn't available
when doing the dentry lookup earlier in the syscall, even if the key was
concurrently added between the dentry lookup and ->create().

See patch 1 for a more detailed explanation.

Patch 1 introduces a helper function required for the fix.  Patches 2-4
fix the bug on ext4, f2fs, and ubifs.  Patch 5 is a cleanup.

This fixes xfstest generic/595 on ubifs, but that test was hitting this
bug only accidentally.  I've also written a new xfstest which reproduces
this bug on both ext4 and ubifs.

Eric Biggers (5):
  fscrypt: add fscrypt_is_nokey_name()
  ext4: prevent creating duplicate encrypted filenames
  f2fs: prevent creating duplicate encrypted filenames
  ubifs: prevent creating duplicate encrypted filenames
  fscrypt: remove unnecessary calls to fscrypt_require_key()

 fs/crypto/hooks.c       | 31 +++++++++++--------------------
 fs/ext4/namei.c         |  3 +++
 fs/f2fs/f2fs.h          |  2 ++
 fs/ubifs/dir.c          | 17 +++++++++++++----
 include/linux/fscrypt.h | 37 +++++++++++++++++++++++++++++++++++--
 5 files changed, 64 insertions(+), 26 deletions(-)


base-commit: 3ceb6543e9cf6ed87cc1fbc6f23ca2db903564cd
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
