Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE591D23E6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 May 2020 02:38:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=unO1e2qy3kE1vJjNd7tr+hPN7VEFc+uOSeT8LnhmSW8=; b=FJp5dhgUXmj85E7LvBU396K6a
	FrhEOsRn4dVy/S4hvVzi64CM/av+kunmJuV7mCHw5cd0nwOkfY9HZLhv5yad6REiyxULx3R1d+H0R
	KKq4eVnzvl6KycKvwhKFaILK2x+JzTCN/Y3tRv4WmaiQDvt8MWWX258pxMt4l8fDarQCM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jZ1sy-0008Ob-Lm; Thu, 14 May 2020 00:38:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <33ZK8XgYKAPAkSlqSlYggYdW.Uge@flex--satyat.bounces.google.com>)
 id 1jZ1sx-0008O2-F4
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 May 2020 00:38:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=55QkT4XKq8mxRSoFTXYC1SQTqi8PeYRTuEggeVVcKMg=; b=Oiktifu/vOGoUjkxJI1cWCDqO
 /8Yaqgy+1EKU2IKEGM7ztBbKF9bwC/L3dtAR5pE0Ukgm2rSvIdfMWtyH7UT1YhrLcVot6F5R/TEKJ
 GK0KU90oSPvtSCEGyfcL7/y7zwGw79DZ23yNFj7tIkKDkDKxAO+5vDgEQk37jVjEgAlaY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=55QkT4XKq8mxRSoFTXYC1SQTqi8PeYRTuEggeVVcKMg=; b=AxAH/kxTk3vW33doXBEFvNF+O1
 +3D5BFdpIuDN/2TsrTYphZUI8IPV+K2PAerEFijod3oy0LQx39QEd4MDL8l5gvXsYZmFeXN0W84nx
 039OwKdRbs5azI7rcsXHTeQfqOjFj9aTGK6lLpSMuIJ/88Dk+XpQsAlKd2CLD0K/15ak=;
Received: from mail-yb1-f201.google.com ([209.85.219.201])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jZ1sv-006BiL-Uv
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 May 2020 00:38:03 +0000
Received: by mail-yb1-f201.google.com with SMTP id k15so1775862ybt.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 13 May 2020 17:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=55QkT4XKq8mxRSoFTXYC1SQTqi8PeYRTuEggeVVcKMg=;
 b=FSAR9aVsI4Fqie7/PXkkDI8Y5GUjTkPwa4yPhNhy081BetakXjp2/T+HFhP7i1+jje
 E+77VaVI8DExiI50gAzT+1sVBifCQAsD4Iuj7Vx4k3eLChOi3L0EEOkG/ctWNZDFmosz
 dincGlPfrOyQ2hvnuusxDe81Gvr09ObdELXbyZRT59AQP1askJ5J0y93drtA7pgYfPqK
 58BqOlAMvpPVvsB380SSrFExwEf+FXA0+3cxjhFZkS/tyewv7/tymBXeCjcfXEdWaawb
 MXslNYJD3F0lPpZKrL4FBdhG80RKUgs4aLPHmixHtsc75/nDy6pOADX/NqjUV9XdyGN3
 BtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=55QkT4XKq8mxRSoFTXYC1SQTqi8PeYRTuEggeVVcKMg=;
 b=lveVydywbZWmUdTQleQyncw4LjtHsxMq811HP+0LzQlxU3M2CBhlpJnab8g8csxbXc
 XoXHG+Ml/Noovf1dyAak4lED+CgVqn6LV5zi7xOZI7qfTNqnKUKwDfAZxnkIzcw09xFr
 RKjBlu3gyTFvbmwR2TRz1mLwIbjCMB4XqM0J2uaS4K0XwnEX8tcPBdEpHWYyohSUgzfP
 hAiCa9wspgMAiKBSLS6ATSz0xCG4JDecGYZs854FChzee+NdPzetdGugml28wc7UKr0q
 UIFj87M18LU+pA2gSCX2/+bQLXuDHTaw9up5N9dpUXeH5ecvcCE+Ndd1jyRQUKBVAtrJ
 hZaQ==
X-Gm-Message-State: AOAM5328Qd9YGhyc1KR347InE4dMBijNJaV+4Mm2K/XwveIjJa5IYdCL
 aOWhiv8TzMMtzO4qIs6YZUt3MWgDH40=
X-Google-Smtp-Source: ABdhPJzYcXxCqDOzC/K2ZR7nIKEHI38RLh83qXdlxtWE7t4EU9eemainBQhkiuOi2LGdK5129XlL1c7RPiI=
X-Received: by 2002:a25:3044:: with SMTP id w65mr2908668ybw.207.1589416669011; 
 Wed, 13 May 2020 17:37:49 -0700 (PDT)
Date: Thu, 14 May 2020 00:37:24 +0000
In-Reply-To: <20200514003727.69001-1-satyat@google.com>
Message-Id: <20200514003727.69001-10-satyat@google.com>
Mime-Version: 1.0
References: <20200514003727.69001-1-satyat@google.com>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
To: linux-block@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.201 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.201 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1jZ1sv-006BiL-Uv
Subject: [f2fs-dev] [PATCH v13 09/12] fs: introduce SB_INLINECRYPT
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
index d3ebb49189df2..da6551c8d96fb 100644
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
2.26.2.645.ge9eca65c58-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
