Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BF220CE69
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jun 2020 14:04:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xuzdDKeTv8AK3zhPlAeo/vwTIw5uDdareFEQnubUhCU=; b=Q1Q8B+rijZ97nzcfROMa0RIN6
	z1RlHD150hxKqPR7z0dVL+IJYbPPIS8Dqw8TQd/yJmxuYacbXyaQlXTONuM6ER8y4dkZuklFBHPlW
	7upC7j9OguixyAQCmJVEpam2PSlL5jCFLhevKkoP7v2Z9sXMoTQb2h9cMKyx0VOHAIMcw=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jpsWN-0005gP-9x; Mon, 29 Jun 2020 12:04:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3vtj5XgYKAFUFxGLxG3BB381.zB9@flex--satyat.bounces.google.com>)
 id 1jpsWL-0005g7-FY
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jun 2020 12:04:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Hiq5qeIacI3jGarX6UGdwdJ7Wd6uQ2S/6tth3Y47uPg=; b=Ynz7AFUVzTZ2PFrRzNTRI4bEW
 IZhE2JSpCBHrqdDCl2XuXySlb8G+6cMQi0o0XoDQjfzShNzYusoU91jFSVAGWWaOOnLLxKq2xyutg
 09UumbQPhueOyw+dFIBPlYNTUQY7wu89zMoYvDwq/RQQohQZIW0qXq1SzREWS8Lfxb/NI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Hiq5qeIacI3jGarX6UGdwdJ7Wd6uQ2S/6tth3Y47uPg=; b=GYwv0Ln00ZArZxoR9UksycJKQh
 jT82UIwKz6an8DNdDatVMYqZ1FXKCYcpqaSZuY5ZwkroQNplayh7Ylz+gp7FGtZwHgZb3clTy7620
 aw/OAZRp7G5VDN5dEHaYj5DJzHmhZdaBiURbRnyNZTn90JVlxEG1B68ItLyNwhMinUJU=;
Received: from mail-qv1-f74.google.com ([209.85.219.74])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jpsWK-0021in-7g
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jun 2020 12:04:21 +0000
Received: by mail-qv1-f74.google.com with SMTP id r12so11678045qvk.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 29 Jun 2020 05:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=Hiq5qeIacI3jGarX6UGdwdJ7Wd6uQ2S/6tth3Y47uPg=;
 b=W942yi6ZvwWs08XjF1OBZSPhGTep6OxGoiZAsN4TEdSnXuGw/s4/oimk9+OXUKeqCm
 fMFD56doo4N+otqevAazQeYnmjmwtYAHES6H4ggroUDAScTjB2D+SQsZy9Pbn9x3DghG
 uT3MkPhGSwJG4h1SGXNdkq6pJ/PW2ULa9k+qcf4JJdoFlDbLW7CWYVgmZ71wnZ73cVIm
 SP1un8MWpk07oH29gWfAnD+VHgMhQsyWCKV4anmu/I22tmdUxRjFs/B3gaIBTDmisDBk
 phEVoVee7yfVX0tTmEElUNguACz9+p/5xgl8iPoWTapWzIktFX8pBh1vTyWQzT9KdBau
 72kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Hiq5qeIacI3jGarX6UGdwdJ7Wd6uQ2S/6tth3Y47uPg=;
 b=no0fSxNand6bAo/mE12fGqKqP6A57xlQ78BP2aKmQVOZbcrmcwlI91r3I81/rtp/jA
 8cJ/+XB08eCjnDkkqfhJLrBgE2WeT5xpOG5hR0zkZe3sWSO7bXL5i29sccgjXFOMZbfQ
 +kVPgHslYgjh9j1tUmx+uvoihbCq730hZ8iKR8F2ZENjDBqamGp9dQtZ7jIQpt0AhEeS
 Hytq2FbyvK/hxXyAy+HqR1zAp0rXw41iZrqfV11+oqfuDEA7AVDuXiZsrKbZ08Xvc1x0
 6czobI+Cxy+U02FK9MhgK6Tn8G/PcRxgBM6C76YdMkN4aS5L5Myc2s//qE3a7QAZO2gW
 pNGg==
X-Gm-Message-State: AOAM533K6DNxMSSRzDXWtYUWmbz2G0DQwmJFgLgd9keEfIsB13qZR11R
 3XZXR+KHnyHbsTDff6A9UCXr1ryNl/4=
X-Google-Smtp-Source: ABdhPJwkgBLEZTIYTMq7DREhCsBG00chjwS1TzedYP/fncY46dZiXawch5b0/0qtKz7xaJvmqJxSEf7VXIU=
X-Received: by 2002:ad4:4a81:: with SMTP id h1mr15062556qvx.102.1593432254291; 
 Mon, 29 Jun 2020 05:04:14 -0700 (PDT)
Date: Mon, 29 Jun 2020 12:04:02 +0000
In-Reply-To: <20200629120405.701023-1-satyat@google.com>
Message-Id: <20200629120405.701023-2-satyat@google.com>
Mime-Version: 1.0
References: <20200629120405.701023-1-satyat@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
To: linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
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
X-Headers-End: 1jpsWK-0021in-7g
Subject: [f2fs-dev] [PATCH v2 1/4] fs: introduce SB_INLINECRYPT
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
Cc: Satya Tangirala <satyat@google.com>
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
