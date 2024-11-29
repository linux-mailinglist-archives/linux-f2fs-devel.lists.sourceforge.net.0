Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 153F49DEC44
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Nov 2024 19:57:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tH6Aq-00025P-1k;
	Fri, 29 Nov 2024 18:57:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <leocstone@gmail.com>) id 1tH6Ao-00025I-BO
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 Nov 2024 18:57:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qzPuQk3ZQ6E9JagPssZlS/uY8SuiQz+WhShMT3H3dhg=; b=UFO6n0zVoPaggu4/jUDAkIefZr
 NDa/422Qps6FEaEDEyq9WHbzqog6XvbHTt5oOPK8p2XXhkVNTbTtJYDe5+5mOAzj0oe0znIcnJ+Ci
 KlufkvDS5Opg+X53BQmFEjK4J0nToW+FSAItyC7KROJmdRPGTA02LZH/xyOmtmU8RXh8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qzPuQk3ZQ6E9JagPssZlS/uY8SuiQz+WhShMT3H3dhg=; b=Q
 ChEf3s4WvIeg0jdbcwk1oT09QV8XCHyiE4Jc6Z4r5zYdRkE6xfM16UH8IsQ+8cDbxl8RrlGqbXklb
 JM3mdF71H2XT2EwJUPvO1pPTZpdQqY3YP59Ial/xFf6eHZMpIV+JmaA0ub1XNgAa9TTadrXfDRjXr
 hLfU204Xcbrmsd8M=;
Received: from mail-pj1-f42.google.com ([209.85.216.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tH6Ao-0002dS-Ea for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 Nov 2024 18:57:03 +0000
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2e9e377aeadso1786329a91.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 29 Nov 2024 10:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732906612; x=1733511412; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qzPuQk3ZQ6E9JagPssZlS/uY8SuiQz+WhShMT3H3dhg=;
 b=mj9oijES2RHnpNKlcv7jF7A6UHzLZOcHNHfwAu8LdA+TExcF6cPv4OEOD7gPthqokE
 Xm3kjQHRUEYKvLG0+IYYZlJl+FIxx3e9tF3kXxNUDdRn1I38Zhzw2T2QlQLQ8UfTz5dl
 qL785j4fNY6MbaGBkn8D4Jv1s4Qcxck2hNLk0RpCtKLCKjE5CpeRYNEIztGdvx9ZHtrw
 ph2My9TVmGdPrFQ9E2qdT5WwV5RxrVgrIwAgZW251eW7KpvfYYVbLKbzOaNWY6G/I7CP
 IjlUPEEHXROyf8ZIQ1ZWwBj2Ippa3wGPzKYTuTusVlLnKysAPH5KRzoTBv7Y8BpCvRIj
 qekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732906612; x=1733511412;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qzPuQk3ZQ6E9JagPssZlS/uY8SuiQz+WhShMT3H3dhg=;
 b=ChQQbbN7/6KcROkVveJ3svitEBU86y6Bb4D9iBBOmBOZ6FKXzAZRTrlMuRvnSqi4sR
 ovVvYwUye787/1zLGEthXbIWBpPMiYteWgG/0dXAERafkz0tw4NEYTngMgUTHx+yNs+e
 nZxgH41lSUjbOCFtDKbV+Jq29pSuPe1z+EZ2TxXpebO+kgBu2MEFOS1UaiSKaUf3L5Ga
 ed00L+W/MOwEQkJ8kw0/d0+J3rWbimqHNoXzc2mYFkaLYKFFomuLjy87O2R4MJYK0kjI
 rU6QMC5QqERzcLXP3tdNJ8FGB3qyOP+ibvdsxcm1jhdZYLmiO/9zZvMGJC78klJOIGhW
 y5tA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUooZTIX/PrTO9UPh4V0A2e2W177645t3HdSMiMeQUD3c5rRyid99YDmvA/KrCFVfAosbdSncffJCMEKD1DgGXm@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz5pTMwqAwv/NO2XXI/MQA0Durlla25CWbHkbMFbCBYY6SFVpS+
 9wMzK32ibqbhGWpz2AVUuyyTwHWhjKnyC4Q54QJastZx0SgROG1P
X-Gm-Gg: ASbGnctQ8mrLm6biCv1N08NKf1uCHZGo0AjYY3EOt0s34Nwh6SFdDsKElA5IrpEhfAN
 54TlCgki3lMcXd4tgMOeOVb48y8rIBTYKJ3wz5LdLELHzCPWM2uUZWz/j5xCHQupK/vg72AIeSn
 YizBuF541RaRLBu+XsYSjDzPPtUadTIL9V3nOfWg9jgI6V2MCSF7RpqxKYzHhcNob7JKspDmD0t
 qpn5seN+F1KmALjB+ax31XAwG7EGUR9UFo6paG4qS+pAHrF+EaoYaPBOFmNbkTZiA==
X-Google-Smtp-Source: AGHT+IEQ5B46R7s78o1UFrbgGbgPRQC2H4C26jFLulnenm8fn3q9cgoa3G+RaMIFtl7McLRHfZGKcA==
X-Received: by 2002:a17:90b:3845:b0:2ea:97b6:c461 with SMTP id
 98e67ed59e1d1-2ee08eb30d4mr17333769a91.16.1732906611724; 
 Fri, 29 Nov 2024 10:56:51 -0800 (PST)
Received: from tc.hsd1.or.comcast.net ([2601:1c2:c104:170:21cb:a5d2:92cc:4587])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725417612f3sm3960330b3a.22.2024.11.29.10.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2024 10:56:51 -0800 (PST)
From: Leo Stone <leocstone@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 29 Nov 2024 10:56:41 -0800
Message-ID: <20241129185642.6483-1-leocstone@gmail.com>
X-Mailer: git-send-email 2.43.0
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
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [leocstone[at]gmail.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.216.42 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.216.42 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.42 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.42 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1tH6Ao-0002dS-Ea
Subject: [f2fs-dev] [PATCH v2] f2fs: Add check for deleted inode
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
 syzbot+b01a36acd7007e273a83@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, anupnewsmail@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The syzbot reproducer mounts a f2fs image, then tries to unlink an
existing file. However, the unlinked file already has a link count of 0
when it is read for the first time in do_read_inode().

Add a check to sanity_check_inode() for i_nlink == 0.

Reported-by: syzbot+b01a36acd7007e273a83@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b01a36acd7007e273a83
Fixes: 5d64600d4f33 ("f2fs: avoid bug_on on corrupted inode")
Signed-off-by: Leo Stone <leocstone@gmail.com>
---
v2: Correct "Fixes" line
v1: https://lore.kernel.org/all/20241124010459.23283-1-leocstone@gmail.com/T/
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
