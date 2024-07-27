Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8242E93DD74
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Jul 2024 07:57:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sXaQr-0000JI-2h;
	Sat, 27 Jul 2024 05:57:29 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <eadavis@qq.com>) id 1sXaQo-0000J0-MZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Jul 2024 05:57:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Date:Subject:Cc:To:From:Message-ID:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zbSS+ajYypXg92Z/q7nSeFt+R/QQz5CJOPsbYcOtdj0=; b=JstkTxG+p/1nwVJyNmjxUzBMbb
 pKtNeZmvkFsqEKnJviaMPK8L9h3P7LKkxuE6aqj12I0dxgy0jy5RsZm/CAqxwBnwE3JSOxmLOAdCy
 b+XPf1MJXD6EmBqAoJdHMWdIvi7KGjFS/3DImx/Ev8iUWrXRhyqenqsWr4ZV5zyO6bAI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Date:
 Subject:Cc:To:From:Message-ID:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zbSS+ajYypXg92Z/q7nSeFt+R/QQz5CJOPsbYcOtdj0=; b=and59Lm8VOizOsoAi9BRUbTlsW
 XBi5aVN66hcBuz6hJ+C0btIwOi8p/2vxPihwkv9F28zPv7BvNpqg8gfvhYazRN+udEr0yaKnGlCkv
 /Bb1gbFuPAF0ti1Ztjpia+UswOOq5nRbaWNzXvrvwLaO5vLkIcpoccQfrO3/oZI8AVzA=;
Received: from out162-62-57-210.mail.qq.com ([162.62.57.210])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sXaQn-00064I-9c for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Jul 2024 05:57:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1722059814; bh=zbSS+ajYypXg92Z/q7nSeFt+R/QQz5CJOPsbYcOtdj0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=YKiiuvPIrulqAnZpFnppaTaafXLQ5eVYno+R2a1aalQCyOcUsUFyKZqI992+qqbPD
 1ZqSzA3XswROgSicqQqXr3nZ4yx9di2UD8qbAhExjJvvAhgamphgMRt1ZARzzbWqio
 u08TjVJDnyaM1KFqC8zL54my+TCWZUteOFZ8LnL0=
Received: from pek-lxu-l1.wrs.com ([111.198.228.103])
 by newxmesmtplogicsvrszb16-1.qq.com (NewEsmtp) with SMTP
 id E342E056; Sat, 27 Jul 2024 13:56:52 +0800
