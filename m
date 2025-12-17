Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9EBCC59EB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Dec 2025 01:42:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o0OloHzbIu/3QISi1Obl6t7iCmpxgF6hiUswi5vUavY=; b=Wu4vh70esmI+sPakgH1JbK7Rzw
	qtzfhDxd/h/mLTs+t/S+aJX0JURiYKgildOiQGNYPBk0s9U/YSVHZI/eXzpm2i+NtdJtAnGqWvY5+
	teUbM4/5HeKdbnEYZLz3SvBS2f5XJ2M8JVmovxlBvKPlYwvI0TxeBSBojupi2DcX2970=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vVfcp-0004ZN-Mp;
	Wed, 17 Dec 2025 00:42:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vVfco-0004Z7-13
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Dec 2025 00:42:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=goXKEzjuAI77ZuJK0HzNEk+izIWs/PeVTXtqHfggE54=; b=ZLSofltiImjgoz4kShKNKuUuTh
 GCuphXNgJUkFc02XEm6t9M2onsY8xvDn/c2U9jLpCes8rzfdZNC9gVrhAAanxut85hYA2BZaqOxQP
 sAR4kzWkLkpxuXE+Xqu/64m4clAddBnU7oheqORCzbnvdpdZ9bSjtWx/Iiy8flhnAkxc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=goXKEzjuAI77ZuJK0HzNEk+izIWs/PeVTXtqHfggE54=; b=A5fAXNrLaES8tm5aBpqUG4AVE5
 W7z2kyNySqGunusjJBvKlh1Dn8SU7MxXk7rEfuF+8jVWveRrWhyT0c9QmNrQoCJ91R9W4A9JzGZtn
 8e+SXZoVs0Yopl0bKIV8LZmjhMyyECFF2kqiVfCIPKQNQTUROxRZyYTQ3JsYptVqrioo=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vVfco-0007ld-87 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Dec 2025 00:42:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8BD7060132
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 17 Dec 2025 00:42:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A5B4C4CEF1;
 Wed, 17 Dec 2025 00:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765932156;
 bh=YmKMZxc+U1GyTm2Zojd+a1Kqc7YSX4sAlWBdBeEhjh8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hZd5/ty1epgHOw0KcR0fsj96gs+XbCQ4DDDgLwWpq04lXDQcfcGiLPweAg0FnEXPL
 ixcUYVjDQNkUWEcDek4SMONVw4I5ePe7Ly5/MFDc8nAYDuIL6gOEc7QkY9DeEh+1JI
 0NfyD/rJuZf1CpDeIGvftkYD+hKi0HhbUOTisIKXV3xeJD9S9PWdnZ6J+eDlR0Z7kB
 FW2QEMGBeCpyBd2ZpleG9dobV+EjbnFFfVQfb4JStUXkbgstjlAtKpAfwK4TUAJUE1
 l7nPS6s3WpH+3C11AplXNRCwY2TMsOzSY2kal/2OJH768zEFVuDwuliLPvN5SMWnE2
 067ZqUYht/bdA==
Date: Wed, 17 Dec 2025 00:42:34 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <aUH8eoMdDeK7uMbj@google.com>
References: <20251212005545.3912333-1-jaegeuk@kernel.org>
 <1a169058-245a-4ce7-8f95-83dc96fd90c2@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1a169058-245a-4ce7-8f95-83dc96fd90c2@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> --- Change
 log from v1: - give mlock/io time together tools/f2fs_io/f2fs_io.c | 16
 ++++++++++++++++ 1 file changed, 16 insertions(+) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vVfco-0007ld-87
Subject: Re: [f2fs-dev] [PATCH 1/2 v2] f2fs_io: add mlock() option in the
 read test
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

 Change log from v1:
  - give mlock/io time together

 tools/f2fs_io/f2fs_io.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 4429e0b0459c..1b290bc669f8 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -938,6 +938,7 @@ static void do_write_advice(int argc, char **argv, const struct cmd_desc *cmd)
 "  dontcache: buffered IO + dontcache\n"		\
 "  dio      : direct IO\n"				\
 "  mmap     : mmap IO\n"				\
+"  mlock    : mmap + mlock\n"				\
 "  madvise  : mmap + mlock2 + madvise\n"		\
 "  fadvise  : mmap + fadvise + mlock\n"			\
 "advice can be\n"					\
@@ -956,6 +957,7 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 	u64 mlock_time_start = 0, mlock_time_end = 0;
 	int flags = 0;
 	int do_mmap = 0;
+	int do_mlock = 0;
 	int do_fadvise = 0;
 	int do_madvise = 0;
 	int do_dontcache = 0;
@@ -981,6 +983,8 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 		flags |= O_DIRECT;
 	else if (!strcmp(argv[4], "mmap"))
 		do_mmap = 1;
+	else if (!strcmp(argv[4], "mlock"))
+		do_mlock = 1;
 	else if (!strcmp(argv[4], "madvise"))
 		do_madvise = 1;
 	else if (!strcmp(argv[4], "fadvise"))
@@ -1027,6 +1031,18 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 		mlock_time_end = get_current_us();
 		read_cnt = count * buf_size;
 		memcpy(print_buf, data, print_bytes);
+	} else if (do_mlock) {
+		data = mmap(NULL, count * buf_size, PROT_READ,
+				MAP_SHARED, fd, offset);
+		if (data == MAP_FAILED)
+			die("Mmap failed");
+
+		io_time_start = mlock_time_start = get_current_us();
+		if (mlock(data, count * buf_size))
+			die_errno("mlock failed");
+		io_time_end = mlock_time_end = get_current_us();
+		read_cnt = count * buf_size;
+		memcpy(print_buf, data, print_bytes);
 	} else if (do_madvise) {
 		data = mmap(NULL, count * buf_size, PROT_READ,
 				MAP_SHARED, fd, offset);
-- 
2.52.0.305.g3fc767764a-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
