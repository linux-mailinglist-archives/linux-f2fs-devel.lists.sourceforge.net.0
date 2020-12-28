Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 770A12E6A27
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Dec 2020 19:55:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ktxgQ-00037C-87; Mon, 28 Dec 2020 18:55:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1ktxgP-000371-Qf
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Dec 2020 18:55:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mABC0JB7rwxKVd2pnZUh1I+z5g2grX51PZsxBl43rwM=; b=bFbYFIBhf9yClEGGW7hBrsJlSB
 HYJH8RZQ7yv+EQtFs3YLx3olasqjfqHAhQOBQsYYCmBeoaq4uMA3D29j/W6NOHtLz+HOS7T/X+0JD
 bk9croxf0qAFCLxw16dMPkH/TraRNtQY1rKeJv40I8FNQq897VHgftpn0OOd4xpbFmiM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=mABC0JB7rwxKVd2pnZUh1I+z5g2grX51PZsxBl43rwM=; b=E
 amOZEIYR43AFCgcVBGB2yFFpTX44Lxxfvj9CbMttYqVNJHig7d+D4ZW0hFewaj+o+lrP1BCi+6jrB
 n6aavufFCNzEBjSFDOGtlFzFQjvKgNk1bdoksStY+fIeQRvzjDNLYkg3U8LPRKSk2WHPZk3Bi0pM4
 FZjs/q99fYgvhAjU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ktxgC-003G4D-SU
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Dec 2020 18:55:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26B51221F8;
 Mon, 28 Dec 2020 18:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609181728;
 bh=VkM+zALiqlg97TIjo+lgwe+6aK90+NNjU4+Z9i2Ja24=;
 h=From:To:Cc:Subject:Date:From;
 b=ESLnjXJ1nWfg071HzMKi/VfMc46fxKf9sg+yrbZG3jQShKB2zf8GvycxGjG9U0Wq0
 zxZ/M3JAGElSFaoJ3DvCZhYO8QqQzYTFYSIpwnTG7D4XPRncnVmEjney2iv0O4MWbp
 5ex621LfQTUa4CnDtpFtITCIexEo2MIA7qCcTD4pZU9S+r+vro3DysR3L7bAYy4jYp
 Ecn8zRekNnyoQY7zRxZu0drNqbMSKb+cv9C5BQnKrYQdEy/sW1SWWyK4uqDgQtzFNz
 DDRxrxOGQe6cwRBmMnWrp41pfs8t1krRUDkAWK0xaDYjiWLZXDvWumXu6XsfETJQZ5
 N+xvAYvaKrGPQ==
From: Eric Biggers <ebiggers@kernel.org>
To: stable@vger.kernel.org
Date: Mon, 28 Dec 2020 10:54:29 -0800
Message-Id: <20201228185433.61129-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Spam-Score: 2.2 (++)
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
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ktxgC-003G4D-SU
Subject: [f2fs-dev] [PATCH 5.4 0/4] fscrypt: prevent creating duplicate
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
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Backport four commits from v5.11-rc1.  I resolved a conflict in the
first one.  The rest are clean cherry-picks which didn't get picked up
yet because they depend on the first one.

Eric Biggers (4):
  fscrypt: add fscrypt_is_nokey_name()
  ext4: prevent creating duplicate encrypted filenames
  f2fs: prevent creating duplicate encrypted filenames
  ubifs: prevent creating duplicate encrypted filenames

 fs/crypto/hooks.c       | 10 +++++-----
 fs/ext4/namei.c         |  3 +++
 fs/f2fs/f2fs.h          |  2 ++
 fs/ubifs/dir.c          | 17 +++++++++++++----
 include/linux/fscrypt.h | 34 ++++++++++++++++++++++++++++++++++
 5 files changed, 57 insertions(+), 9 deletions(-)

-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
