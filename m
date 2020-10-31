Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8692A1B2C
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  1 Nov 2020 00:13:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kZ03p-0005IG-V5; Sat, 31 Oct 2020 23:13:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kZ03o-0005I5-MT
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 31 Oct 2020 23:13:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s1ljncZGioS1RhPw7DN00xknjIMdzQoUXDtDY9srjCU=; b=NNyfYcKCIQiDfQjFd5jXdkFDPx
 qvvnUHOyVIGoDu/qSTRL+znJfluCCxmhxtw0Iuf/BF6NuXTjy70EdazMxryHCfkFt+QK2Y99sg+pi
 hgXiTHdnpJff36GQhZklzFZkvjWu2k2O9mYvuSJhSj3njBlnIDqQYuS4xgM5ISTyn3Ik=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=s1ljncZGioS1RhPw7DN00xknjIMdzQoUXDtDY9srjCU=; b=Y
 j3b9MpuOp2GjxkSj1qO0teXFbgS44+9NbkEXrumjg/aMXW/m9mPHz17hBw2Jylta8nLj1w4G1cErH
 iwj9wX6BOQ+fog7CEpfuxvEH9lHirHE+Li+ZVyukAMjHFcKRK2eSWCrzuVdBSo1W5Ac53dpAmPpy+
 OLDQEFMi8nuu/UWs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kZ03d-004Ty0-PQ
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 31 Oct 2020 23:13:24 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3C01A2087E;
 Sat, 31 Oct 2020 23:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604185983;
 bh=7W770UmoHOq+XJfX9XCbouj37nY4hXyYEf+d83ifZVo=;
 h=From:To:Cc:Subject:Date:From;
 b=p74WX71zHj2ebwSX5Bobq8aLbGs4nvtfFwa6F/wXpnSYQ0w5fJrk2Hc07BU8UauMv
 /xYwqR+GU6R379i3+poCFfkRDadiz3sMSlrWOG93rzrPcUNw3jknqCY+q/klkbE87B
 EGgPJTl9m4tyZiw82YysaZwQmo4XSRkwrJdFisjY=
From: Eric Biggers <ebiggers@kernel.org>
To: stable@vger.kernel.org
Date: Sat, 31 Oct 2020 16:11:22 -0700
Message-Id: <20201031231124.1199710-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
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
X-Headers-End: 1kZ03d-004Ty0-PQ
Subject: [f2fs-dev] [PATCH 4.9 0/2] backport some more fscrypt fixes to 4.9
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
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Backport some fscrypt fixes from 4.10 and 4.11 to 4.9-stable.
These will be needed for xfstest generic/395 to pass if
https://lkml.kernel.org/fstests/20201031054018.695314-1-ebiggers@kernel.org
is applied.

These are clean cherry picks.

Tested with 'kvm-xfstests -c ext4,f2fs -g encrypt'.

Eric Biggers (2):
  fscrypto: move ioctl processing more fully into common code
  fscrypt: use EEXIST when file already uses different policy

 fs/crypto/policy.c       | 36 ++++++++++++++++++++++--------------
 fs/ext4/ext4.h           |  4 ++--
 fs/ext4/ioctl.c          | 34 +++++-----------------------------
 fs/f2fs/f2fs.h           |  4 ++--
 fs/f2fs/file.c           | 19 ++-----------------
 include/linux/fscrypto.h | 12 ++++++------
 6 files changed, 39 insertions(+), 70 deletions(-)

-- 
2.29.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
