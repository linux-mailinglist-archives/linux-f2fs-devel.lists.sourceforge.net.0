Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0156B826B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Mar 2023 21:12:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pboXH-00067d-RD;
	Mon, 13 Mar 2023 20:12:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pboX4-00067V-U0
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Mar 2023 20:12:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RNOnQSzxnnlo6WTgOcU+1OPbMbj0YuiC+MnuGHcOwuM=; b=WQkvzqUeX46VmytF5LtowQ4AtD
 b1VidI6+8H0tPUujuWu7pKOxqNSIY/jABiMWXAwWX752w7hT4ABRV0umFT9XdVru7EgoW6YUc1si8
 EaeADnZCo/p6Kec5ll8DuEkbjr68B6NPR5daZqVegBThcrQFD+aTsEJp7tplctmqhjmI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=RNOnQSzxnnlo6WTgOcU+1OPbMbj0YuiC+MnuGHcOwuM=; b=h
 Nuwy8UUjqYa3rjyeTJhyyf7vKNZBJGOctum//jYZn9ss2JpNhxlEbjpQ0GALUWuzY427CohLvmdkC
 e9wjCFyNOn+qwxE+KtvaB5R63f8KxnmZZpgP9DOAvr5FID41/WxhFJD6rX6Azz2lVX8USCo1jRKxo
 5RmPSJxd3bmpwijI=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pboX5-006l6m-7k for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Mar 2023 20:12:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1B1EAB8136E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 13 Mar 2023 20:12:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B49BFC433EF;
 Mon, 13 Mar 2023 20:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678738347;
 bh=93oBMhuuWAg7pa428yDott1Pdcee67T+Qwe4d9PxvgM=;
 h=From:To:Cc:Subject:Date:From;
 b=lR2dCQZ75GzqqfbwgBo3G/Gad6lzit53Eq10yxIBT5ufJDzbpeAfwZ/nZVEwjYbxs
 uFutQQYE+rWYUxqtTc2q9vzougmNrmXi6iNbkhQl+fpJpZf2PjpG835zSBE3n44Fdm
 InQARHxj3aAVK5nowH/AyooQOjDSjHs3rGe8WEKF04iTOGX28ooUReP9PI875jPrNm
 gn1SrWKG/J591OYn+L8t6QJEyfxt4dt2l0R/DDyA9pyG3kRRxx75s1FE0A3az/yejJ
 sl1MO9kmdKESq+PlGLGgAfTW0mmIzknVt4jR4nqRxHHA2wgy20Hr8sal+Q0JmSGggt
 f6/9QCWbK1zLw==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 13 Mar 2023 13:12:13 -0700
Message-Id: <20230313201216.924234-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This series removes the use of rb_entry based on memory
 alignment
 which doesn't look like a right design when considering various
 architectures/compilers.
 v2 from v1: - adjusted Eric's review - refactored gc.c further to clean up
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pboX5-006l6m-7k
Subject: [f2fs-dev] [PATCH 0/3] remove shared memory structures
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This series removes the use of rb_entry based on memory alignment which doesn't
look like a right design when considering various architectures/compilers.

 v2 from v1:
  - adjusted Eric's review
  - refactored gc.c further to clean up

Jaegeuk Kim (3):
  f2fs: factor out victim_entry usage from general rb_tree use
  f2fs: factor out discard_cmd usage from general rb_tree use
  f2fs: remove entire rb_entry sharing

 fs/f2fs/extent_cache.c | 241 ++++++++++++---------------------------
 fs/f2fs/f2fs.h         |  38 +------
 fs/f2fs/gc.c           | 139 ++++++++++++++---------
 fs/f2fs/gc.h           |  14 +--
 fs/f2fs/segment.c      | 252 +++++++++++++++++++++++++++--------------
 5 files changed, 324 insertions(+), 360 deletions(-)

-- 
2.40.0.rc1.284.g88254d51c5-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
