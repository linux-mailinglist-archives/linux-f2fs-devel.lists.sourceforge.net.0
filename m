Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B62A0CE9D96
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Dec 2025 15:03:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M68Xh5HRTpLVoXL5Ev4LH9WTsx+RXEFIRKzA5fmsJkU=; b=G7HBNsPRTIOlg2ZcQFKEwNqF0t
	yBsW2sqAslcSEmPKe8F9XsqQYVCFBiOOc369IqRl3pPVf+/byJBTvAAxjcDp8gJTbOmiAVTxhmAdv
	THGeoyG7XyptHQamM+PrPpCM77QgmQ6tGKnkzeyAn6o346svDIQqfhG2aPRRv6km6ats=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vaaJU-0005Ya-4k;
	Tue, 30 Dec 2025 14:03:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <swilczek.lx@gmail.com>) id 1vaaJT-0005YQ-5K
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Dec 2025 14:03:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xjvvj0Zp85j/nukQaHBLs/CSvYPHaBwiCii1GR1u7Rc=; b=DSX+dPtdPWTP4K3lL3bII77lIj
 o/b5rvDnHC5I2DVGMuNb1T3egwsGn4Q7g/PQp/FvQ2F84BAYoS4C342qRL3rO/SPpXHdsjh7qdJr1
 hMZQ7tXOC/DaWvN8vihA1UOeDB9ZFkx3QintyNarNtgia4vGTMGv3yU4Egc6AhHCDhBI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xjvvj0Zp85j/nukQaHBLs/CSvYPHaBwiCii1GR1u7Rc=; b=C
 EdgGKYnC1YFid5JMr4AkN9t6N+Jo7YK6zvHMq3FTXXVhF+qAepSqCtpmHHNIBCgloi43KkS5+49qt
 v50WgWsV63Po0t5Kgjk+SJZxXKWLp0hgUNy5+qWoQCHePQ65I60eFYS0ZhggrImpku7RPw/nYAqvw
 cCimoahIH+DzpNGg=;
