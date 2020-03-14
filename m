Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A0E18564A
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Mar 2020 21:53:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jDDmm-0001mu-N7; Sat, 14 Mar 2020 20:53:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jDDmg-0001mZ-Fw
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 14 Mar 2020 20:53:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0SEq7JVkgwqcEQgxVqhopF4IEZFuq9UyJX3hwnwBa0I=; b=Jk15a4vyoWTfRz20Avlm+AkLGC
 X658+/IYkJyXlXJ2aEqHP7Ngn/18zc99Yu0T4tccTy5rG2SSeko3pCOKDBY4tdWD+3eoB0lnqlOj8
 clccIommxZ9Tujoa2jwLFz5lvB/SaGXJm2sooJPWlMnM97dSGjLSTEsiQCDLQ6HV/JG8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0SEq7JVkgwqcEQgxVqhopF4IEZFuq9UyJX3hwnwBa0I=; b=l
 PV+cgNl5SqMJtHpqqfCzJshaibs6TO88r9CZUIR2CPl6T/Hs+6GZhOVP7F9Bk3C9ekzgqdTSgv9hR
 7f5PVuc8sbDuJslmKyMQoblyJxJQWcAUeE3B7lAqZPcAfSaPiRbu2bXfV7RqX2p3ZNPAZOjBxe7i/
 uhDMg8uEtgdJmViE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jDDmd-00BCJF-Im
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 14 Mar 2020 20:53:26 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E76F22071B;
 Sat, 14 Mar 2020 20:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584219193;
 bh=nlaaveyfQbhFKfwiAaphWpQDQEdEAujbuJUQUWFnHF0=;
 h=From:To:Cc:Subject:Date:From;
 b=0iSH8Q5D+Ml4kWit103vNhqqB1ao1wz8fX85tuNaSR98NmuiY+2hC1jyJD/ruJ/V1
 199VRhsa+r9bu1MzO7xz9Tr7s0TnpAj5smS4RburSHj7ylnB0x9tbam9/SzEee07yX
 pQtOWhG8kxmo09f3EZX3BsptKW71I9wsopcIgkek=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Sat, 14 Mar 2020 13:50:48 -0700
Message-Id: <20200314205052.93294-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: 0.7 (/)
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -1.7 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jDDmd-00BCJF-Im
Subject: [f2fs-dev] [PATCH 0/4] fscrypt: add ioctl to get file's encryption
 nonce
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
Cc: linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patchset adds an ioctl FS_IOC_GET_ENCRYPTION_NONCE which retrieves
the nonce from an encrypted file or directory.

This is useful for automated ciphertext verification testing.

See patch #1 for more details.

Eric Biggers (4):
  fscrypt: add FS_IOC_GET_ENCRYPTION_NONCE ioctl
  ext4: wire up FS_IOC_GET_ENCRYPTION_NONCE
  f2fs: wire up FS_IOC_GET_ENCRYPTION_NONCE
  ubifs: wire up FS_IOC_GET_ENCRYPTION_NONCE

 Documentation/filesystems/fscrypt.rst | 11 +++++++++++
 fs/crypto/fscrypt_private.h           | 20 ++++++++++++++++++++
 fs/crypto/keysetup.c                  | 16 ++--------------
 fs/crypto/policy.c                    | 21 ++++++++++++++++++++-
 fs/ext4/ioctl.c                       |  6 ++++++
 fs/f2fs/file.c                        | 11 +++++++++++
 fs/ubifs/ioctl.c                      |  4 ++++
 include/linux/fscrypt.h               |  6 ++++++
 include/uapi/linux/fscrypt.h          |  1 +
 9 files changed, 81 insertions(+), 15 deletions(-)


base-commit: 98d54f81e36ba3bf92172791eba5ca5bd813989b
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