X-QQ-mid: xmsmtpt1722059812tjpbhik0q
Message-ID: <tencent_CA1DBB2E333C9E521B814B291BDA25D7BA08@qq.com>
X-QQ-XMAILINFO: MdoRYM9mYrydMDhbCpm8ury3tFQsl48ql/AgBElB1v2x9S06raK/RrIkgwRZfn
 MYz5x0TEA+128JO8j7/zVqJvcdRCU1M0BkydoPJIlZTTAtQ1EJBxkJuBsRHxhlSm0ntZtKuuQn+Q
 vdOvRFiRnZHMmsTBfPHtT9943DSwvAV+qv+8u6qKALJsbW6gbep4D5bprvs1MhebHzWvsMlHvugu
 QlqcV0ZUVXp7uAgkPcuC3JQdUkmM1c67gm3NAO0XA6GR72/MxuuLSN8wQ2ssCp6yyo9HWUk4cMmM
 S0LDEmqWMiFipHijj9lvEv4KPDGLJIO/ahCM6r4t0JE59bq0H8iHkfsYCNluNT74ilwhIAtBHqIv
 BTbeLKOAvv3WL2yqOMpXPS0ezS7cIJ1ZML5oy2EKhalfezQRV4iZBo5IA2BPnwlA+sRjD1byV773
 YTFZQm30vlKVcPjsCh/toesg/5xtbPLJhZp7VFVWxETIGK8EcIB8OIPp0GZHWCHJga8leIybsgzG
 P3BPk4nHt4l7QrrSowyt92YJ/JdeN6gTZk3Ptdkad3FamnaA3NnguTht3WeGG04tJQ8jE4KqJrjR
 Wf5Deo+Pq0FeuJ1aLPIC1QF9N4HkRW7qlqfE/yxa42IvflHi6/P9a389+/l6JHQsi8GAPM4P+C4d
 hcJf74tIUepBjkurHpFWiVsjvCn6Xdg8nmtGzm+mqj1ynigYvtS8tP56E19d2LB5ih4cJzBONEYW
 iHl4/dc+oOO7dcWUCO4R2JSu6mTgOA7GUE1WdR06lWFwkxwWP8NM4MT3UZ0MrczVjnJB7dJUqKkG
 jVI9Qpeepz3ufF31gRGC7ZPmFLTuRYlld7KC7EOB3wg4w0AQmJqVPulcZqsGPVEV5jCgEawmG66Q
 g5zilatLdRcWlgj3jnpj3ntQKfeWIDVIy/CVWhHdyIlvevSJGYry9PpSHjCN+pW7hYiXYiHPt4
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
To: syzbot+1a8e2b31f2ac9bd3d148@syzkaller.appspotmail.com
Date: Sat, 27 Jul 2024 13:56:53 +0800
X-OQ-MSGID: <20240727055652.2700649-2-eadavis@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <0000000000005c7ccb061e032b9b@google.com>
References: <0000000000005c7ccb061e032b9b@google.com>
MIME-Version: 1.0
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  syzbot report null-ptr-deref Write in f2fs_stop_gc_thread,
 because shutdown and remount can cause multi-path entry into
 f2fs_stop_gc_thread, 
 resulting in incorrect access to f2fs_gc_task before it is [...] 
 Content analysis details:   (0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: syzkaller.appspot.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [162.62.57.210 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [162.62.57.210 listed in sa-trusted.bondedsender.org]
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [eadavis[at]qq.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [162.62.57.210 listed in wl.mailspike.net]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [162.62.57.210 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.4 RDNS_DYNAMIC           Delivered to internal network by host with
 dynamic-looking rDNS
 3.2 HELO_DYNAMIC_IPADDR    Relay HELO'd using suspicious hostname (IP
 addr 1)
X-Headers-End: 1sXaQn-00064I-9c
Subject: [f2fs-dev] [PATCH] f2fs: Add mutex to prevent gc task from being
 accessed before initialization
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
From: Edward Adam Davis via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Edward Adam Davis <eadavis@qq.com>
Cc: daehojeong@google.com, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

syzbot report null-ptr-deref Write in f2fs_stop_gc_thread, because 
shutdown and remount can cause multi-path entry into f2fs_stop_gc_thread,
resulting in incorrect access to f2fs_gc_task before it is properly
initialized.

Reported-and-tested-by: syzbot+1a8e2b31f2ac9bd3d148@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1a8e2b31f2ac9bd3d148
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 fs/f2fs/gc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 6066c6eecf41..a624e8271fbc 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -27,6 +27,7 @@ static struct kmem_cache *victim_entry_slab;
 
 static unsigned int count_bits(const unsigned long *addr,
 				unsigned int offset, unsigned int len);
+static DEFINE_MUTEX(gc_lock);
 
 static int gc_thread_func(void *data)
 {
@@ -203,10 +204,13 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
 
 void f2fs_stop_gc_thread(struct f2fs_sb_info *sbi)
 {
-	struct f2fs_gc_kthread *gc_th = sbi->gc_thread;
+	struct f2fs_gc_kthread *gc_th;
 
-	if (!gc_th)
+	guard(mutex)(&gc_lock);
+	gc_th = sbi->gc_thread;
+	if (!gc_th || gc_th->f2fs_gc_task < PAGE_OFFSET)
 		return;
+
 	kthread_stop(gc_th->f2fs_gc_task);
 	wake_up_all(&gc_th->fggc_wq);
 	kfree(gc_th);
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
