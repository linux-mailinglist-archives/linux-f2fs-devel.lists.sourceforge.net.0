Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F19F6D6A17
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Apr 2023 19:14:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjkFD-0001UZ-9h;
	Tue, 04 Apr 2023 17:14:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@kernel.org>) id 1pjkFB-0001UN-Dm
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 17:14:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ReB9T+Eeq+lXHI+7/o+fo45B4UKmLZYoI6tOb5KlMac=; b=Qy11A8WdVfPZeVXyx32aPC2SzN
 f7Vyyt8P+7Zi8GLwYRAVIDsIrY0PZoflii7wYAbahy0EaKYtqSM0HguZHPvOIzbYdU4/+WpePPExb
 c6+CMLHrfU3vhvXlxhJStkYb1v7lFiZio0rBzuT3D9H1b0FCAps1/33ICuYHnbJ7c8yg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ReB9T+Eeq+lXHI+7/o+fo45B4UKmLZYoI6tOb5KlMac=; b=ChWOrTPCCNxRXjHCgK3teW5DKu
 ceMQGjNDoyF+etIeYrmfQuCYF2GM896KmAJw5PW9BXe05fuuOU/eLrtse+9XtsQbITTbiqhDDZPIh
 z+hFzG/IaKiZkyzXtxh6xtp1zQ2dzXWgb/VvZVKZEOk1Pl7g/8q4SOE/7DB3XITjQ0HQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pjkF9-0001a8-Kw for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 17:14:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4401263783;
 Tue,  4 Apr 2023 17:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E8ABC433A1;
 Tue,  4 Apr 2023 17:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680628485;
 bh=qEU5p/rrPBMCcC0b9NygBo0CKzlLnTtdCdY5YHNjXz8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a7ZekHh0kNeqmVuQWe3cMaiVtL9ICvdGaufuyHnjBLAPy3EG4Jf6gOeacxzbQ4xn9
 QTLN3vKygazocZQuD6bz67l1p9bYvsCQZAYHJlFOw35kzra2NO6G33uE8wOfolwziO
 xj2ficCC1e0A9/fy64r5Y7LewDk8qhNPbg49nwMZJMp/fJTKljG3nDKPjkpWSZdtho
 abvZl57ghjk+PPSUaejv8IyCjJtYWhsS9ciQ8B3XXbSWjI+n64WX+Hxqboqjc22ttP
 ennHYz2Fk0PjdGRvcCJxw+lWV5D5mNtZv205GCv6lzOzACCpuUuMXBIGpDSPMvIi9E
 239Szkhk1pZQw==
From: Zorro Lang <zlang@kernel.org>
To: fstests@vger.kernel.org
Date: Wed,  5 Apr 2023 01:14:10 +0800
Message-Id: <20230404171411.699655-5-zlang@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404171411.699655-1-zlang@kernel.org>
References: <20230404171411.699655-1-zlang@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Some people contribute to someone specific fs testing mostly,
 record some of them as Reviewer. Signed-off-by: Zorro Lang <zlang@kernel.org>
 --- If someone doesn't want to be in cc list of related fstests patch, please
 reply this email, I'll remove that reviewer line. 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pjkF9-0001a8-Kw
Subject: [f2fs-dev] [PATCH 4/5] fstests/MAINTAINERS: add some specific
 reviewers
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
Cc: brauner@kernel.org, linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 ebiggers@google.com, djwong@kernel.org, amir73il@gmail.com,
 linux-unionfs@vger.kernel.org, anand.jain@oracle.com,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 fdmanana@suse.com, ocfs2-devel@oss.oracle.com, jack@suse.com,
 linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Some people contribute to someone specific fs testing mostly, record
some of them as Reviewer.

Signed-off-by: Zorro Lang <zlang@kernel.org>
---

If someone doesn't want to be in cc list of related fstests patch, please
reply this email, I'll remove that reviewer line.

Or if someone else (who contribute to fstests very much) would like to a
specific reviewer, nominate yourself to get a review.

Thanks,
Zorro

 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 620368cb..0ad12a38 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -108,6 +108,7 @@ Maintainers List
 	  or reviewer or co-maintainer can be in cc list.
 
 BTRFS
+R:	Filipe Manana <fdmanana@suse.com>
 L:	linux-btrfs@vger.kernel.org
 S:	Supported
 F:	tests/btrfs/
@@ -137,16 +138,19 @@ F:	tests/f2fs/
 F:	common/f2fs
 
 FSVERITY
+R:	Eric Biggers <ebiggers@google.com>
 L:	fsverity@lists.linux.dev
 S:	Supported
 F:	common/verity
 
 FSCRYPT
+R:	Eric Biggers <ebiggers@google.com>
 L:      linux-fscrypt@vger.kernel.org
 S:	Supported
 F:	common/encrypt
 
 FS-IDMAPPED
+R:	Christian Brauner <brauner@kernel.org>
 L:	linux-fsdevel@vger.kernel.org
 S:	Supported
 F:	src/vfs/
@@ -163,6 +167,7 @@ S:	Supported
 F:	tests/ocfs2/
 
 OVERLAYFS
+R:	Amir Goldstein <amir73il@gmail.com>
 L:	linux-unionfs@vger.kernel.org
 S:	Supported
 F:	tests/overlay
@@ -174,6 +179,7 @@ S:	Supported
 F:	tests/udf/
 
 XFS
+R:	Darrick J. Wong <djwong@kernel.org>
 L:	linux-xfs@vger.kernel.org
 S:	Supported
 F:	common/dump
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