Received: from mail-ed1-f46.google.com ([209.85.208.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vaaJT-0006Jo-BZ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Dec 2025 14:03:03 +0000
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-64b4f730a02so16631324a12.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 30 Dec 2025 06:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767103372; x=1767708172; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xjvvj0Zp85j/nukQaHBLs/CSvYPHaBwiCii1GR1u7Rc=;
 b=SrJQLSw5ZslNZ1Or+J1D9LEE3bdabc2qafol5fjrrCjP3oDBAZiNkL5L5M75ONsbKt
 0mrd0rY3ACcpSfwkc0cV/MXBMdNhhAMD5z4E/Z5YX0jR8FSkWNapjmLnlCwQ9Q+lK7eb
 3gLpsyBvZ2V5HeTqVGV4ZHJ19hb86F+NhRIkxtSo+aXJuvX0fVipM19ECpuftb8UlZB2
 oAPuC5S4Pi9h7awx4V55nquuY0i6xnFnUqvP7QUuNJHqOqZXwqhJuFvcWE1zDjaxuiFB
 7teZ8kAz5aCSGMB0zOI9+fh9HMT5A3tS3h619ALjXe2XIHH29CWVuUjpf5s//crNECFY
 hRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767103372; x=1767708172;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xjvvj0Zp85j/nukQaHBLs/CSvYPHaBwiCii1GR1u7Rc=;
 b=Ks0PYx0QH8YfBRBup2Oof9TikXJc4LZfLDo8j047xoydBw1iGnCQ7dv8NaLU589DIK
 2FSz4Xev6JMQujLbmimk1/6sPqZDiyqkANK5XNV4Mur6lgDaZizOovRdmea6FwQKT7dl
 vhCRR38o6OMl1tCQSpLfKqJeIrbqSMYSdSPkWq1RAqWbqRAe36PJ6f1XOKXKuL+pAeUT
 86jR+9Yv4NQaErEockOHy5QF8YmJAD4SO5ZDQOz3F2zvM1o9ZkX/cyXMlaC0V9ssf13W
 q8FEAyfIZ10dZ+vlNEJE6ocFj9sdC7qMNy85hMbR73tEviJYdnJSfBlJFzvKFbBRWmQG
 SpdA==
X-Gm-Message-State: AOJu0YzYsB440DHKb1ITqDp9GVvZ73NOEL3yT17FWIcVwXy98iYGT5mq
 Fhx7WTJcmuADTQSCmzAwZQHFSEg8B4/fyiEzSEhMLJhC7OO7Gvi6c+mnGLuH3SzQ
X-Gm-Gg: AY/fxX6s3CsroCskOfPt49gKA0ayn/kQhMgvSRX3CRurED9oGrjbuIc//RF9G0yggVS
 JeqpLwyJq9MynYoF6L3DyC70nMjO2U3XhBMSx5LtbwBKzttKFhAvIMKOdkbb9520rl8nMAiqLci
 qmVhjQ7xmvgh+n+Wd98PiFEBc2JjIqyQbBWUt0aaGqnXfrlmjNzObK3FOfOZFuP8sV/4iwx7/Wm
 vIdAqGJhs+qNOB/rVianCMq3sAWOVqV3XlZuVCWJ/4zvlJSa2Gjii8saOMeNTbxjxdH4oxewj3U
 T/TbkTo2NWwvLn8QqWhSOJRJuJIfrt0d0pAEOrYnFAGaMiimbFcF4v0wknkSf/sYohtigPppF7Z
 ccl4Vr2CtiTyYzZBC4Eg3zc8SrE77Mb17po3euBxAlQKNEl0OpQ904Y5GP2eKX9OtTQyogBTpKH
 x8IPKdAw4dup/r6A==
X-Google-Smtp-Source: AGHT+IFi5P/pn2AAVbkj5zoscY/l1HzUz7YnghG1nuIjHfS+KuthtLkcD+u3Lf3LyTmn3ZFVGyXtsQ==
X-Received: by 2002:a05:6402:1474:b0:64b:588b:4375 with SMTP id
 4fb4d7f45d1cf-64b8eb62574mr32408947a12.2.1767103371599; 
 Tue, 30 Dec 2025 06:02:51 -0800 (PST)
Received: from prometheus ([85.11.110.37]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b9ef904bcsm34374444a12.22.2025.12.30.06.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 06:02:51 -0800 (PST)
From: Szymon Wilczek <swilczek.lx@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 30 Dec 2025 15:02:41 +0100
Message-ID: <20251230140241.65820-1-swilczek.lx@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Syzbot reported a slab-use-after-free issue in
 f2fs_write_end_io():
 BUG: KASAN: slab-use-after-free in f2fs_write_end_io+0x9b9/0xb60 Read of
 size 4 at addr ffff88804357d170 by task kworker/u4:4/45 The race condition
 occurs between the filesystem unmount path (kill_f2fs_super) and the
 asynchronous I/O completion handler (f2fs_write_end_io). 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [swilczek.lx(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.46 listed in wl.mailspike.net]
X-Headers-End: 1vaaJT-0006Jo-BZ
Subject: [f2fs-dev] [PATCH v4] f2fs: fix use-after-free in f2fs_write_end_io
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
Cc: syzbot+b4444e3c972a7a124187@syzkaller.appspotmail.com,
 Szymon Wilczek <swilczek.lx@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Syzbot reported a slab-use-after-free issue in f2fs_write_end_io():

BUG: KASAN: slab-use-after-free in f2fs_write_end_io+0x9b9/0xb60
Read of size 4 at addr ffff88804357d170 by task kworker/u4:4/45

The race condition occurs between the filesystem unmount path
(kill_f2fs_super) and the asynchronous I/O completion handler
(f2fs_write_end_io).

When unmounting, kill_f2fs_super() frees the sbi structure. However,
if the bio completion callback f2fs_write_end_io() is still running
in softirq context, it may access sbi->cp_wait after sbi has been
freed, causing a use-after-free.

Fix this by calling synchronize_rcu() before kfree(sbi). Since
bio completion callbacks run in softirq context, which is an implicit
RCU read-side critical section, synchronize_rcu() ensures all
in-flight callbacks have completed before we free sbi.

Reported-by: syzbot+b4444e3c972a7a124187@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug\?extid\=b4444e3c972a7a124187
Signed-off-by: Szymon Wilczek <swilczek.lx@gmail.com>
---
v4: Removed f2fs_wait_on_all_pages() call as pointed out by Chao Yu that
    it accesses sbi->write_io which has already been freed in f2fs_put_super().
v3: Simplified to minimal fix - only super.c change with synchronize_rcu(),
    as pointed out by Chao Yu that data.c changes are not necessary since
    synchronize_rcu() alone guarantees sbi won't be freed before callbacks
    complete.
v2: Add synchronize_rcu() to wait for softirq bio callbacks to complete.
 fs/f2fs/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index c4c225e09dc4..dfa3c76c6f2a 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -5454,6 +5454,7 @@ static void kill_f2fs_super(struct super_block *sb)
 	kill_block_super(sb);
 	/* Release block devices last, after fscrypt_destroy_keyring(). */
 	if (sbi) {
+		synchronize_rcu();
 		destroy_device_list(sbi);
 		kfree(sbi);
 		sb->s_fs_info = NULL;
-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
