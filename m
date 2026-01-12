Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C64AD147D6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jan 2026 18:47:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KwukkDlMZKugO9Zr31SDeRzMYrDB0v+XsuroqVyv68M=; b=I9YZ1mKNNf6lAmT+gF5fwDKHDr
	4zZ2avz8JhFrUPKNdK0E9Ja8ACoZ+APjPC8N64bNlsFfplwFWy7ckY69bcfkuDxQV1rfGoVHkfMf7
	vaEcxmCwu+2PUvbv5h1CyiMt3u7Jecdbjur1hP4uOvq4Dr1VA1SqMnu09hVFfsL7DG+c=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfM0a-0003pM-QN;
	Mon, 12 Jan 2026 17:47:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1vfM0Z-0003p5-W2
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jan 2026 17:47:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7GHIHB8aHKez9zx61ZdGuZjH99tEu03Cqep3O5HiXow=; b=CFLc+2895MbH1Xn1mF9JlboCXf
 qnTIUGPcswPu0yMs3wRWqsicFLe5KvTracNs0C3TpJjW0TxPzJfcyTEROb/Pq/V+MYLV90hqj1FxG
 Z3Sq2INc24MjSOwSk2cvLKjWS+svSk9FFLVYCVGC4QIBaYWg5qsKevWeLQ4hx5RTmDlk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7GHIHB8aHKez9zx61ZdGuZjH99tEu03Cqep3O5HiXow=; b=bSv7xq0qnfUDBjcZZAZU/VLvKX
 7UsgOGQg29FuDZfqB3qRmEKcDdt9Do5xhwX/Q8ZSAi8ShVL1Pmp2xscJl7K0yrDgDNTYy5aeraD3s
 UTek/phR2W65qN7JFi7SGFuDt7f7/3MHNyQLqOVtKXT84EXylIqwMWcCB62Ob+hInXYY=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vfM0Z-0008UA-Ai for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jan 2026 17:47:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 020FF4435D;
 Mon, 12 Jan 2026 17:47:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94124C19422;
 Mon, 12 Jan 2026 17:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768240024;
 bh=izMvHmk+mBtllXLOnrvTWmwXYyIaajWUeC93SIFXyqo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gKIO+8L8MC8xU2/UR1aq83UYJtQWRu7PO1Rrw1c77thHDCjIZgpgw5mGUP9N/Z8uB
 I/y7Bx/MbBdAzlVnW3qIyEJ1F8Beq9vY4qDPP5iOfNSde7/KW05S/++xEP3zs054BS
 TZodd7SzI7fMGzf9TKb2z+2H1V74NIPIlxTJglopNLBVUD+1Uz+Z863onXYCb09bz4
 m6b3RUmIDps5lnqznIj9THJSiy52/DEyj7r6Zo/k7hVXuLQq3KxE5UfenLNfyvnMa+
 ThSt6xSPqA67l1Zb0NmLwDmMiUZTWIVMqCm+kIEQJeme/fy6urooILl1IC1bdWPLB/
 IqSmpUsg8GD1A==
To: vira,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>
Date: Mon, 12 Jan 2026 12:46:24 -0500
Message-ID: <20260112174629.3729358-12-cel@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112174629.3729358-1-cel@kernel.org>
References: <20260112174629.3729358-1-cel@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chuck Lever <chuck.lever@oracle.com> NFS and other
 remote
 filesystem protocols need to determine whether a local filesystem performs
 case-insensitive lookups so they can provide correct semantics to clients.
 Without this information, f2f [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vfM0Z-0008UA-Ai
Subject: [f2fs-dev] [PATCH v3 11/16] f2fs: Add case sensitivity reporting to
 fileattr_get
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
From: Chuck Lever via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chuck Lever <cel@kernel.org>
Cc: pc@manguebit.org, yuezhang.mo@sony.com, cem@kernel.org,
 almaz.alexandrovich@paragon-software.com, adilger.kernel@dilger.ca,
 linux-cifs@vger.kernel.org, sfrench@samba.org, slava@dubeyko.com,
 linux-ext4@vger.kernel.org, linkinjeon@kernel.org, sprasad@microsoft.com,
 frank.li@vivo.com, ronniesahlberg@gmail.com, glaubitz@physik.fu-berlin.de,
 jaegeuk@kernel.org, hirofumi@mail.parknet.co.jp, linux-nfs@vger.kernel.org,
 tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, senozhatsky@chromium.org,
 Chuck Lever <chuck.lever@oracle.com>, hansg@kernel.org, anna@kernel.org,
 linux-fsdevel@vger.kernel.org, sj1557.seo@samsung.com, trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chuck Lever <chuck.lever@oracle.com>

NFS and other remote filesystem protocols need to determine
whether a local filesystem performs case-insensitive lookups
so they can provide correct semantics to clients. Without
this information, f2fs exports cannot properly advertise
their filename case behavior.

Report f2fs case sensitivity behavior via the file_kattr
boolean fields. Like ext4, f2fs supports per-directory case
folding via the casefold flag (IS_CASEFOLDED). Files are
always case-preserving.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 fs/f2fs/file.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index d7047ca6b98d..e73e6d21d36b 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3439,6 +3439,14 @@ int f2fs_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 	if (f2fs_sb_has_project_quota(F2FS_I_SB(inode)))
 		fa->fsx_projid = from_kprojid(&init_user_ns, fi->i_projid);
 
+	/*
+	 * f2fs always preserves case. If this inode is a casefolded
+	 * directory, report case-insensitive; otherwise report
+	 * case-sensitive (standard POSIX behavior).
+	 */
+	fa->case_insensitive = IS_CASEFOLDED(inode);
+	fa->case_preserving = true;
+
 	return 0;
 }
 
-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
