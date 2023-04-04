Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8E36D6A12
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Apr 2023 19:14:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjkF6-0002Ud-KJ;
	Tue, 04 Apr 2023 17:14:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@kernel.org>) id 1pjkF4-0002UW-U1
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 17:14:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gRijiAN/uQSE7uaX7O+Cn6IOEEDRA2THDcHrCzB3M6Y=; b=aKVgR75W5+187uUPGMQajBFz7p
 4g8emTPHpLAL5St/GxH0EFmxBIyQnrHaHhAn2Z2RcX07kOmFq/5dYkBt6dPXsRLC+l0QuZ7f4VaYU
 6Q2EqX0VGbwQnYlUyTt0weC392ZJzGkFZtgQurO+KfZk9LUs8s9iRmuRqiJ6MhIwDiWY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gRijiAN/uQSE7uaX7O+Cn6IOEEDRA2THDcHrCzB3M6Y=; b=Kf8lVesK8vA6hVRieILLz5/209
 FBiiQB6PRpnztBHEH0k39j7LMutpL45/J3jQEgmV6clfUokkdDLq+Iblv17IqklRbOB8b9k6qtVBa
 BwQb/xT9o5f+/J8EjF3TO7IBP+oWXFRflBlGtS9GLCMGt/9rGy4nmHEkHBofe1tSNE8M=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pjkF3-00F8JN-FE for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 17:14:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1A2E56204A;
 Tue,  4 Apr 2023 17:14:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F60FC4339C;
 Tue,  4 Apr 2023 17:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680628479;
 bh=YaUvSAb+y+Cjb64X7Lrm9tby/Kb+5UTjRbbEV78qtVk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AyONJpNXKaLMFKaOhSSWFqJTNcbR8KyZFi907wXZjLR8By0KvxzrxkADm26HVSJdg
 87pZbHXq117AiS7wENSNNfIIBGaAbnO09US11y0lcQ4cRw7vhTLoRx8AQsbqThN9Ti
 sAou1kJDg50Ug+NiXGtrhH9vfZiLd+zaMxfQRv/iBLxG8G70cJZ0ONrDKZEmk9+jbn
 kCzmVPLHrpa7VQ+t7BkLgv6dzA28ov1ROlx1OMrr8oRPcCylnGBRgfZOrVoatSpU46
 m8tklPFCdAHD66VUnnu6oM3EhHEURsZV4bITFuVetU4lBd7HsAjjrgjP7ohCgefa5K
 J0ZS0OzI+Bcgg==
From: Zorro Lang <zlang@kernel.org>
To: fstests@vger.kernel.org
Date: Wed,  5 Apr 2023 01:14:09 +0800
Message-Id: <20230404171411.699655-4-zlang@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404171411.699655-1-zlang@kernel.org>
References: <20230404171411.699655-1-zlang@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The fstests supports different kind of fs testing, better
 to cc specific fs mailing list for specific fs testing, to get better reviewing
 points. So record these mailing lists and files related with t [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pjkF3-00F8JN-FE
Subject: [f2fs-dev] [PATCH 3/5] fstests/MAINTAINERS: add supported mailing
 list
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

The fstests supports different kind of fs testing, better to cc
specific fs mailing list for specific fs testing, to get better
reviewing points. So record these mailing lists and files related
with them in MAINTAINERS file.

Signed-off-by: Zorro Lang <zlang@kernel.org>
---

If someone mailing list doesn't want to be in cc list of related fstests
patch, please reply this email, I'll remove that line.

Or if I missed someone mailing list, please feel free to tell me.

Thanks,
Zorro

 MAINTAINERS | 77 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 09b1a5a3..620368cb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -107,6 +107,83 @@ Maintainers List
 	  should send patch to fstests@ at least. Other relevant mailing list
 	  or reviewer or co-maintainer can be in cc list.
 
+BTRFS
+L:	linux-btrfs@vger.kernel.org
+S:	Supported
+F:	tests/btrfs/
+F:	common/btrfs
+
+CEPH
+L:	ceph-devel@vger.kernel.org
+S:	Supported
+F:	tests/ceph/
+F:	common/ceph
+
+CIFS
+L:	linux-cifs@vger.kernel.org
+S:	Supported
+F:	tests/cifs
+
+EXT4
+L:	linux-ext4@vger.kernel.org
+S:	Supported
+F:	tests/ext4/
+F:	common/ext4
+
+F2FS
+L:	linux-f2fs-devel@lists.sourceforge.net
+S:	Supported
+F:	tests/f2fs/
+F:	common/f2fs
+
+FSVERITY
+L:	fsverity@lists.linux.dev
+S:	Supported
+F:	common/verity
+
+FSCRYPT
+L:      linux-fscrypt@vger.kernel.org
+S:	Supported
+F:	common/encrypt
+
+FS-IDMAPPED
+L:	linux-fsdevel@vger.kernel.org
+S:	Supported
+F:	src/vfs/
+
+NFS
+L:	linux-nfs@vger.kernel.org
+S:	Supported
+F:	tests/nfs/
+F:	common/nfs
+
+OCFS2
+L:	ocfs2-devel@oss.oracle.com
+S:	Supported
+F:	tests/ocfs2/
+
+OVERLAYFS
+L:	linux-unionfs@vger.kernel.org
+S:	Supported
+F:	tests/overlay
+F:	common/overlay
+
+UDF
+R:	Jan Kara <jack@suse.com>
+S:	Supported
+F:	tests/udf/
+
+XFS
+L:	linux-xfs@vger.kernel.org
+S:	Supported
+F:	common/dump
+F:	common/fuzzy
+F:	common/inject
+F:	common/populate
+F:	common/repair
+F:	common/xfs
+F:	tests/xfs/
+
 ALL
 M:	Zorro Lang <zlang@kernel.org>
 L:	fstests@vger.kernel.org
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
