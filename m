Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0F14060DA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Sep 2021 02:20:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mOUHl-0004wy-02; Fri, 10 Sep 2021 00:20:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <sashal@kernel.org>) id 1mOUHi-0004w9-Ab
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Sep 2021 00:20:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OJYDyZ1hzfmXhAZp93A5YDojnyPDIO5cOLVtrfINsw0=; b=b/uwN1yaDi8nrAlXOfNFBYWkhH
 VEydZMcSc8Tl01orPNQHbkISc909pZkcjeRf57zum4Dj/G8sbrqVisAiBJRz6v1Buh9KUgH/oDXIy
 EdJzfe0ECcM0/PMk/n0otG1nng6QK0WMe77vatZ30Nliozi+IC3mZFT4ajYFivgFAHbk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OJYDyZ1hzfmXhAZp93A5YDojnyPDIO5cOLVtrfINsw0=; b=Vfmycpnnookmegi/KSCFBVgRFa
 EE2BPZkdST61+VppttDX9w2Qs1fbXSpRLsVj5U4w8a+DtQk05PvvY8Ce07KGtHXrym1ycNER+INnk
 Q2o58UoiqVTAPqYrhuhvNtrrGlTvWPmCVanHI6+LPrjuMWhRqOECkuXEOalozf4wf02Q=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mOUHh-005S6e-Oy
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Sep 2021 00:20:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AE6E1610E9;
 Fri, 10 Sep 2021 00:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631233244;
 bh=j8xIfVQxIJHVKyA4PRdQYc8Je+WKGHJdfQfQz8WrKRU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UYz4Ibh5wyKPCy4ptkbHUGjW0JTf9goLG4E8sMceFhLiQaVIbzvwRjFEIHD6FA1aD
 XjNbPI9mRoF0FvOYpNTR7E+AohA27ogZfChAi551DeRMDTdWEelYJwlGwc2BhqzCj+
 ejLRsxE2qc3qL6HQfecayAFprJAh1/slABVuuiTITxwOWwPItyFHX/K5U0HJltmsdK
 HglVEh4wLuYgbhSDHfYYpGPjPBPjhgkB9wncQydHCGWv/GIYdBCmQwaXkwaF3/hCVs
 jVu4adgffqtJr/YEVzBeeU0LhQklT44eFHltqIRAbZWzCKJqfCvEJBlrLy8zFL2zIn
 3HmArm0MSeL/g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu,  9 Sep 2021 20:19:46 -0400
Message-Id: <20210910002028.175174-11-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210910002028.175174-1-sashal@kernel.org>
References: <20210910002028.175174-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chao Yu <chao@kernel.org> [ Upstream commit
 2787991516468bfafafb9bf2b45a848e6b202e7c ] [1]
 https://www.mail-archive.com/linux-f2fs-devel@lists.sourceforge.net/msg15126.html
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: mail-archive.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mOUHh-005S6e-Oy
Subject: [f2fs-dev] [PATCH AUTOSEL 5.10 11/53] f2fs: fix to force keeping
 write barrier for strict fsync mode
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
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <chao@kernel.org>

[ Upstream commit 2787991516468bfafafb9bf2b45a848e6b202e7c ]

[1] https://www.mail-archive.com/linux-f2fs-devel@lists.sourceforge.net/msg15126.html

As [1] reported, if lower device doesn't support write barrier, in below
case:

- write page #0; persist
- overwrite page #0
- fsync
 - write data page #0 OPU into device's cache
 - write inode page into device's cache
 - issue flush

If SPO is triggered during flush command, inode page can be persisted
before data page #0, so that after recovery, inode page can be recovered
with new physical block address of data page #0, however there may
contains dummy data in new physical block address.

Then what user will see is: after overwrite & fsync + SPO, old data in
file was corrupted, if any user do care about such case, we can suggest
user to use STRICT fsync mode, in this mode, we will force to use atomic
write sematics to keep write order in between data/node and last node,
so that it avoids potential data corruption during fsync().

Signed-off-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/file.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 5c74b2997197..d712c9090808 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -299,6 +299,18 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
 				f2fs_exist_written_data(sbi, ino, UPDATE_INO))
 			goto flush_out;
 		goto out;
+	} else {
+		/*
+		 * for OPU case, during fsync(), node can be persisted before
+		 * data when lower device doesn't support write barrier, result
+		 * in data corruption after SPO.
+		 * So for strict fsync mode, force to use atomic write sematics
+		 * to keep write order in between data/node and last node to
+		 * avoid potential data corruption.
+		 */
+		if (F2FS_OPTION(sbi).fsync_mode ==
+				FSYNC_MODE_STRICT && !atomic)
+			atomic = true;
 	}
 go_write:
 	/*
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
