Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2684040BC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Sep 2021 23:51:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mO5Tp-0003xt-13; Wed, 08 Sep 2021 21:51:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1mO5To-0003xk-7y
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Sep 2021 21:51:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SA3rrBucMbT7/kuMDa6WC5Pa5Oguu3eq7KjQI+1xXq0=; b=djQ3GRuAeqGx4VznI2g0DItUED
 Jf96nif/+ix7lMC0ZUPEdET8075fiMWgzlsvtjP6datyjQbCz+zvU0C1TQvYA6HisCeFtRKPlR2Z6
 /TQFhTQpok6Pg9GztoQeANjpzYKuzkZ3Mdn3mVssHmG+PGa3+LHF/G3IISWetHpVMSkk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SA3rrBucMbT7/kuMDa6WC5Pa5Oguu3eq7KjQI+1xXq0=; b=INMWdBE0SdaZRRGwpkD6i+0qIn
 IHPse+Iai4fGcWg6Lyv368YE8bXIMJpeutJ79dyWWfpGF2fUrH3CwDMo7YQQePeXrvMEk7Cs4ISIe
 7QQERhP+J3f0q5/OAAvx0hBpmBoGmNdsAXNXWFx60ODB0b3yCfWAAWxOSaCZFJg41VX4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mO5Tm-003uEG-Qi
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Sep 2021 21:51:40 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B4BA60FDA;
 Wed,  8 Sep 2021 21:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631137889;
 bh=i6jyH8PvgB9yhUYtCQiIMlEe2F7QGBiOJVd7oI0isaQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uc0ABPV3twDuxLbMd8GxOBFitN/d4dzY/uDlYPFrSwJ2ssdr1If877Acir+VjZZ8n
 Nt/1rGsencho7jBMorqXtpxbbAGOew+veyR+teonjCszMDWx75NRw2lv/M/1JDvZgE
 p6ecHZl1/g/3/8zg5mkWJqIhBqONxZnc+NctmDqqVS45hJ+/JP9bsKIhSTIVU4hLJT
 mC6a5VpUhXm37nyOBu54PPLjy8QaT9GOey4LjQfuAp8Nz0dM8f7Qgw9gHni6eqO2Hr
 br4oThTq/jK3hdSY3kuxtu/Qxx8lyhEc545uStdAaEsUArmfAqD5pOq6M2Ok1P+Rq6
 Y/EuKsKzzo1Ug==
From: Eric Biggers <ebiggers@kernel.org>
To: stable@vger.kernel.org
Date: Wed,  8 Sep 2021 14:50:32 -0700
Message-Id: <20210908215033.1122580-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
In-Reply-To: <20210908215033.1122580-1-ebiggers@kernel.org>
References: <20210908215033.1122580-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -3.4 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> commit
 461b43a8f92e68e96c4424b31e15f2b35f1bbfa9
 upstream. The stat() family of syscalls report the wrong size for encrypted
 symlinks, which has caused breakage in several userspace programs. 
 Content analysis details:   (-3.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mO5Tm-003uEG-Qi
Subject: [f2fs-dev] [PATCH 3/4] f2fs: report correct st_size for encrypted
 symlinks
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

From: Eric Biggers <ebiggers@google.com>

commit 461b43a8f92e68e96c4424b31e15f2b35f1bbfa9 upstream.

The stat() family of syscalls report the wrong size for encrypted
symlinks, which has caused breakage in several userspace programs.

Fix this by calling fscrypt_symlink_getattr() after f2fs_getattr() for
encrypted symlinks.  This function computes the correct size by reading
and decrypting the symlink target (if it's not already cached).

For more details, see the commit which added fscrypt_symlink_getattr().

Fixes: cbaf042a3cc6 ("f2fs crypto: add symlink encryption")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/20210702065350.209646-4-ebiggers@kernel.org
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/namei.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index e20a0f9e6845..edc80855974a 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -1219,9 +1219,18 @@ static const char *f2fs_encrypted_get_link(struct dentry *dentry,
 	return target;
 }
 
+static int f2fs_encrypted_symlink_getattr(const struct path *path,
+					  struct kstat *stat, u32 request_mask,
+					  unsigned int query_flags)
+{
+	f2fs_getattr(path, stat, request_mask, query_flags);
+
+	return fscrypt_symlink_getattr(path, stat);
+}
+
 const struct inode_operations f2fs_encrypted_symlink_inode_operations = {
 	.get_link       = f2fs_encrypted_get_link,
-	.getattr	= f2fs_getattr,
+	.getattr	= f2fs_encrypted_symlink_getattr,
 	.setattr	= f2fs_setattr,
 #ifdef CONFIG_F2FS_FS_XATTR
 	.listxattr	= f2fs_listxattr,
-- 
2.33.0.153.gba50c8fa24-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
