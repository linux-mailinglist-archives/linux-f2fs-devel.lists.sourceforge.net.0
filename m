Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F10457FE062
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Nov 2023 20:40:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r8QQS-0000bg-4r;
	Wed, 29 Nov 2023 19:40:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1r8QQP-0000bU-Mu
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Nov 2023 19:40:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IbN/CBdY8HaO8oEbKkB4VSrcYoZEzNbVhbQ6CTvXobk=; b=Nzp4FU3L+mvdgyeHdBcGJCcK72
 Ty1Rb2XpNTGqaxruKTlelUMEyOgkwDQ/go0z9gwAgrza4DJfWNv0YEkcVrJB4wu3LR0UKJHUDuKdE
 LLM8784ApVGbS4P9azzLSs+yroiir+Xhf699d/KYOBQQfh3JcfztoYzvcoznEu9RJ0cc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=IbN/CBdY8HaO8oEbKkB4VSrcYoZEzNbVhbQ6CTvXobk=; b=P
 mKHQKv3xk6X/d9ea+IVopGKrPEMOVTMygtzjTzPe/BW2bcquRb7CBHn9GHrli5nTHWObP8Zu8KcgJ
 JPd2KHPbXV0OpMDqMyi77uQYjiXPKpwuuvpZ3ZS9nNjI6Ch2P7PvFey9qST4bfnxTvCK5dL11lONi
 SiUvvhJdwd1MS+aw=;
Received: from mail-pl1-f175.google.com ([209.85.214.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1r8QQP-0006SA-Ij for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Nov 2023 19:40:46 +0000
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1cfc2bcffc7so1344505ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 29 Nov 2023 11:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701286840; x=1701891640; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IbN/CBdY8HaO8oEbKkB4VSrcYoZEzNbVhbQ6CTvXobk=;
 b=QTbVcYel2qKGSi3Oc0ZcWwLU1mpCNxj3NxKb6j5bYFOAVbHvkVL7M+bdsYcT2GZvYM
 rQLknSmyV742vbTsQOeZpE+j7in3GetT1Fh41Kb/AJbB8DfOm+UlQSb8sXRGfosTWI62
 hvZMXIBUnEZLD6RWKbbGVA1/5mOHR1W26J/OU1aPPZzp1Wg9IE6XI+EsWMDClmRRHnAF
 DmhdghiNzb6pQRGnMcRtf+nG5KVu/AwMtguu2q2LXviLFqCxQe/j7wuuzz9dPV1UgpbN
 qY8G5SKX0NbUtXZE7njFQNLmwdrHO76oDiiVUZ7/vRAsO+QjlVnrdAskbWeTWmaC7CBQ
 y4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701286840; x=1701891640;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IbN/CBdY8HaO8oEbKkB4VSrcYoZEzNbVhbQ6CTvXobk=;
 b=H72D3qsi7VBYZ/AWs/mOU9H8+ab5nLwQtWqPrzMUxJ/c5MUqEda7BkdgAoTG6hoLB8
 dsBvtkhzDoLFBGigUiQzBx52eUk7Y7thOBGmpxr1B68v6ZKJZGFc0WLe1ATHkNj9C2Rd
 4eD0XLiQqM2F8PuvX9gmEiOs+AyBRqwUtdQl7EM3KIL9fwtS9AVZHSU4m/Khs8V3hQFl
 MRWRI9DHistjAWTEewGaBmMAhF9uWG815tyd7sgB3hITg2vXWBUhEdG3203yjb+0TmiA
 GtqyffzLISIEyN3LYK8dBeyIOJDDYjhBZfedxxCkdh7DCqsYOBYHaPEQCOqDeVU33AMN
 9OiA==
X-Gm-Message-State: AOJu0Yz4Kb5eBEL4FIK1Mib6B8QwbKiCIFHgkFnSslTd9e8/wsiJcozx
 dbb+5v80Z/GGNDIAZAhZ+nQ=
X-Google-Smtp-Source: AGHT+IGdZFEyfJpctUU4fXRWtzNMxJlMGwLs6LcaKQ3Eyh1t6Rcslzbpzy0kGZFLVkD8gYn5WOHfqQ==
X-Received: by 2002:a17:902:bd46:b0:1cf:896f:d6c5 with SMTP id
 b6-20020a170902bd4600b001cf896fd6c5mr18940725plx.41.1701286839814; 
 Wed, 29 Nov 2023 11:40:39 -0800 (PST)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:0:1000:8411:7782:28f:d123:243d])
 by smtp.gmail.com with ESMTPSA id
 h12-20020a170902748c00b001c9d011581dsm12640601pll.164.2023.11.29.11.40.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 11:40:39 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Wed, 29 Nov 2023 11:40:33 -0800
Message-ID: <20231129194033.999207-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong fsck doesn't support adding inodes to
 inline
 dentries. So, need to convert inline lost+found dentry before adding missing
 inodes. Signed-off-by: Daeho Jeong --- fsck/fsck.c | 8 ++++++++ fsck/fsck.h
 | 4 ++++ 2 files changed, 12 insertions(+) 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.175 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.175 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r8QQP-0006SA-Ij
Subject: [f2fs-dev] [PATCH] f2fs-tools: convert lost+found dir to regular
 dentry before adding nodes
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

fsck doesn't support adding inodes to inline dentries. So, need to
convert inline lost+found dentry before adding missing inodes.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fsck/fsck.c | 8 ++++++++
 fsck/fsck.h | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 55eddca..f40b4cd 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -2849,6 +2849,14 @@ static struct f2fs_node *fsck_get_lpf(struct f2fs_sb_info *sbi)
 			/* FIXME: give up? */
 			goto out;
 		}
+
+		/* Must convert inline dentry before adding inodes */
+		err = convert_inline_dentry(sbi, node, ni.blk_addr);
+		if (err) {
+			MSG(0, "Convert inline dentry for ino=%x failed.\n",
+					lpf_ino);
+			goto out;
+		}
 	} else { /* not found, create it */
 		struct dentry de;
 
diff --git a/fsck/fsck.h b/fsck/fsck.h
index f6f15e7..d6abf18 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -330,4 +330,8 @@ void *read_all_xattrs(struct f2fs_sb_info *, struct f2fs_node *, bool);
 void write_all_xattrs(struct f2fs_sb_info *sbi,
 		struct f2fs_node *inode, __u32 hsize, void *txattr_addr);
 
+/* dir.c */
+int convert_inline_dentry(struct f2fs_sb_info *sbi, struct f2fs_node *node,
+		block_t p_blkaddr);
+
 #endif /* _FSCK_H_ */
-- 
2.43.0.rc2.451.g8631bc7472-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
