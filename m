Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC61F1CE3E7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 May 2020 21:22:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jYE0Q-0006Ji-PU; Mon, 11 May 2020 19:22:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jYE0Q-0006Jb-A6
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 May 2020 19:22:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BbNixKmLtpaFpWd/utiD2PIKysSR6oOnPCFtFg/lk8E=; b=B/ip3EnIdTJ6vVDxBWP4zDuUJ1
 N/wTwGNSMmvAS8crd/WCWYgEVvpkLvLKMij/RUIUer7jrEBVmACS07nBjPeMTOJwn5Dr9nB9Yg13y
 rC08ELuFp593CBWqpV3yad1LGYqDv3Y3TEsddYJTsAvQNKLVaC3mcJn3/h98MeTXdNPM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=BbNixKmLtpaFpWd/utiD2PIKysSR6oOnPCFtFg/lk8E=; b=I
 TVVSDkzGP9KCdY5xL6KQ62k3IVlqLCmYj/flJmSRb7/7DZZIBWHKSH21iOC7zA3tMNR88uyWbIXtr
 73/mmsIpDfu9bim5FBz2yaqlUiK+M3MyJ7ldD6AFVfFqRYJRLh+FbsuX6ddPZZq4ZqRVjckMf/JKt
 abc0d9zLqvQ+seHQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jYE0P-001nDd-BX
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 May 2020 19:22:26 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A6E9D20A8B;
 Mon, 11 May 2020 19:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589224939;
 bh=K94kZ3diPmckwEqrJ3ZSvaBTuE3MNfY2oXesZrNVmgQ=;
 h=From:To:Cc:Subject:Date:From;
 b=yzw6SnUVTExM8HMczF7o9Tf8Pei1C/5E/pUrlKOxogcVi2V0vFyukBHDoTHxpsjth
 Y7YakELytlsVfNYinqo5R3sDQPBc/fLtc8tvvaQuOyEIRKPaztk1siqxorTITFbxQp
 tZgt8I0DLqIoWiUOb6XMxyNBc30jl23XhH+ZXaug=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon, 11 May 2020 12:21:16 -0700
Message-Id: <20200511192118.71427-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jYE0P-001nDd-BX
Subject: [f2fs-dev] [PATCH 0/2] fs-verity: misc cleanups
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
Cc: linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In fs/verity/ and fsverity.h, fix all kerneldoc warnings, and fix some
coding style inconsistencies in function declarations.

Eric Biggers (2):
  fs-verity: fix all kerneldoc warnings
  fs-verity: remove unnecessary extern keywords

 fs/verity/enable.c           |  2 ++
 fs/verity/fsverity_private.h |  4 ++--
 fs/verity/measure.c          |  2 ++
 fs/verity/open.c             |  1 +
 fs/verity/signature.c        |  3 +++
 fs/verity/verify.c           |  3 +++
 include/linux/fsverity.h     | 19 +++++++++++--------
 7 files changed, 24 insertions(+), 10 deletions(-)

-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
