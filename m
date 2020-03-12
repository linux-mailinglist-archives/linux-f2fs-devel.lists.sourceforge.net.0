Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB63182A57
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Mar 2020 09:03:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3rcSu3wIfFnGpbcFZjIDXePvwenhRlVgO1Uh3Iopj/w=; b=ScNLuZK1p595QJS5Goy2m/17Q
	sKmH6ggAXgA9FQmG1rOOyIdhRtyLEsLZMZxuIxFVoix4CGFgnhv+JAIIKpF0CIxBbR3g+DApgbgwP
	wyicN4omTeW3QS2CwnTxUoeKfsiR1GZej0GUTtCraNso9n2Exd6//ajv7OPJDElQLfEIs=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jCIoT-0002Sx-94; Thu, 12 Mar 2020 08:03:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3xuxpXgYKAEEvdw1dwjrrjoh.frp@flex--satyat.bounces.google.com>)
 id 1jCIoR-0002S7-9N
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Mar 2020 08:03:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y1s6MQhHqkVnqFsukeC5Awzp5ivr6jiv6hUkDCpLIsA=; b=mtkO3x22CMFMeSwpPzuhAyAbb
 88wVoY6CnkMyU3u+/9HDJdgQhghWyZvS3//BLJxEKn1Kn6oeX68y7jpO0E8EmLwqhkoCoS1Rz3yfy
 Qy5NP38xrTH93S1sZNum3KP8P32VfzKk/gOpAQQKCa8gJvDzq4H2DSP4+SUOcLG0YAP8Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Y1s6MQhHqkVnqFsukeC5Awzp5ivr6jiv6hUkDCpLIsA=; b=c/Qnfr+q/Z5IUuvYZSAgu9+rDk
 9vWRYKf3R4CZ8eXiyfn86O/GIUe+fPb5Ys3f1ZVsGX4bd8Yg2CZieNkUgmk9x/r2lZT9NHzlP9HiO
 XtWXsDFB7OwF+7misQhAirsOflbdvU4YgwCUIAotXEy67q4Cnx7zDL9AHWOCyP4Ds1j0=;
Received: from mail-pj1-f73.google.com ([209.85.216.73])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jCIoO-00GSUt-Om
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Mar 2020 08:03:27 +0000
Received: by mail-pj1-f73.google.com with SMTP id d9so2675240pjs.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 12 Mar 2020 01:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=Y1s6MQhHqkVnqFsukeC5Awzp5ivr6jiv6hUkDCpLIsA=;
 b=KzIl0HFRPFDpD4RamPtkjTfVB+xlCCtT2LraTA/0B61n8m3pmGmHCmX//ov5FQWva1
 iYJlQp482tSC5I2bo99tpHHJ83S7G8ADGOz7zWIcbKo61d/pzYzpgAtx/XF3B40tTB2L
 08Buyphz0C7bGnN/8BNgIoGFuzOzPNTT1lNpCXWLEaTeYsLCr5NkvsomPH32QHvETm2e
 cbx2fvY1WsWGae2mbukMCmTFpDWExMCaGZs+GkpgZdHEHCGohcjNdY8UPWueJDnqYTOq
 YPmE8xd4qMF2HvQ8st4aUTOgFO8ZFisWbqW0TuVW8QMV51Kx78cclESONoHGqC55LBtz
 gTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Y1s6MQhHqkVnqFsukeC5Awzp5ivr6jiv6hUkDCpLIsA=;
 b=FWTdWY7d+47tlb/Lh8mm0cRLrSbuN9pwZNgIhZqZx4HzvRvUqYV9cUQrFit+GOUNgV
 3sZlfad8ZHqGjaXBjtkP6y4OByh70/DVUTPkGhzTdoOUtQtdL2KGoIcdem6s2WF0wVKH
 H5gTBunPVN2ykQSPS9JQkF5EFHIWmZ5Yoyh3U5rjnjSsQhJgbWyytUykQfmpyK2ASRTP
 fyZ9cFqECznyk8x0QIxBMCUApshIrjuRwc03G2sDviP7QZMr3W+w61IwKwF8rRlOEiCL
 GsJ3A8Pp8H0haAG36AnYFQ+sBEzvEauKOdUwCn8Ybx/tGrBINSpAHe8ceqSWyGCQBoiJ
 FQrg==
X-Gm-Message-State: ANhLgQ3P2ymqvJo+v2bN1Sr6mGB5EBYU7gOE9iNOiaOFQ4Cx6acJCFFm
 J3IwtJDyntZTktPwPhb2f2WD6tTsRkw=
X-Google-Smtp-Source: ADFU+vuXOMA8mZEN+vMh9qFbvN0gW4bbscIe10bvEJpl4bpEIDzYzV5f0sZE06RcCDamrRg4MYFMPmlFhx0=
X-Received: by 2002:a17:90a:c687:: with SMTP id
 n7mr2803267pjt.159.1584000198723; 
 Thu, 12 Mar 2020 01:03:18 -0700 (PDT)
Date: Thu, 12 Mar 2020 01:02:50 -0700
In-Reply-To: <20200312080253.3667-1-satyat@google.com>
Message-Id: <20200312080253.3667-9-satyat@google.com>
Mime-Version: 1.0
References: <20200312080253.3667-1-satyat@google.com>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
To: linux-block@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.73 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.73 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jCIoO-00GSUt-Om
Subject: [f2fs-dev] [PATCH v8 08/11] fs: introduce SB_INLINECRYPT
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
blk-crypto for file content en/decryption.

Signed-off-by: Satya Tangirala <satyat@google.com>
---
 fs/proc_namespace.c | 1 +
 include/linux/fs.h  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/fs/proc_namespace.c b/fs/proc_namespace.c
index 273ee82d8aa9..8bf195d3bda6 100644
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
index 3cd4fe6b845e..08a0395674dd 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1370,6 +1370,7 @@ extern int send_sigurg(struct fown_struct *fown);
 #define SB_NODIRATIME	2048	/* Do not update directory access times */
 #define SB_SILENT	32768
 #define SB_POSIXACL	(1<<16)	/* VFS does not apply the umask */
+#define SB_INLINECRYPT	(1<<17)	/* inodes in SB use blk-crypto */
 #define SB_KERNMOUNT	(1<<22) /* this is a kern_mount call */
 #define SB_I_VERSION	(1<<23) /* Update inode I_version field */
 #define SB_LAZYTIME	(1<<25) /* Update the on-disk [acm]times lazily */
-- 
2.25.1.481.gfbce0eb801-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
