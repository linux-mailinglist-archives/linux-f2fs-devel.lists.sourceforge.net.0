Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8F28CD505
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 May 2024 15:47:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sA8my-0002hd-8T;
	Thu, 23 May 2024 13:47:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sA8mx-0002hT-21
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 May 2024 13:47:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yNJ2sxjDXQ6/bHVu8tAUXTWg0Vc+w91OBSrkYSYqbPs=; b=IdH5n4ebAMdwOqj8gPMwadrt6R
 EiIaexVcoONGDf+2VJ573j+S4Luj3pcPnK76EDPOAvA8gZFTPQf1TDoS4VN8yxMPVydy13RrGhLtZ
 ZXuGFcg6PHzWRq46xSTy+hGK4xqGASoMwQPJ/I3NZiFawceXwjm2WWRmG/1rRneIf3pQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=yNJ2sxjDXQ6/bHVu8tAUXTWg0Vc+w91OBSrkYSYqbPs=; b=h
 3edV/Lq3zymc22Eh/nQiTeDclgnpgoYFPTrzGwmhqk8JHBAstg8PuoCuUnckSQ5e5zxqko6JxgYVz
 yp3SnuzJVqla2grEz+Pjuuc2btDf8GynJA3Ri/Im5k/X/qmNLkie2sSZRDxrqkNjncowPlyvG5I6r
 H2P79ZVtfb5Eq68Y=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sA8mx-0004PK-BV for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 May 2024 13:47:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7827CCE172D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 23 May 2024 13:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49D3DC3277B;
 Thu, 23 May 2024 13:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716472028;
 bh=VdbZwc5njMYI6J9i98ObUiEAJBSmwS2YWWcZ8W6dj1M=;
 h=From:To:Cc:Subject:Date:From;
 b=iWiXCH43kiuhidAjQwF8XquDI+Gj6iMrck9GIZP+7LzHb+nR8DwQOcVDoskfJ0bMA
 r7A2yQpVNJSt1p9DeklwekeiP0j/97PkXUVWFR4zvVhXsm4ntAvgX7poIGBtiBc+Mv
 ZDfRUN9U/2nGf+3hS//K7/cfAN/BsFFyAKU/Jhbkva1lJA7d81OUFbJP2HOB64mYmu
 erJIpc571HWtbXyC6LD8cI9bMNeYxomgoAuEYcFZQK7RH9TnIXTz9AlrU6d7MmBCaA
 WnKltDL6eGFAcTp9IdXKCVmacbQAvZLykg/x4czXg2BbRotU4nK9Kizcajmcm6RCRl
 qRf5NIymLj33g==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu, 23 May 2024 21:46:57 +0800
Message-Id: <20240523134657.2255695-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: echo 1 > file f2fs_io read 1 0 1 dio 4096 ./file Read 0 bytes
 total_time = 17 us, print 4096 bytes: 00000000 : ffffffd537 ffffffc957 0500
 0000 0000 0000 0000 0000 00000100 : 0000 0000 0000 0000 0000 0 [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [145.40.73.55 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sA8mx-0004PK-BV
Subject: [f2fs-dev] [PATCH] f2fs_io: fix output of do_read()
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

echo 1 > file
f2fs_io read 1 0 1 dio 4096 ./file
Read 0 bytes total_time = 17 us, print 4096 bytes:
00000000 : ffffffd537 ffffffc957 0500 0000 0000 0000 0000 0000
00000100 : 0000 0000 0000 0000 0000 0000 0000 0000
00000200 : 0000 0000 0000 0000 0000 0000 0000 0000
00000300 : 0000 0000 0000 0000 ffffffc10f 0200 0000 0000

For the case reading across EOF, it missed to copy returned
data to print_buf.

After:
f2fs_io read 1 0 1 dio 4096 ./file
pread expected: 4096, readed: 2
Read 2 bytes total_time = 177 us, print 4096 bytes:
00000000 : 310a 0000 0000 0000 0000 0000 0000 0000

Signed-off-by: Chao Yu <chao@kernel.org>
---
 tools/f2fs_io/f2fs_io.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index a7b593a..79b4d04 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -867,8 +867,15 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 	if (!do_mmap) {
 		for (i = 0; i < count; i++) {
 			ret = pread(fd, buf, buf_size, offset + buf_size * i);
-			if (ret != buf_size)
+			if (ret != buf_size) {
+				printf("pread expected: %"PRIu64", readed: %"PRIu64"\n",
+						buf_size, ret);
+				if (ret > 0) {
+					read_cnt += ret;
+					memcpy(print_buf, buf, print_bytes);
+				}
 				break;
+			}
 
 			read_cnt += ret;
 			if (i == 0)
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
