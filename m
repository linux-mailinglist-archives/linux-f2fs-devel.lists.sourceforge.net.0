Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DF29384AD
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 21 Jul 2024 15:18:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sVWRt-0007c6-OQ;
	Sun, 21 Jul 2024 13:18:01 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sunjunchao2870@gmail.com>) id 1sVWRr-0007bz-VE
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 21 Jul 2024 13:17:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=39rKwaXgTU+K+vm0snLvnvmGVNQXYxZpOwm5PhJ1vf0=; b=QhE7nwPljAgbb519l4wimnMJoO
 QVSPXHrqSYlhuEImfqdgCADjM5WELXrwqL9lh29Kl5v5ePorCE5g9lyu10mFwj68/wHfHCjjHlm9U
 lBqrdFlxdzgExPQd7WbIOVbrbiwNUwrVL/u75i/3EI9BeADUQLwRRZ7dwjG15AgremyI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=39rKwaXgTU+K+vm0snLvnvmGVNQXYxZpOwm5PhJ1vf0=; b=KEdGwHe2DIrJNy7I1F9xERKTjM
 PhIItGsCpM5KZkMAWdjJqN1Xh28Ul6PZUrqKp4GJDdoCSbmdslsPo8f0a7UvM6jDf4Nn6pTL/t2Z1
 2cYSSrApxkB9uj3/xQG1bhJ0o598q8cg+YCkRihuZz6x2Q2ULb+t/0xbV2YwKWgbIAhM=;
Received: from mail-pf1-f174.google.com ([209.85.210.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sVWRq-0001dv-Hd for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 21 Jul 2024 13:17:59 +0000
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-70d1158d149so214283b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 21 Jul 2024 06:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721567867; x=1722172667; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=39rKwaXgTU+K+vm0snLvnvmGVNQXYxZpOwm5PhJ1vf0=;
 b=RgayYEQQsHd2wT+ETHHGIlNOhvlHEPQFVvt3G9UHiu+99m3tYHQGtYjE79/qJ1+iFH
 cXrIW7OmzvaRuyG0+hXHhJL+BOav0ypbrx/aOpLnun0yyN2xwyoi0dyZ4fV/4cv50Vkb
 ILWoDb/C5hBar/nnIPaIrx9Dn/gSH95Jpf8CJ0PmYkHnB6kj7rCL6liFCf3GUgt4jVIM
 FAkS47XjW7KqDg4gZcty67vu1k2bHtX9WxAkeTC5u0N3r7+cwVucoPxWO9MmQt5sJA+b
 +ui8ZtWO4goXVli5qhLGq7apQ5mgOj2CQjFZ7uCvgYc4srVxBgZ4nbieNiZ1w2p7BUj6
 TKOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721567867; x=1722172667;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=39rKwaXgTU+K+vm0snLvnvmGVNQXYxZpOwm5PhJ1vf0=;
 b=Bai5Qvu5x0Kc1zxwLCbQvTXjd4o/Ui8tLbG2iGdAyvAIjgJtgp9BoF1X2i54VkyOoA
 pfz3f6z8AfxocrfVRl7AFETlONzgO+WQ6jNigNC794Zf3F9hTF+9XLiybFEebxoC/Scg
 XrdBniQwCKqzMaJZXuw2Ko5IJHdr3O43KAIlGe+u3nV6OM4EhP6ahx7VTd+jmJz/ausf
 d/Rq1U6spj7tW5U/8u66JDn8dCum9UgUhJBL2kiJaQ0SsaddjZhlpZN10k1/WFQ3lkAL
 HfikcuYIXaTC+o9FaZ/JtQrlKKLLYtKkzvCZQEWrHqxc8QgT5EtmGEA9wc58ELkA5pU3
 L0Zg==
X-Gm-Message-State: AOJu0YzJaUxHjuk9N0SljVmxOKDs983XSL7TE7UQQcKf5NvR4mFbUeWP
 FfL/snhjydiSPb4VhtdXbhvUv9E4rlzCn/FWMff675NG5WCu4RdjsUzK9dggQS8=
X-Google-Smtp-Source: AGHT+IFZ3VyIO/lyYxoIUVhWvb6N1jObCY+pR1FZp7/A89Vp/7kXO0NRU9Y7BPaQlsdiR2ss2wsaBg==
X-Received: by 2002:a05:6a00:4b43:b0:705:bd9d:a7c0 with SMTP id
 d2e1a72fcca58-70d0869e652mr4098939b3a.8.1721567867225; 
 Sun, 21 Jul 2024 06:17:47 -0700 (PDT)
Received: from localhost ([60.206.64.40]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70cff4915a7sm3817236b3a.6.2024.07.21.06.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jul 2024 06:17:46 -0700 (PDT)
From: Julian Sun <sunjunchao2870@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 21 Jul 2024 09:17:39 -0400
Message-Id: <20240721131739.260027-2-sunjunchao2870@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240721131739.260027-1-sunjunchao2870@gmail.com>
References: <20240721131739.260027-1-sunjunchao2870@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -5.0 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The macro stat_inc_cp_count accepts a parameter si, but it
 was not used, rather the variable sbi was directly used, which may be a local
 variable inside a function that calls the macros. Signed-off-by: Julian Sun
 --- fs/f2fs/f2fs.h | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-) 
 Content analysis details:   (-5.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.210.174 listed in sa-accredit.habeas.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [sunjunchao2870[at]gmail.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.210.174 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [sunjunchao2870[at]gmail.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.85.210.174 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.174 listed in wl.mailspike.net]
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1sVWRq-0001dv-Hd
Subject: [f2fs-dev] [PATCH 2/2] f2fs: fix macro definition stat_inc_cp_count
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
Cc: Julian Sun <sunjunchao2870@gmail.com>, jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The macro stat_inc_cp_count accepts a parameter si,
but it was not used, rather the variable sbi was directly used,
which may be a local variable inside a function that calls the macros.

Signed-off-by: Julian Sun <sunjunchao2870@gmail.com>
---
 fs/f2fs/f2fs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 8a9d910aa552..c9925d1ca2df 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3987,7 +3987,7 @@ static inline struct f2fs_stat_info *F2FS_STAT(struct f2fs_sb_info *sbi)
 
 #define stat_inc_cp_call_count(sbi, foreground)				\
 		atomic_inc(&sbi->cp_call_count[(foreground)])
-#define stat_inc_cp_count(si)		(F2FS_STAT(sbi)->cp_count++)
+#define stat_inc_cp_count(_sbi)		(F2FS_STAT(_sbi)->cp_count++)
 #define stat_io_skip_bggc_count(sbi)	((sbi)->io_skip_bggc++)
 #define stat_other_skip_bggc_count(sbi)	((sbi)->other_skip_bggc++)
 #define stat_inc_dirty_inode(sbi, type)	((sbi)->ndirty_inode[type]++)
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
