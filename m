Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCDF83670B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jan 2024 16:10:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rRvwZ-0003tR-Sg;
	Mon, 22 Jan 2024 15:10:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sashal@kernel.org>) id 1rRvwY-0003tJ-5R
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jan 2024 15:10:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KCca7Z5S0bbMuD1DnUi4ECgRsOhwp8OUvc3iDuJeZuI=; b=VFcOiudcDmreqPVOg8iebSV8Ra
 SwyEbnVdCKvG5nAYQw6KIeZUk6wVJXeZBXnKlrCbSdfLBHsI3Y5gj+moohZGnyqqCKe3q7Othv48z
 3IN0ldg0wDFczvVGeOaGV3QzUnvIDoPwp+V7DZIWMoL2czvZTn5tbiwcmBEeM7HjVtvg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KCca7Z5S0bbMuD1DnUi4ECgRsOhwp8OUvc3iDuJeZuI=; b=CqSXlcs/rz65QTZtYX5i9ER7KH
 fGmuVHsOWpscgRfaQ6/MTXXdkj3X8PuJDM9KuJ8GxUAd9ErcS724j6iMaah/Dy/D8tc43nr7jIois
 dDGdiN1BAIj2theHMvBMvd2/EgpSStjGFXFYBA1thXbf7QTmQBT2sp51FghRl66byv0U=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rRvwX-0003hk-BW for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jan 2024 15:10:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id BC1E8B80C82;
 Mon, 22 Jan 2024 15:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 883CDC433A6;
 Mon, 22 Jan 2024 15:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705936222;
 bh=+wKW6dOd2BKZIFOfovk64QUcGxJAwrPnaf1NJrqV4zE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NrIClBIM2laoA9kpnX+tLt0M0ofKcvO/0etxaWJ6jIV/GE8n4L9LmiHQf6a/bDyky
 bDNiZ4cBC/LFtzh+N8/4G7ZE0pJSfi3xx0XZ9XYZPw/MmQ9n5YtjFUQGZfNllhO/kY
 F94id64ohN3axgXknWAqalWF4GajkhgRZn4QaPQky0OSFXWlK1qILtixR4fC4I+B1p
 +Zl54LSq+oioioB3HHiZJgPsNDkp06f2r+arQolJI/ZlnAMP0nrdg72j1MzWrl6EGF
 jOmAAll2Yee46C6oIQidsacwCeIlnBGeAPUX8NExP29wSA1Z+aSu5F6xnoC0vxZ40a
 wVC90JKhNHfmw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon, 22 Jan 2024 10:08:13 -0500
Message-ID: <20240122150949.994249-12-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122150949.994249-1-sashal@kernel.org>
References: <20240122150949.994249-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.74
X-Spam-Score: -3.8 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Jaegeuk Kim <jaegeuk@kernel.org> [ Upstream commit
 9dad4d964291295ef48243d4e03972b85138bc9f
 ] 1. do roll forward recovery 2. update current segments pointers 3. fix
 the entire zones' write pointers 4. do checkpoint 
 Content analysis details:   (-3.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rRvwX-0003hk-BW
Subject: [f2fs-dev] [PATCH AUTOSEL 6.1 12/53] f2fs: fix write pointers on
 zoned device after roll forward
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
Cc: Sasha Levin <sashal@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Daeho Jeong <daehojeong@google.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Jaegeuk Kim <jaegeuk@kernel.org>

[ Upstream commit 9dad4d964291295ef48243d4e03972b85138bc9f ]

1. do roll forward recovery
2. update current segments pointers
3. fix the entire zones' write pointers
4. do checkpoint

Reviewed-by: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/recovery.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 4f4db465220f..53a6487f91e4 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -898,6 +898,8 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
 	if (!err && fix_curseg_write_pointer && !f2fs_readonly(sbi->sb) &&
 			f2fs_sb_has_blkzoned(sbi)) {
 		err = f2fs_fix_curseg_write_pointer(sbi);
+		if (!err)
+			err = f2fs_check_write_pointer(sbi);
 		ret = err;
 	}
 
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
