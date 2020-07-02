Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1825F2119E0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Jul 2020 03:56:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Vy+iUT0tA1aSaqRpcMSQH7xyYbAl7o8sm9jngS+5BZM=; b=JC+yCcC3MHz8HxmwaArcxxQZi
	fJ6qGZDDrDTe1w9/Ce4iHKA+rel/M7AAwENV+k4mrQFSGVlwC79FToCaPGjLl9KUBdu+wv7uBBcEn
	kJ/kEkTvYo/qQGPj4P7g8iM5XDo48+NMjs08MnZRNvGnqq39aJWpBsSc7n+yJ1oZxCP7s=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jqoSc-0004a0-HP; Thu, 02 Jul 2020 01:56:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3vD79XgYKAC0bJchJcPXXPUN.LXV@flex--satyat.bounces.google.com>)
 id 1jqoSZ-0004Zp-8z
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Jul 2020 01:56:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WYYjT2/hNkPnR18Pb1O8vFno0wa46kUGqnYNvHL7CO8=; b=V3uWkdeofRsmASr2GJyeo1n+Q
 L5BmCxVvVzXrHg4dxbN09569miF+m7opygeFG+uT8ui7iNIk1TKgTYMHDRuUReS7rNQZEfUD7Haa4
 2uN8bSy7oq7pAAhUwOWdAeT4HSdjvWl/Gsoek27IClSbec8qFmxJecjL6zcgUBkpmMiP4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WYYjT2/hNkPnR18Pb1O8vFno0wa46kUGqnYNvHL7CO8=; b=LiSAqgx62xK4jkxwH1MiUKn4gQ
 FOdt3m9XbB10jZAfCd/YLWy1C9qAq7l7F8ZmEsze/Ju/mS/SJqouNQ6dgoUmrAXYaKcEUPotv4OxO
 kUZwRfav8jpGHiZjrNAeI/WwCMjeJwkKEOmv5MBCYW1045mXekMcWZbJQsBB+fQXAFQU=;
Received: from mail-qk1-f202.google.com ([209.85.222.202])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jqoSY-007Uff-2T
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Jul 2020 01:56:19 +0000
Received: by mail-qk1-f202.google.com with SMTP id k16so5212266qkh.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 01 Jul 2020 18:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=WYYjT2/hNkPnR18Pb1O8vFno0wa46kUGqnYNvHL7CO8=;
 b=tE480u3ZUDpqAtXxYSVcguCdzzrzALwE6zI3bPe2vn+SuGlP3liwfHHHvL7swR0yMi
 +45EfUoHTPXQCu9zATcjsa7XTIWLnCAI++nTFeCLpDRA2toC30VuhXpn9g1jI9rYhhhn
 owIppilepJsHj+LPh+QsM8Em2spEhl/n62X+tGggOvMqu4ZN9TDOTCjuTny6pAFUpofY
 KrDRgD/CktEvl7kqVfWqcoEFfOsbQf3sxDDR0Kdzxx2D02/3jgq4C15pD2o8Zl+WNBfX
 ZC9wYW7TdUfekssuIV6Htv0dh3C1BN/RCHaeUPP7UK9Q5X4nh4SX8N89kzmJQedZMbhM
 tXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=WYYjT2/hNkPnR18Pb1O8vFno0wa46kUGqnYNvHL7CO8=;
 b=uFDlFe5E3IYTEMwMYj70eHDAFJG3XejYCNaibtAxiXZm0iNQU9m5Y83CsV+Y8oFbU4
 F8+0LacSMyxeR9CQev9qg5oQxc6NtoC4YBSC42Nr5FsYdQ8DuBLJvLhRce/6Mxm+MYcU
 cxwL3wLvHOU9qWUEOb/+9ae0V+Bv61uGJq2MQmcEIAaaf/BZtsUqM4XZWUiBzIrHyb6d
 wWCAs1txOwFiIW3YiLl6buZ9I27faYAbWInsM/zvvOwiP0ZPQqCW/GaZXr42IAgkpuG/
 6CyAjiWnHb1nAn/WQ39ILFdfXo7/HEkYxjDYTddwRFBFqnf13TXT/6TvlgUYdNIkmAMD
 5y4g==
X-Gm-Message-State: AOAM5336uu9HFL6cHEKhr1DEuUTSXU0WPznP9OJijAqz/uDSJ70r+0J3
 194e1bG3IjuOUsY9kGE99XlaVMJi4cU=
X-Google-Smtp-Source: ABdhPJw+Vx/ya5wGYQKZwKo1tFC7kcryv/M/vWd9ShnuevalVhxz9zBVlVp5rW01dFcIXaBSnTXp03G53EU=
X-Received: by 2002:ad4:4a64:: with SMTP id cn4mr27785568qvb.199.1593654972074; 
 Wed, 01 Jul 2020 18:56:12 -0700 (PDT)
Date: Thu,  2 Jul 2020 01:56:04 +0000
In-Reply-To: <20200702015607.1215430-1-satyat@google.com>
Message-Id: <20200702015607.1215430-2-satyat@google.com>
Mime-Version: 1.0
References: <20200702015607.1215430-1-satyat@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
To: linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.202 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.202 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jqoSY-007Uff-2T
Subject: [f2fs-dev] [PATCH v4 1/4] fs: introduce SB_INLINECRYPT
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
