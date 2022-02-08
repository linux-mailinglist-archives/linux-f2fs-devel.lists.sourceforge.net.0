Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F2D4AE583
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Feb 2022 00:39:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nHa4v-0001TF-Id; Tue, 08 Feb 2022 23:39:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nHa4t-0001T9-Dj
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Feb 2022 23:39:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fbFx/OHa40lY77SpId7ksV4sF7m0yXTHbwXXHyuFyEo=; b=R6h5qxNiOq4iZQirYNNxCbl4v+
 xr1Z3nKx9Gyui7feDRV5OpAIoEr1CZWP6Q/cGdE0/kOlgZl78tcH9wMwxtzX9wARRerfkVbQBA0x+
 gARbGQpXDIk+qmj+tlTVLnUFt6W9Pmgx2rEBFrDaTW/+wz07Lww9NtahbU/uYlJT5Mtg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fbFx/OHa40lY77SpId7ksV4sF7m0yXTHbwXXHyuFyEo=; b=FrdaKVTcZK8sXC2rD3wB/2mYzJ
 IoIhbhMeH3KHbw4Jwruevl/F9X2Ln+9m5BsM/z7KYyhs9q+CCORRZ9bnvFlV47+CGRWjh70xOZX9N
 nmfz8JJhvSd7WKDRI8HHqtu8UuXTdv5VJZzjYxRdXEYiwzpEF80kZ6fF305Rth2uHAME=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nHa4r-00AijA-4S
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Feb 2022 23:39:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E5856B81DA0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  8 Feb 2022 23:39:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFF10C004E1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  8 Feb 2022 23:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644363549;
 bh=dB6mN7eUKQ2IzzUONg+L9W7vcsqNZLILAz05WZ2gfY4=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=oaMmQBbUAfbTf4dNfOfkaHQ0mSzINRfc64eo56jUe+1goea9GTm4VX2HdBJleHK6a
 H3WcpZWdwr0/2ATCQj/5ateWZR9U8DjwNjIacYF2x2rzZg2NwbH0GqxcAED+bSkoKH
 hO9759NwDxzFqGOdtSZwcJoHSX0lS9cBVXBGh+WaVd2jEkszdzGrdbKXiJteLZPpFI
 RQHg8WZgcPfaQ9zY5gOSG4ofO4ig7nmryqxQjEVgwdlXTZ8FvkhwpkOahsU/ScdEuS
 aDf+2HUhEX85/cgzfLCaw7w1qPw1xzZLt5uqZ2DHdVjOM3SU0RHhmr7T6sjEGXRRpv
 lrMf+/Dp9sdjA==
Date: Tue, 8 Feb 2022 15:39:08 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Message-ID: <YgL/HK2aGhFUQhtZ@google.com>
References: <20220203174458.3598593-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220203174458.3598593-1-jaegeuk@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  With this patch, "-g android" enables usr/grp/proj quota by
 default. 1) -O quota : enables usr/grp 2) -O project_quota -O extra_attr
 : enabled prj 3) -O quota -O project_quota -O extra_attr : enables
 usr/grp/proj
 4) -g android : enables usr/grp/proj 5) -g android -O pr [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nHa4r-00AijA-4S
Subject: Re: [f2fs-dev] [PATCH v2] mkfs.f2fs: set project quota by default
 for -g android
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

With this patch, "-g android" enables usr/grp/proj quota by default.

1) -O quota : enables usr/grp
2) -O project_quota -O extra_attr : enabled prj
3) -O quota -O project_quota -O extra_attr : enables usr/grp/proj
4) -g android : enables usr/grp/proj
5) -g android -O project_quota -O extra_attr : enables usr/grp/proj

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

Change log from v1:
 - enable all quotas to keep backward compatibility

 mkfs/f2fs_format_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
index 8d4dbe1a28b1..8e65139b45fb 100644
--- a/mkfs/f2fs_format_main.c
+++ b/mkfs/f2fs_format_main.c
@@ -120,6 +120,8 @@ static void add_default_options(void)
 
 		c.feature |= cpu_to_le32(F2FS_FEATURE_ENCRYPT);
 		c.feature |= cpu_to_le32(F2FS_FEATURE_QUOTA_INO);
+		c.feature |= cpu_to_le32(F2FS_FEATURE_PRJQUOTA);
+		c.feature |= cpu_to_le32(F2FS_FEATURE_EXTRA_ATTR);
 		c.feature |= cpu_to_le32(F2FS_FEATURE_VERITY);
 		break;
 	}
-- 
2.35.0.263.gb82422642f-goog




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
