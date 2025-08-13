Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3B9B24593
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Aug 2025 11:38:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5tfgIoBl2QStLWnFFPQjWtdyWkRoG8hXXsqLSpX2mh0=; b=BkXGMnynQmljrh5bcDIOybvrZ2
	9dEqamGfHsLSUkw/9p8CMdxz4IihwMeEGZoeEe01R+Y7HhQVpiym/mk6n1XEg1nKbKHZHZro+fw9Z
	YEETjNoXvm5YC2//I2gHijwODxC9rVQASxYqiTBeDFfd85fiy8mwgLu+I3RqPDINuybY=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1um7wX-0007ot-NG;
	Wed, 13 Aug 2025 09:38:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao@126.com>) id 1um7wW-0007om-Qo
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Aug 2025 09:38:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k4YO1ZwaezvR2OpFZA4zYeNsSYl/I40wlm4O2J62W+0=; b=jhGy0FW07OsR89Uqv5dkHdrAn7
 vqhXi5FahqT0vja6jpQSAxejnQ7QC2mTXzYuzfq05GWpEzY4Do6810pMySDs99sOnysGvrgGrCVyM
 M2795GBVglWHjTW/DnvwFJKE0zgLZyNbJtH+f5AAvt5X3Rv8onYIGYVE5Sc+H3ADk7iY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=k4YO1ZwaezvR2OpFZA4zYeNsSYl/I40wlm4O2J62W+0=; b=PEkM/Sra/2kZOhNIFRhG5x//Wp
 +bmFJ9cjbIZFS335LIcEbMkmaFYJboYODO2Fuq9yGqdqLiEpHjyNhK+N1sdPh9wgNwIM43jF7dOB6
 Tabot6jffW9nKKx/9d+Fynn1v3OaEKPyNcjBny6CxIgNYPuOaK0lk8dkJ9uZLF3lRrfI=;
Received: from m16.mail.126.com ([117.135.210.8])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1um7wW-0004Uo-4h for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Aug 2025 09:38:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=k4
 YO1ZwaezvR2OpFZA4zYeNsSYl/I40wlm4O2J62W+0=; b=C7R/jBzW5ucRXodPdw
 kKKx0JiTalFwYKEx7G9TlnImZP9gn/NSk/7wWzqohy0/9AO88kK61LuceSn89eDW
 ERO8w/kClt88OiI1/V04qf67iTSlJSsrEO9CUpvQUZhfYGDkHU6htmR7yQHWAtrD
 gpRcqTkCF/W3KF7vHFD67Nv+s=
Received: from YLLaptop.. (unknown [])
 by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id
 _____wD3tyv8XJxo_MzyBQ--.54250S5; 
 Wed, 13 Aug 2025 17:38:23 +0800 (CST)
From: Nanzhe Zhao <nzzhao@126.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org
Date: Wed, 13 Aug 2025 17:37:49 +0800
Message-Id: <20250813093755.47599-4-nzzhao@126.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250813093755.47599-1-nzzhao@126.com>
References: <20250813093755.47599-1-nzzhao@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3tyv8XJxo_MzyBQ--.54250S5
X-Coremail-Antispam: 1Uf129KBjvJXoWrtr1kCFW7GF4rXw48AF43Jrb_yoW8Jr4Dpr
 WkKr4DKr48uw47WF13WF4UZr1S9FyFga1UuayxCr1xAF1UJwn5Kw1rtw1j9FW3JryDZF1S
 qw1FvF1rWF98ZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UYYLPUUUUU=
X-Originating-IP: [58.240.165.118]
X-CM-SenderInfo: xq22xtbr6rjloofrz/1tbiFhuoz2icTc3iBgADs5
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Since `folio_detach_f2fs_private` can handle all case for
 a folio to free it's private date ,
 intergrate it as a subtitute for `folio_detach_private`.
 Signed-off-by: Nanzhe Zhao --- fs/f2fs/data.c | 13 +++++++++++++ 1 file
 changed, 13 insertions(+) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao(at)126.com]
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [117.135.210.8 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1um7wW-0004Uo-4h
Subject: [f2fs-dev] [RFC PATCH 3/9] f2fs: Using `folio_detach_f2fs_private`
 in invalidate and release folio
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
Cc: Nanzhe Zhao <nzzhao@126.com>, Barry Song <21cnbao@gmail.com>,
 Matthew Wilcox <willy@infradead.org>, Yi Zhang <yi.zhang@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Since `folio_detach_f2fs_private` can handle all case for a
folio to free it's private date , intergrate it as a subtitute
for `folio_detach_private`.

Signed-off-by: Nanzhe Zhao <nzzhao@126.com>
---
 fs/f2fs/data.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index ed1174430827..415f51602492 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3748,7 +3748,16 @@ void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t length)
 			f2fs_remove_dirty_inode(inode);
 		}
 	}
+#ifdef CONFIG_F2FS_IOMAP_FOLIO_STATE
+	/* Same to iomap_invalidate_folio*/
+	if (offset == 0 && length == folio_size(folio)) {
+		WARN_ON_ONCE(folio_test_writeback(folio));
+		folio_cancel_dirty(folio);
+		folio_detach_f2fs_private(folio);
+	}
+#else
 	folio_detach_private(folio);
+#endif
 }
 
 bool f2fs_release_folio(struct folio *folio, gfp_t wait)
@@ -3757,7 +3766,11 @@ bool f2fs_release_folio(struct folio *folio, gfp_t wait)
 	if (folio_test_dirty(folio))
 		return false;
 
+#ifdef CONFIG_F2FS_IOMAP_FOLIO_STATE
+	folio_detach_f2fs_private(folio);
+#else
 	folio_detach_private(folio);
+#endif
 	return true;
 }
 
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
