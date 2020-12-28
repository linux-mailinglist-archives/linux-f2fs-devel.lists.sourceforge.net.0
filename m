Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 412692E6A4F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Dec 2020 20:13:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ktxxW-0000wR-UT; Mon, 28 Dec 2020 19:13:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1ktxxW-0000wF-Cv
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Dec 2020 19:13:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OkFfEWuU83JPFhg7R4Gkk7eoH8H9Q3HOR9fY2Rz5l5k=; b=iBoB4FCXbBgtmd5Qanu8UMRDMg
 ewtFz+KWqGN90kxTfVTxYkwEZkQPClVKecJRIRTNeQYfwhQWdbwU+Ulx55ZRtfK1EFYAohcnbO1Xb
 +/YcQ99XIwpIE0/NAKYVh9vVjjIgxS1LJfj5KJQT3JuVDa0OahF50AHuJfds8RzXrszI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=OkFfEWuU83JPFhg7R4Gkk7eoH8H9Q3HOR9fY2Rz5l5k=; b=K
 sn6QjWRKT2FUzK2mJ3vGocms4xLWFCrIzA22qAEPEnAd79J0smmbRzN6ebvfrwE/HKn9J3B3Z7lOr
 17cnWkryrqt94BxAq5GF5zrp0zftuQt6lntoakH84L/6uJ1stvJQMR4ZxkE3s0DVJp31dV6mEHEv2
 4wnFPdTkJqDGOq+c=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ktxxQ-003H5r-T0
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Dec 2020 19:13:34 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 328CF229EF;
 Mon, 28 Dec 2020 19:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609182796;
 bh=WfRrNEImpr0j+Oo7HcTLI/gAY4EckaLzvRW0Nnzz9QA=;
 h=From:To:Cc:Subject:Date:From;
 b=QOEccFRDvvHr/4eKSIAJZC9fjOwN3vBNabeHqiWacoH3tyHdSDbB8u4lpQ+8ivZxl
 Vj85wtNi/mrufL/iKzCrKR1/nEgU9SrebR++4bzxFl2/Mshw+ScfXbUGolntZpLcZE
 zR/pJJuYEA50Ka0SdVTXsXN6PD2pSUJF8c7MYQoQhutE/MoeyIxxhKk6gUyxpWeFUi
 +0bbHBksTbZrbahMx4nfKbVwhjK/ZpuA+wCDeiY7tX1IQ55bIU4t4Mgo21/1nR8+sT
 8+BUv+NXhmRp7IYFdAl2VBy8p/RCY7xctzJSOrcD5z4ydBVzm8Z0p4lpURPSIy4ONa
 Ecy4xLRIL/voA==
From: Eric Biggers <ebiggers@kernel.org>
To: stable@vger.kernel.org
Date: Mon, 28 Dec 2020 11:12:07 -0800
Message-Id: <20201228191211.138300-1-ebiggers@kernel.org>
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
X-Headers-End: 1ktxxQ-003H5r-T0
Subject: [f2fs-dev] [PATCH 4.19 0/4] fscrypt: prevent creating duplicate
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

Backport four commits from v5.11-rc1.  I resolved conflicts in the first
two.

Eric Biggers (4):
  fscrypt: add fscrypt_is_nokey_name()
  ext4: prevent creating duplicate encrypted filenames
  f2fs: prevent creating duplicate encrypted filenames
  ubifs: prevent creating duplicate encrypted filenames

 fs/crypto/hooks.c               | 10 +++++-----
 fs/ext4/namei.c                 |  3 +++
 fs/f2fs/f2fs.h                  |  2 ++
 fs/ubifs/dir.c                  | 17 +++++++++++++----
 include/linux/fscrypt_notsupp.h |  5 +++++
 include/linux/fscrypt_supp.h    | 29 +++++++++++++++++++++++++++++
 6 files changed, 57 insertions(+), 9 deletions(-)

-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
