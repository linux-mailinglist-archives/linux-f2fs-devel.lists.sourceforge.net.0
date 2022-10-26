Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 16ACB60E624
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Oct 2022 19:06:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1onjrM-0001Ud-Kf;
	Wed, 26 Oct 2022 17:06:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1onjr6-0001UK-Q8
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Oct 2022 17:06:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zo9T+OWlkmlVfXk17GowmVEUsTV41xwfyen1wXkvoJA=; b=WvpTpXRDGtKPq4FeF2pGaTWToi
 HsWd8KGJvvP7QHOihz3M7Vlc2qjvmCS5IvKzQJ+kztWC0SZDo60W6LWE4LtxPvsx4/8rbPVsZetwN
 jD5Cn8BdVQ04lgTqZHv73pJhb1Xw56kmXVzqiQPWdQ1MbT3i3GRxUS3vKyq10lkuIro4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zo9T+OWlkmlVfXk17GowmVEUsTV41xwfyen1wXkvoJA=; b=mBGfWqh4GqXurb7P8h39whTRKH
 UGN/8S21Xo9dhhe1XbfSXf62Rh1gph0beL0ylmA2nv4hUk3CDdrMY/sk5ddyr6LCEv6thH09l7HGd
 ObCpNAJY5+XUYuJrjotSx4ROgW6AUWo4RlpySwBEVyNlluO/IEpxRes1qCdOiefquJfo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1onjr6-00035t-7w for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Oct 2022 17:06:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D5AAC61FE3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 26 Oct 2022 17:06:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32BD7C433C1;
 Wed, 26 Oct 2022 17:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666803970;
 bh=YZ9Ddar4PAfk9R3rj0CvKnajhWqM9BJYuumKNjXPKZs=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=AtTvO1XFSdu9F3VoDHNMw0JKNgkRurqsJ6Z+lfYSaPeKZIofuj9fYBHV9jEcW/+ud
 RPhez5AOe2fILRmbAYwWmE38KCMqXKK9zl77DYTW66X/6IAuDnGIQOoK20vFv99m7Q
 7y00cEQqrXafhAPHkAW5bwblPQmiCKrl9pcZAf4w1FQgLbtELvzAQW6+HjEsSf2Ggf
 7jxkt8ITQMWGSCMXQMWNnfabh2kJvNp9Ji4CbciKYBmjqUrPHYp4fPZJ2YyTp7AqCb
 8X55mY/ZcZZYxm2zGbF2gpMoVE6brEZEdtUpY73/OK5lDt2hWGZhS4jTRUV4o0TbTI
 8mQEbJJX0/Q8w==
Date: Wed, 26 Oct 2022 10:06:08 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <Y1lpAJiPCMSXf1d5@google.com>
References: <20221024233634.803695-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221024233634.803695-1-jaegeuk@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The below commit disallows to set compression on empty
 created
 file which has a inline_data. Let's fix it. Fixes: 7165841d578e ("f2fs: fix
 to check inline_data during compressed inode conversion") Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- Change log from v1: - add returning an
 error Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1onjr6-00035t-7w
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: allow to set compression for
 inlined file
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The below commit disallows to set compression on empty created file which
has a inline_data. Let's fix it.

Fixes: 7165841d578e ("f2fs: fix to check inline_data during compressed inode conversion")
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
  Change log from v1:
   - add returning an error

 fs/f2fs/file.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 1c4004c9245f..8cd52b0965b1 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1915,6 +1915,10 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
 			if (!f2fs_disable_compressed_file(inode))
 				return -EINVAL;
 		} else {
+			/* try to convert inline_data to support compression */
+			int err = f2fs_convert_inline_inode(inode);
+			if (err)
+				return err;
 			if (!f2fs_may_compress(inode))
 				return -EINVAL;
 			if (S_ISREG(inode->i_mode) && F2FS_HAS_BLOCKS(inode))
-- 
2.38.0.135.g90850a2211-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
