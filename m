Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F58320F484
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jun 2020 14:22:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Vy+iUT0tA1aSaqRpcMSQH7xyYbAl7o8sm9jngS+5BZM=; b=mZYDx/9fYU6JISv8VQLsuu3b5
	BJr7Fcx2Fe5FBTszanNqOD6wcusNPz271qBTvfKqonXFUQGZVhMGPdYzDdotZ6oNJHJsMVym7YwTC
	mfAzROIIYOzqxJ5/Du24GdgVIvLWTpFdWafhGkcKb1EgEMSqtxPOIGVXfAoT/Bb6tZJSI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jqFHl-0000gz-2H; Tue, 30 Jun 2020 12:22:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3tCz7XgYKAPcrZsxZsfnnfkd.bnl@flex--satyat.bounces.google.com>)
 id 1jqFHj-0000gh-Cf
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Jun 2020 12:22:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WYYjT2/hNkPnR18Pb1O8vFno0wa46kUGqnYNvHL7CO8=; b=EQZjOW8iL7o+KyJB5a3COTLph
 pdw3QpWKVvuQaJ6vox+xaGAjK6n+ZItXto3zN3h9ufgYzM1+zNRVynYOGIVPT2E0eru0STiRSfjpp
 tqwor+K+zNS8kgyoQ0bZqrQTjfaachnfdJ/tNY4b1OpitN1i52xJ3KS3vMB396ZLfNoGY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WYYjT2/hNkPnR18Pb1O8vFno0wa46kUGqnYNvHL7CO8=; b=ElirBQOMiAGBV23F042cQ6n1Vv
 7ZaWfGuPRHRRtCBuAn3C5bJifvaodNWhZrcbiRUmh0UHftFcFEx79q+bewpu7HwSptrrxgrJN7TaS
 4wN5ufZECe0t8iE53GGioYT95NlfI0RzT5d8h0zz4nYSpdSkYyFMWRKmqDnOfCKVdt5Y=;
Received: from mail-ot1-f73.google.com ([209.85.210.73])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jqFHi-002xTf-9h
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Jun 2020 12:22:47 +0000
Received: by mail-ot1-f73.google.com with SMTP id x6so7929308otj.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 30 Jun 2020 05:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=WYYjT2/hNkPnR18Pb1O8vFno0wa46kUGqnYNvHL7CO8=;
 b=OsSqYUaDlsn3RDGvRxnfKrOwwmVcSIoKG8D6+pXbsKD6FCLrWQ7Jsvin1ELj893EwN
 A1EIorvIYssa3wRXvBKD3Pp5AQVAVwbbcFQnApEYe0llGG59RkWdtJsMv4yoTqHMHG/L
 MT8D7toVHPVzVH5VL8rSdns+WpG5nKBZntcm7l1L3YDixzo8bwTPfpB53TtfGi+uWPcr
 uMnSqNHaY4af/zEeB7qaznrN9lZp0jjVyzzKYLL56pR0rRpLF0T2yV5GJxboGlDmy1fE
 g0lc4Dk9/oq1duRbjwWwlwL64IeUlgKRSQ7dvQAfUnKENvYOsPjSlWohIAehtV3joMFu
 AYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=WYYjT2/hNkPnR18Pb1O8vFno0wa46kUGqnYNvHL7CO8=;
 b=WVUOnk0cPk65lxfYrfZV+KZf8fvPsQ/WH1O4hbqGhrWbYv1soQaAzY76Ye+iuww+o1
 /XluF3LvftWH9OugjQ7PhqOv5O/980rsTmpSn6DfrNFfvzSSzqUWW/iB/BL90xxTcpW7
 I6lNIbakXuHDrO65nEue6CfFc5UTzqPRHJlOiNcqOVCi+oPq+B+VuqM9oehptDHWOGwp
 2fj/i8zLbjUUi4HszGpfunQm4YnJuoiEcoYxmK9diFemEjo4ZeULMKKJx33/ZFTGOynu
 EdO+soGvClHw1ojnG1S4mMpnNlV31wQf2DrH8D4QCBLT0yvtLvDoZSMDIU86kUKb2PXQ
 B9kg==
X-Gm-Message-State: AOAM530i4H7lcP2T3jlhKMgAO6+ZSvP8tnK3vrFFf/a8EePEqqX/zxDK
 n64McXiN7fHqgrC7pqgaK2FL5R621Tc=
X-Google-Smtp-Source: ABdhPJyEEcykC3kPlH4nyjzH8L4IuQtmaVrj3RrJmq3Xhyj4L95ZMctLLgbq3tAQNaoQgla9CrRf9QIq+4E=
X-Received: by 2002:a17:90a:6306:: with SMTP id e6mr3080137pjj.1.1593519284966; 
 Tue, 30 Jun 2020 05:14:44 -0700 (PDT)
Date: Tue, 30 Jun 2020 12:14:35 +0000
In-Reply-To: <20200630121438.891320-1-satyat@google.com>
Message-Id: <20200630121438.891320-2-satyat@google.com>
Mime-Version: 1.0
References: <20200630121438.891320-1-satyat@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
To: linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.73 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.73 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jqFHi-002xTf-9h
Subject: [f2fs-dev] [PATCH v3 1/4] fs: introduce SB_INLINECRYPT
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
Cc: Eric Biggers <ebiggers@google.com>, Satya Tangirala <satyat@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Introduce SB_INLINECRYPT, which is set by filesystems that wish to use
blk-crypto for file content en/decryption. This flag maps to the
'-o inlinecrypt' mount option which multiple filesystems will implement,
and code in fs/crypto/ needs to be able to check for this mount option
in a filesystem-independent way.

Signed-off-by: Satya Tangirala <satyat@google.com>
Reviewed-by: Eric Biggers <ebiggers@google.com>
---
 include/linux/fs.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index 3f881a892ea7..b5e07fcdd11d 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1380,6 +1380,7 @@ extern int send_sigurg(struct fown_struct *fown);
 #define SB_NODIRATIME	2048	/* Do not update directory access times */
 #define SB_SILENT	32768
 #define SB_POSIXACL	(1<<16)	/* VFS does not apply the umask */
+#define SB_INLINECRYPT	(1<<17)	/* Use blk-crypto for encrypted files */
 #define SB_KERNMOUNT	(1<<22) /* this is a kern_mount call */
 #define SB_I_VERSION	(1<<23) /* Update inode I_version field */
 #define SB_LAZYTIME	(1<<25) /* Update the on-disk [acm]times lazily */
-- 
2.27.0.212.ge8ba1cc988-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
