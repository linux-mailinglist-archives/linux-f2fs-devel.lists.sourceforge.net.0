Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0011BD5B8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Apr 2020 09:21:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nFT6MAzUmHSHG0odiVdcRegFPRfF3bGQgU81nJhZ3l0=; b=EWTF6ijonyoK20pGP5Tmq9n92
	9jvNCYD5aBBgN8BhQK2zuXTmdYs4jkHlNl0v6eNGtxd2lTuIpYaHSzJWz5Vlomb4QjVgNTSx0i9Is
	Hl/OGwZLIyMtfG+kDd+4NhfPYHsjPhXKtui7mX5Nfnx74jCKXNUhzxjhixClAOBiNICe0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jTh2W-0002lT-Ie; Wed, 29 Apr 2020 07:21:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3BSupXgYKAPoucv0cviqqing.eqo@flex--satyat.bounces.google.com>)
 id 1jTh2S-0002kh-O6
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 29 Apr 2020 07:21:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dcBMNhJyVF3JG7u2k+hpIfX5J5/+YNOMhft7o2B+Ju4=; b=X5oBqvef1B5V+4Wi+WyJ+p/HJ
 alpYRtH2NEB/lY6ilDD8JGiK8ZVKq/gs4lH344j7t3pWs8qH/HCDnoP4qlpoD/J+t8xdS2cBUbSol
 TLKbR/VedyTVRMWreLPoWJG5pbXfSUhUYRbVpS1tm9OVG32xe782sCoLhRCNQ9jGzt0lU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dcBMNhJyVF3JG7u2k+hpIfX5J5/+YNOMhft7o2B+Ju4=; b=CyAKK0TPZlZoip2MhsWlaJKA+n
 7hfqxdUo7Bnk58k+1nRsQjZbk7S4aCHs4bvEl5syWHjz7aZ6seel8ufcvN6CVLTkEGOffZCaH0suh
 PgAIF5trhM6C5Yl7Wi+xC0tNtslMK+LStiKtb99fJl5j8RBLxreLIkX3qzrX5yWX4GeM=;
Received: from mail-qv1-f73.google.com ([209.85.219.73])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jTh2R-00FwNB-Im
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 29 Apr 2020 07:21:48 +0000
Received: by mail-qv1-f73.google.com with SMTP id o18so1638702qvu.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 29 Apr 2020 00:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=dcBMNhJyVF3JG7u2k+hpIfX5J5/+YNOMhft7o2B+Ju4=;
 b=dfrGTfJjx+xsOcKHeejLK4oMt9g5AcqcRK5/UgBb14pn/JbWFb1vMwUyV+V1slwjtj
 2nFObH6Yei1hbvG9BW2Ll9vbpOcTaaQWiATCvTV1B/VYCTXeUPCW+hLpf049cVmCdboI
 rHS6z3TM/IJRit3QH4E1ap9PyEFxHqulYCq7YE0up+baJBD6tgxW4NrGKOf9TJ+F3+Km
 QcXzGA2M5GB6W6B2ghC6wC+zS04Bwtty77EltXC43D73oIukh3a67IIcPcLbMepNDXfr
 2Xrzb2Hp+Ov7eBjxW/m2vgPs2VZpLO9whdG848N9ksL78T4b8vthHOeR4v9S1c4cj0LF
 qOJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=dcBMNhJyVF3JG7u2k+hpIfX5J5/+YNOMhft7o2B+Ju4=;
 b=jJ66WaIBASPJ2gxk6h4uh4pEzFl8fq9SKHVbK8dTmVekwaDxMdONz15luJRJ/gCm+P
 BCfmzcnuJ/qXmvY3aP4C0fYNUHxZpQSf44uipqvyIKYEKEBxbD55DAyZWTli0mwshm1W
 kAqegV64tqcjYOffzoBCyGv91jS2nf/E0gmOTqAnBp4hnXcafe299ebT9k1CSbtvTvxY
 P3OvkDrreYVYYBv/AGhqVhcO56S/RjsFl24EVqYUp6DwJMHyU2BynFaw80dc/xrbaNDu
 WWj7WIkTZsOeUO1ycwth8jqUt2QMAqixdOq1AcWPBO6Wn3vjPRUvqVvoiqzSc83S3VVj
 b4fw==
X-Gm-Message-State: AGi0PuZY9OCxPl9ViBjigyTriXcH9YlsvY6KaFZPzsA5neByZ9LVotfK
 nM5TQIPQKelI8IqidRDdktIrTqG0bHU=
X-Google-Smtp-Source: APiQypJz89cxZWdYzpcW5zsQCLnnJh9hiKeWJOQg2VT8hOJvTQfkY3cXLSwBZXj2P4l7aalg3AeJ9YcyX18=
X-Received: by 2002:ad4:55e7:: with SMTP id bu7mr32187009qvb.88.1588144901506; 
 Wed, 29 Apr 2020 00:21:41 -0700 (PDT)
Date: Wed, 29 Apr 2020 07:21:18 +0000
In-Reply-To: <20200429072121.50094-1-satyat@google.com>
Message-Id: <20200429072121.50094-10-satyat@google.com>
Mime-Version: 1.0
References: <20200429072121.50094-1-satyat@google.com>
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
To: linux-block@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.73 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.73 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1jTh2R-00FwNB-Im
Subject: [f2fs-dev] [PATCH v11 09/12] fs: introduce SB_INLINECRYPT
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
From: Satya Tangirala via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Satya Tangirala <satyat@google.com>
Cc: Kuohong Wang <kuohong.wang@mediatek.com>,
 Satya Tangirala <satyat@google.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Kim Boojin <boojin.kim@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Introduce SB_INLINECRYPT, which is set by filesystems that wish to use
blk-crypto for file content en/decryption. This flag maps to the
'-o inlinecrypt' mount option which multiple filesystems will implement,
and code in fs/crypto/ needs to be able to check for this mount option
in a filesystem-independent way.

Signed-off-by: Satya Tangirala <satyat@google.com>
---
 fs/proc_namespace.c | 1 +
 include/linux/fs.h  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/fs/proc_namespace.c b/fs/proc_namespace.c
index 273ee82d8aa97..8bf195d3bda69 100644
--- a/fs/proc_namespace.c
+++ b/fs/proc_namespace.c
@@ -49,6 +49,7 @@ static int show_sb_opts(struct seq_file *m, struct super_block *sb)
 		{ SB_DIRSYNC, ",dirsync" },
 		{ SB_MANDLOCK, ",mand" },
 		{ SB_LAZYTIME, ",lazytime" },
+		{ SB_INLINECRYPT, ",inlinecrypt" },
 		{ 0, NULL }
 	};
 	const struct proc_fs_info *fs_infop;
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 4f6f59b4f22a8..38fc6c8d4f45b 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1376,6 +1376,7 @@ extern int send_sigurg(struct fown_struct *fown);
 #define SB_NODIRATIME	2048	/* Do not update directory access times */
 #define SB_SILENT	32768
 #define SB_POSIXACL	(1<<16)	/* VFS does not apply the umask */
+#define SB_INLINECRYPT	(1<<17)	/* Use blk-crypto for encrypted files */
 #define SB_KERNMOUNT	(1<<22) /* this is a kern_mount call */
 #define SB_I_VERSION	(1<<23) /* Update inode I_version field */
 #define SB_LAZYTIME	(1<<25) /* Update the on-disk [acm]times lazily */
-- 
2.26.2.303.gf8c07b1a785-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
