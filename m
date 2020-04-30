Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD301BF799
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Apr 2020 14:00:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nFT6MAzUmHSHG0odiVdcRegFPRfF3bGQgU81nJhZ3l0=; b=hXGxp8hcKtYkirzR1b/8eeGLi
	R1WcAa6S2/CVDxz+KmJVyfhRglb1sZWBLk1QNqKdfH0SEMWyxxUeydcWTfX6LTM1jFUZ7yq9o1oxq
	m02iAj0sZxNzEdTI4daxRtoSV65BMSy1nVeFCuVQRnvLVnr8rdsuDFKJT3xS5WlRZiAJ0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jU7re-0000T5-Hb; Thu, 30 Apr 2020 12:00:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3z72qXgYKAPAkSlqSlYggYdW.Uge@flex--satyat.bounces.google.com>)
 id 1jU7rb-0000SY-OD
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Apr 2020 12:00:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dcBMNhJyVF3JG7u2k+hpIfX5J5/+YNOMhft7o2B+Ju4=; b=OcgarPmLUxfiPVkXeMHqGg51W
 WcPONuD740UDZvbSXEfI/7Yng+m1Ij9WjamPUa6b71WMMGGb7Yqb6n90ANLyqGBdXBufBMuLSZf55
 DW5i0Yo61l9OLg7vxPINlBd7aN356BaGx0GNxUmgJykmYkX5IVZ8GS5VRDi0d2bCj+EaI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dcBMNhJyVF3JG7u2k+hpIfX5J5/+YNOMhft7o2B+Ju4=; b=S5yL86thHagQe+u1Y+gllWDByk
 jwNXW/vOqzopEUn84pbuL1tDs1Fss3lNCx0/3jydbH+dH3Wsv109IjNkws/mrGQPgy+tiUF1X5myE
 O9BGhL/kjWo93+2InSAFhfEvmyCvKw61wZxOmw9EAmA05VhQmCsIH19bfss7LpG72C54=;
Received: from mail-qv1-f74.google.com ([209.85.219.74])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jU7ra-005C4D-Av
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Apr 2020 12:00:23 +0000
Received: by mail-qv1-f74.google.com with SMTP id fe18so6136985qvb.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 30 Apr 2020 05:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=dcBMNhJyVF3JG7u2k+hpIfX5J5/+YNOMhft7o2B+Ju4=;
 b=WVjua0boMZFfyXRxNHxXtkkQlvtsd9hMr76JSeSRnGAS4i4rb0v5hyP/xpU/t08yAU
 8iFqQJRhyAkwJFM1oK1XZBTqXHm3CqsdLruIVMn/pVnKPy3fC4DShhJRinGldvR/S/PE
 BRJ35yKgDNYU78xLeadViChpObrcGpoomH0GOf1yWskNC6xGjTXCQ70zRp3w8mJsEov1
 wnopsVuB0htL7AZ3eqUvciTbLOa1LCZTKOiayOWzgpDf/NefzgdtHrk8kZ6h2I0f2Ln0
 gH8rvRj4IA4NAJmjknAgox3uK+dYnH04ADDO1Fq1XchcZcytltv69jWbnlNIl/trv1Tn
 lHrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=dcBMNhJyVF3JG7u2k+hpIfX5J5/+YNOMhft7o2B+Ju4=;
 b=Zi+cD0/cPRMUJh0UYDFn+J/SeTD588EHQVlnl43wLwv1BjwoNWMcxO0OMTCsvIiPSC
 tekXrGhVc278MPquvmR+IElBEpj7tP9wr1TBi9YLPp43TBApBZNBRdIcaGACHQsOE65N
 GY5z1s9Bkc13MDRt7Wj0xnQ2ifwt42sKbPDuUTVO/oVc3DpbBsW7PMJzZTJeb/YTbTve
 x3lnWkZzZk2PeJft5MLf5HxED+eopw5vOYrrKsWfmlR+pPmjiGJnnkoRzGvjx2CSqEdr
 l+XcHguTwndXmMyTz4qVTqrUfVy9FSGkjLxcjS1ZhFy5CWuM6PV+66Ysz5RWIZpglu59
 EaNw==
X-Gm-Message-State: AGi0PuawNqBwLzX64suHs1PYQq3udbJgD1fO6lgCkZa4EAxTRq73eqwv
 UxUhvQ1lcELxeldScGEP6P8zDeyqgF0=
X-Google-Smtp-Source: APiQypIqTjtVoRaD2OhqjnO9XpfMgccnF/80vIjLwCBdsxgR6aNsuU+7iyNxHrHcnYjkH2WPjyT1Rf+7CFc=
X-Received: by 2002:a05:6214:1804:: with SMTP id
 o4mr2636288qvw.10.1588248015930; 
 Thu, 30 Apr 2020 05:00:15 -0700 (PDT)
Date: Thu, 30 Apr 2020 11:59:56 +0000
In-Reply-To: <20200430115959.238073-1-satyat@google.com>
Message-Id: <20200430115959.238073-10-satyat@google.com>
Mime-Version: 1.0
References: <20200430115959.238073-1-satyat@google.com>
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
To: linux-block@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.74 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.74 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1jU7ra-005C4D-Av
Subject: [f2fs-dev] [PATCH v12 09/12] fs: introduce SB_INLINECRYPT
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
