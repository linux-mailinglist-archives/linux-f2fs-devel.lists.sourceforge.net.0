Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1116D1A1AA5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Apr 2020 05:57:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FXKBjQ+LPC40BoOXmt3EQj+bqzC2xpG+cbEtOOa6PZE=; b=GODm35NKFkCOvN4inMukDRDyu
	eESxKkCBgkuY2Nq5qklf8vR6b6qRN338rA5UWiXn/kKDGW4e3JYx8Qo4XtOyWI3d8QO8FGCZPXVym
	D+pf41bEe2IfG6JHTkDA8QYTO+FWym694khpYCurG91ird/IjOPvRLE8Ot0CaB3gKzUTg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jM1qK-0007tr-RW; Wed, 08 Apr 2020 03:57:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3qEuNXgYKAG8fNglNgTbbTYR.PbZ@flex--satyat.bounces.google.com>)
 id 1jM1qJ-0007td-9h
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Apr 2020 03:57:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xJkP8e59/n7iIujiMcl7X5Pc4Tz1txAW1Gmb+VI1O1Y=; b=c6Dcmhrmx3F9uYnqS+kJhpREm
 L3xOIuqzF53PgGR9NRMHrWcpfzzu+2+TKID2snM1xt+Clm9GQmO1rmf/BVYNaOdVQEiLPAE1xrvL0
 G8coQw4PPfHKwMyx/3sJVqiGa92pvmw82jkWLodFSNk0qAfTKdFZsyHbkrsmm5wHOvBpQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xJkP8e59/n7iIujiMcl7X5Pc4Tz1txAW1Gmb+VI1O1Y=; b=ezqcBBBLXb7JZz/oYX9upxi+jR
 AMjTV2/VNHYu/GG1+r3lBBOEHYrSgIRYIAZrrk0F4udjlpllXVlTvYjJ8iuuhsxwIYj+cXXz6wivX
 1+R0FVSlVFZzn6S39nTAJGL2aN8ivW43EqlK77KhjG1nsPjdRH+pVdL/uj6B4eHXZwts=;
Received: from mail-pg1-f202.google.com ([209.85.215.202])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jM1qH-0075J3-RL
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Apr 2020 03:57:35 +0000
Received: by mail-pg1-f202.google.com with SMTP id z29so3346300pgc.23
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 07 Apr 2020 20:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=xJkP8e59/n7iIujiMcl7X5Pc4Tz1txAW1Gmb+VI1O1Y=;
 b=ibNVbWoN51vmsJrnlJSyk7S/HV0c8UIXlHKsiPBuqewKjm5llKIxkJQ2Ji6nSQ5LST
 n0AJzKnewfPtpxdakzl7dwb2+91zGQKDysHCziHYKo0tFR1ScmRd04hvJVWaY2YcVM+F
 OKQ5wPf19y5SXFt/ZT+JbE01LhU7PYsjJLNBM1vFzPxEjpOakDSmt31RSKSr0HCnMJhE
 /xcirmTzPlVcDhcSinZQBr8QECGNh2xp6qMaKKhgembnsheFqD++bhOCQy9chtUO67+e
 V2zC3D3KjJuEpzTMN9m6sZK1ZubjNyZ/RcYtK5PwdKmyKiOze6MxP6o4u9iNwoAloouL
 u/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=xJkP8e59/n7iIujiMcl7X5Pc4Tz1txAW1Gmb+VI1O1Y=;
 b=ChsLEtmR2Oq7GZWmkPWf9W3GA+VvHtehw8bZQfeIR1pEpkFR00zZnBB8m0OwW214Rx
 hErFQQoq/8uU+8J7YRRphIPklnbDqY9IC+EhONTy01PSsYpcIuJl52eQuvcLWbw1n+mc
 1cuTbzZjtGdKqvNO5am1xNfTI6jo6qldnfDWN1ASDK7UUglxB8Hd2/JOrz7mMohikj5B
 Fpzc2kLScFyizYKhz+BX9lqb9GCuFt8RH6WWnVQovCkgqMXHTBxe5lq/WiRdP0iSqURG
 0ON7GsBTjwm5rcnxsO4f4M1LP4u+9E+8+zjXGorW6KmDypzTYJTLhu4F6dwI6NrAxeAY
 yqxg==
X-Gm-Message-State: AGi0PubST189bnkcBOzh78aH/cofXPKV85r5NWqbhFXC0HHcvX1NNoVo
 6nK1v4jTRZsn+s90vFJ9T+Mo17alfKg=
X-Google-Smtp-Source: APiQypJm4U6exMkrVHaCaR+Jox2XVDnJ+ZVZwcNOltIQvdyFK8OCQp3/sfrcru/EGGInehFptE8sLZbx4Vs=
X-Received: by 2002:a17:90a:3547:: with SMTP id
 q65mr3138844pjb.118.1586318248079; 
 Tue, 07 Apr 2020 20:57:28 -0700 (PDT)
Date: Tue,  7 Apr 2020 20:56:51 -0700
In-Reply-To: <20200408035654.247908-1-satyat@google.com>
Message-Id: <20200408035654.247908-10-satyat@google.com>
Mime-Version: 1.0
References: <20200408035654.247908-1-satyat@google.com>
X-Mailer: git-send-email 2.26.0.110.g2183baf09c-goog
To: linux-block@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.202 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.202 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jM1qH-0075J3-RL
Subject: [f2fs-dev] [PATCH v10 09/12] fs: introduce SB_INLINECRYPT
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
2.26.0.110.g2183baf09c-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
