Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CDB2EA2C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 May 2019 03:19:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lCO4i2shzV83Xnsk4y3F/5kLWLDldr1BcAsoid7IurE=; b=g/eWO+7TFEb9oEb+3/AtkkF7tX
	/JDQQyzN1dAvVN5CCX+crS2ZEZAZlX6m/5I0p4RTZ5vU6kdq3sAQuXs2E2X1t5qbWS7dn+CwVv5ij
	l23dWUFUWeuTVoDG4UJLIfcYnTu0TzK9BWTADMfcsyUEoqtQrBYrDuLsbwCaQP5Fw8nA=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hW9jN-00048g-Uz; Thu, 30 May 2019 01:19:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3cynvXAYKAHARfcgSbUccUZS.Qca@flex--drosen.bounces.google.com>)
 id 1hW9jN-00048Y-Ho
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 May 2019 01:19:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p0enTo1paGhtTCzKrRxNViLV0NJbbGkfixUzKcvFAIM=; b=AuN/hRmbexzXq0FsBfDccM5V3C
 GgMOc0bY5pDbgtZGQSy7hAgNOI/56YXAX5tVed36YMfc1pQSXnUcGX6qEe2L2G9hUdYgMUjUEvnyP
 346nXRqIygTQ6krnLIsbbgFhBwt6Bi/hzAYy15CeyyWOjKHdyGEwllbrJshZAUhCm1fQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=p0enTo1paGhtTCzKrRxNViLV0NJbbGkfixUzKcvFAIM=; b=a
 US8YlRUV7rTOb1VmVGDMD9ckR4gx8RYzA+x0FnI+Qpz5z6wBozmf2mZ5iXDMew3UO2A5iwUle/sIJ
 TyuJ/IH12zYh9HYqXaA4Z470Jxb6s3oIcv+wCEm2gV2S84kllz1EulJ1wHvDGlg7niPi+8mRH5tSf
 JGyQE+FazffFJBs4=;
Received: from mail-yw1-f74.google.com ([209.85.161.74])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hW9jM-004Hzj-8z
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 May 2019 01:19:45 +0000
Received: by mail-yw1-f74.google.com with SMTP id j72so4003608ywa.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 29 May 2019 18:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=p0enTo1paGhtTCzKrRxNViLV0NJbbGkfixUzKcvFAIM=;
 b=fbbGY86HQAvMyuGABmIV5PWAqyAjKpNYQPTVcYsDDwLMglTCo/RHkGXEHGjlPQlO1i
 1maBy1XlB8ZPwQF1a4O65dbNcWKaebodjcj8l91tKo7tj7lfzms/LmWum3fYAkSCF9+a
 1MduZ6NgfZ4J4RsrcjHMnjmUA/OLn/1xplY3+eg6JF39R9cjdd0UM4lb5tbyKLyN2Flw
 Imwh+pgUv75Np9AyNwYEWKPBO/FRJRrzAlqLSYPGQ2W1XvDlp+vOaZzMVcUBsMuVa0aF
 UhUtZx1Rwvk2/6sFkV3HlEKjNDlqDECo3ImPqfc4klHFAG5mtBhfs4Gt4xbiOYfl1x3s
 9mKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=p0enTo1paGhtTCzKrRxNViLV0NJbbGkfixUzKcvFAIM=;
 b=SDDQGov3AEdoW8N6cGipQmG2CvcGB8sOlfxxSIWGL9TOW3Wt0vUtrurxxMLRGORMuW
 DK0Wn/76zrqxX+00Wq86VoO49uzMcXO9qRKJ/mtl6AybZVOSIBWILNo36hs8xQFsTNVc
 ndg/+kaTM0pc0pJBA23AegenYXHeSdvgmArTVHXj0H97t6XH9yd7bMJe/RTXnx6qyh5v
 gperlQpTBZgaH6KBnt12kZkfBKETxPVCJc8liVGMeF5+AoPC9sCbig91LiWyRrW5p3sg
 SEDWvzPx5zYRG6tMPsPbnGdvENT3idjNKyYQtFaqXE9Qs6U83mgPFECAuD/RWhG9AlZ8
 6mXg==
X-Gm-Message-State: APjAAAVs1SRzy69DDAkboDmqetj3bz8apjiUJZRUcpVvQlPLY59Emdno
 QOZ7xs3bSqhtxLD4248ux3pqVPQjPU8=
X-Google-Smtp-Source: APXvYqzWm35RV29MwLeQluK9gcDBYwAUwpZj3MTGP+M+S2CQ5CrRwwOROjnO+bcTCPD25gcsaXKtfsvXOEM=
X-Received: by 2002:a25:4050:: with SMTP id n77mr310800yba.77.1559177587174;
 Wed, 29 May 2019 17:53:07 -0700 (PDT)
Date: Wed, 29 May 2019 17:49:02 -0700
Message-Id: <20190530004906.261170-1-drosen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>, 
 Jonathan Corbet <corbet@lwn.net>, linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.161.74 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 T_DKIMWL_WL_MED        DKIMwl.org - Medium sender
X-Headers-End: 1hW9jM-004Hzj-8z
Subject: [f2fs-dev] [PATCH v3 0/4] F2FS Checkpointing without GC,
 related fixes
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: linux-fsdevel@vger.kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org, Daniel Rosenberg <drosen@google.com>,
 linux-doc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The first patch adjusts the default allowable holes for checkpointing, and
the next two patches fix underflow issues related to inc_valid_block_count
and inc_valid_node_count. The final one adds a new feature for
checkpointing where the user can specify an acceptable amount of space to
lose access to up front in checkpointing=disable mode instead of requiring
garbage collection.

There is still a question around what to do when the current reserved
space is less than reserved. As it stands, when a block is deleted, if it
was an old block, the space is not actually given back, and is marked as
unusable. But current reserve may still rise towards reserve, which would
make freeing one block result in a net loss of one block, as opposed to no
change. Reserved and unusable serve the same function, so it may make
sense to just handle it as max(current_reserved, unusable), which
effectively removes the double counting. I'm leaving that until later.

Changes from v2:
Adjust threshold for initial unusable blocks
Patches to fix underflows
Added option to set a block limit in addition to a percent for initial
unusable space

Daniel Rosenberg (4):
  f2fs: Lower threshold for disable_cp_again
  f2fs: Fix root reserved on remount
  f2fs: Fix accounting for unusable blocks
  f2fs: Add option to limit required GC for checkpoint=disable

 Documentation/ABI/testing/sysfs-fs-f2fs |  8 ++++
 Documentation/filesystems/f2fs.txt      | 19 +++++++-
 fs/f2fs/f2fs.h                          | 22 ++++++---
 fs/f2fs/segment.c                       | 21 +++++++--
 fs/f2fs/super.c                         | 62 ++++++++++++++++---------
 fs/f2fs/sysfs.c                         | 16 +++++++
 6 files changed, 115 insertions(+), 33 deletions(-)

-- 
2.22.0.rc1.257.g3120a18244-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
