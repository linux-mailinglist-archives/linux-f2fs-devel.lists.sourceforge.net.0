Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C24379D6C5D
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 24 Nov 2024 02:05:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tF146-0004h1-Gn;
	Sun, 24 Nov 2024 01:05:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <leocstone@gmail.com>) id 1tF145-0004gv-Kn
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 24 Nov 2024 01:05:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CAwEK8ckYP2jo6LfWW1LjFBbSTo2ZwCKFOg8+ckdSD0=; b=Ll1NSevXLeNcYOeuTFmI8Bay0t
 IwwYfDfH4C7kDjnnPYF7yDzvy3eoOy9W+mcSygV7LUyHOQ4NeD7Vrdx3Ja8owFkyWrw2sUjwm8tab
 roFnuNUqlmFxN8JQOfgvfUoRzLhPI/s+xJalcIbgBADSt7SVKs/F89uNoe3CkFKlnzt0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CAwEK8ckYP2jo6LfWW1LjFBbSTo2ZwCKFOg8+ckdSD0=; b=e/E/GqblLfWp72GyPv/xpgDMJs
 K7LV7L3STLeJVb3LcICXYQsmiaLHUDdW8HE00GNvVnoEG8YbmxguJYp3X/c0gvKyBQoCgQNzS9VR+
 931go+zNyd6zx/SaDGD2YpjY6nYQuzMGFexxjd2Mn++3MqgmAFPTh+HFUFP6a6f/nvOE=;
Received: from mail-pj1-f52.google.com ([209.85.216.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tF145-0006FM-0f for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 24 Nov 2024 01:05:29 +0000
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-2ea39638194so2922723a91.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 23 Nov 2024 17:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732410318; x=1733015118; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CAwEK8ckYP2jo6LfWW1LjFBbSTo2ZwCKFOg8+ckdSD0=;
 b=lG8piSd2gHf5Mvj+RsmCjAP+y6kmQXKTJ6WbbX8fPp44BkByIxx9CR6cJhVjElOZGp
 QpH9b79FImBM5joIvlPLRkjOefIRrjG9gA7iGWtXPhL8kfkmFlPzFB1ABGUWb2w7Ni1t
 cfe7U1ZNp6szckh2MaNrJuwXUTNj1BCV2vRYyiEK9/k2DSthdl874+LAIpK5I8G1ykVR
 XXIx4rMxk9YPQ5qho78T2j913ISwsm6luovtFYO38B+n1JSp4kBPP2O7JtTSWD9y+puF
 XhZf7AqR/rncWp6r3rXAe9qhrjRBBBr0hlYCsoAQO+0R7yGGr/mopgDH1hCPS2C59BiO
 8nVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732410318; x=1733015118;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CAwEK8ckYP2jo6LfWW1LjFBbSTo2ZwCKFOg8+ckdSD0=;
 b=F68T6hzzRWoIQmVA9BYVYUS1iPFIr98c1dy14B6aQVdfZ3bRXSerwtkE+O3h/m9I89
 eOIh1pRi6ka3fRWbpMefgIYoAMOkBTUHV/r4bIKbJ7FRLmwGpup7k354vxR//uof4txy
 QilAXqmYbHO4V221NCPBCEBf3NkC79U6w6jnVZlisbCxlpj3LT5zKmzS4qKEvhJl8j/K
 6za/THHONvGSvR939wq4aiyKefcX9HYY1lqSFupnFJTy6ECv285vqOLF0+0i0nfdU2+/
 UNla5x/d2vKHrlT3U6Cvr0GPMl0Nxpbv0SF3sNkA9eYIxaaecvoZJPMhCPY6k/6cQ5Od
 jyTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcQ/B1gxmz7LmlhIBry79Y1clCEdyxcN5Lv9fs0rzNiTxBfyNcWDurfTbIVS9/uKcwXbEwoVTx/9rQVBBJ+eyw@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxAdk2DFMtXjF4ag9URZcEz82qy6l3YxSE4CuP3cad0RJiiiaIb
 H5yfbX9fP3cppfzIRmdNbxpCgJCKPIV9Kw/reYi5aaBz4SyZzPsx
X-Gm-Gg: ASbGncvOMjg6DoKdPZ8hOGyg8OUCJ+1OAEjaS5J67oGFkaUP2D0+biooOVqcV7wxIBZ
 3wzhwusdM14NJyE7SdDLyYAIv1ckefJ3ttY2L/+1LYIGoEzlJ5nhf6JcCRk4/e8g6aP9omCnzeA
 svP2sw1t4Prn9eGqblTSB0nO5UFY29kQMaquq0gxoR9V0RKTv+Vq+NZd74v3sYPtLzgShIuum6a
 g6ACiYD2X3lue3OqRc6SUDQLWHyrUDIm/Mm5Q75nNPVd/PY2dxQzNpeC2pxoIdWpg==
X-Google-Smtp-Source: AGHT+IF89OxBOuRBB9ZUdI9OCWFJ9uXfDxkS8V8O6OpzKlAmvgQ8cJW7GVdnY9cTbMAsgtRvxroHgw==
X-Received: by 2002:a17:90b:4a92:b0:2ea:4150:3f80 with SMTP id
 98e67ed59e1d1-2eb0e330d8bmr10102168a91.18.1732410318077; 
 Sat, 23 Nov 2024 17:05:18 -0800 (PST)
Received: from tc.hsd1.or.comcast.net ([2601:1c2:c104:170:86c6:5b62:b5b7:ec1a])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-724de479102sm3855532b3a.45.2024.11.23.17.05.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Nov 2024 17:05:17 -0800 (PST)
From: Leo Stone <leocstone@gmail.com>
To: syzbot+b01a36acd7007e273a83@syzkaller.appspotmail.com, jaegeuk@kernel.org,
 chao@kernel.org
Date: Sat, 23 Nov 2024 17:04:56 -0800
Message-ID: <20241124010459.23283-1-leocstone@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: 6740a00c.050a0220.363a1b.0143.GAE@google.com
References: 6740a00c.050a0220.363a1b.0143.GAE@google.com
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The syzbot reproducer mounts a f2fs image,
 then tries to unlink
 an existing file. However, the unlinked file already has a link count of
 0 when it is read for the first time in do_read_inode(). Add a check to
 sanity_check_inode() for i_nlink == 0. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.52 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.216.52 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.216.52 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [leocstone[at]gmail.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.52 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1tF145-0006FM-0f
Subject: [f2fs-dev] [PATCH] f2fs: Add check for deleted inode
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
Cc: Leo Stone <leocstone@gmail.com>, shuah@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel-mentees@lists.linuxfoundation.org, anupnewsmail@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The syzbot reproducer mounts a f2fs image, then tries to unlink an
existing file. However, the unlinked file already has a link count of 0
when it is read for the first time in do_read_inode().

Add a check to sanity_check_inode() for i_nlink == 0.

#syz test

Reported-by: syzbot+b01a36acd7007e273a83@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b01a36acd7007e273a83
Fixes: 4c8ff7095bef ("f2fs: support data compression")
Signed-off-by: Leo Stone <leocstone@gmail.com>
---
 fs/f2fs/inode.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 1ed86df343a5..65f1dc32f173 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -372,6 +372,12 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 		return false;
 	}
 
+	if (inode->i_nlink == 0) {
+		f2fs_warn(sbi, "%s: inode (ino=%lx) has a link count of 0",
+			  __func__, inode->i_ino);
+		return false;
+	}
+
 	return true;
 }
 
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
