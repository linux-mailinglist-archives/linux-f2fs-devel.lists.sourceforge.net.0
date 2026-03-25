Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIvCFEjxw2lZvAQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Mar 2026 15:29:28 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6D3326C6C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Mar 2026 15:29:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FPoe6W8jH7sjAjLCl1h6c6dkKzN0ZD0jm21CTpQHloE=; b=KBEXdIFVvoAVkPVxfL7qDkjZD6
	/1+lA+CcLxLG9rCgQl6cvSf9xUxaP5SEy9dCmUtn7I9paP44V0E0DzxSubgYf4cH2PMIwM1Nohuzv
	Qp8AyLcYzXqzzac7rxCiBtmFh0diVGFLLyFnABn1RphW5saPhklS+7VxBH4PEEpNS7Ys=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w5PEN-00042O-0W;
	Wed, 25 Mar 2026 14:29:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ruipengqi3@gmail.com>) id 1w5PEL-000429-Mv
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Mar 2026 14:29:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=quuphkWaGWdwrJTlaMXOLCqKrD2sqqcG1Ts3xWVLG0U=; b=KAVuoxrb1Ahj49p9LCu5GAwNxr
 8nLqBvS2sur2vvZD18jm2qKPuCo+jv3YoFJQhAwFUKZvv1e3mTQsw2XA5fCAZC9Ke4ED5DdMDzO3S
 Y9FCAlRAn+ROuJjRXLyToGDAAQek8Dvo8H1N5RjLmsI38W2MzSMdj+eVDl/NzUW/zU38=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=quuphkWaGWdwrJTlaMXOLCqKrD2sqqcG1Ts3xWVLG0U=; b=F
 MF5i/iyZUx8FNqcoUhn0tqmJc6GerMTW2CFS951atdZFNLUBvSNLGGgv4kr48OYT3rJsKD7pLa9/z
 dCh7EHjJWu8iY/SZQyaiiP4dFLIZD9rQwpoF9ItAhidRQzAVQpUP5YCVnRqoJLDOUSiY9mPfp8Wml
 +MqNrMotN5CZcEAw=;
Received: from mail-pg1-f175.google.com ([209.85.215.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1w5PEL-0000pz-LE for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Mar 2026 14:29:10 +0000
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-c766cf593daso453770a12.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 Mar 2026 07:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774448944; x=1775053744; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=quuphkWaGWdwrJTlaMXOLCqKrD2sqqcG1Ts3xWVLG0U=;
 b=P7ebSxCIfo86o4Ko+mPoLLPTmWPEj4YllqDqfxFlkFU7qMGuw9Ja7nWqsQh3/Uy7Y0
 /MuaM6j4EKyZ6FQx5Eu/VZnZQqvyp2Z06DI96+rHsN6grMkHSewBrBkK+XXwmwzpZy/P
 KOujHog+/KrRDVIzOHLaI+TI2s8aNgu+F+8ZKgA0gY8x4NvDCQbxaXjE+QgeyZko50V5
 rE/L2cVSOZ6D2xnI6sLGmhxS8d8vYPPshEOUnksR1BM/Jf90Qf2ZW3ZRFPmR0NphGuqE
 FAhpDmvARnvtuZrTVBntfltKYyuF8UIUNvsjKnXXVJyWOjxPwJBLHqLeeKhP5YOxdXOF
 ykJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774448944; x=1775053744;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=quuphkWaGWdwrJTlaMXOLCqKrD2sqqcG1Ts3xWVLG0U=;
 b=CEApKW7SxIAGfYhSw7eqdZt2eMmTn3Qn7m9PiYsW91oe6XnnsXeZlS83zFgsCZQAOY
 Lkq8wvHIx5+4zzN64XE+5bxKzV8/Dwd/eMFO6wgcf0KPR8SlmRo+pqYClZy+R+3nSuCr
 ca42TXyaZZQKKvQqHSCeJbdDQcXok0E6zFMN8ubpNoNui2ye7qkHnZM7xHe2cvGhy58A
 Zr4ze9EdCaAO1qAlhPD8NTZStsQG5NnKVydS2C3P9CQ6Zc45gCloAjmhkgI4UkWVxbg0
 KgJrUaNQIFzs8t/p7w6LH4DB94k6ciNFQ/sjG7kOMBAYeN7acircWzAqvdrm+2kyIA4g
 u4wA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7jjVFTpXuAzJBIPnymST5aXsIeHKN8lpG7pHvw3rTTXi1LUx1jtU7ELXSd8Sq4Dl/yZ2xpHOPPHusTl1U5bmp@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwcgiapghJXYCOMqA3quHOMRz2uo353njFO/YmcpXYSQyBt2k3t
 6B2YTnTsEWJtix89DX5o/+C4cY6qRyILVIIXD11aYWB8eUVtV9gRjzrYwZOkHa2/FU8=
X-Gm-Gg: ATEYQzyWTDb6z/jFThnVMvjl4ZR4yCMwAHpqM0yGX6ht4hRltt8iBQYAgELi2QBwbyI
 f50RP93DSpGyjRC2LshDHQUFtb6qgDHA5LhoswSmcE3/0NKN78nm+pwwkJJjaD2p7c3ztJKEvqO
 BsUzPyLNPjGDQttegdwjJVRMbf6Au8wgHEXxxShsIEuGtr4vGIKEdbkoWl1yhZSsdCPs/p8M1Sf
 Nv8KqN9E8MMyRZ7Kcq7Q2cYq17IIdYbuEWhijcp4nbdd3WEaJhOQi3zcu6eomY9n5C19EF39kdQ
 A1pbUu9ayRPVT7ZjPuVB3t71aVsqcZjNqVmLuRuuAatjE268mbi0PDbN53Kf722alO367ZAZbXY
 3BpdWFXO18ivbw0TXFCuLk+tCq608hb+4a8udNQhkyQTTDcDN78svDHF9oQDrpra+d8FBdP62pl
 LdUyu6kgrgebAL9S6Ew2aDp2olXYvJK0vAu8CssZN0YtnsAMNadyKfKhdPbG1lp8FCAzw=
X-Received: by 2002:a17:903:2f50:b0:2ae:593c:48fe with SMTP id
 d9443c01a7336-2b0b09e6752mr37736355ad.13.1774445617515; 
 Wed, 25 Mar 2026 06:33:37 -0700 (PDT)
Received: from lixiang-ThinkCentre-M755e-N000.company.local ([210.184.73.204])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b08355f994sm182631555ad.36.2026.03.25.06.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2026 06:33:36 -0700 (PDT)
From: ruipengqi <ruipengqi3@gmail.com>
To: jaegeuk@kernel.org
Date: Wed, 25 Mar 2026 21:33:22 +0800
Message-Id: <20260325133322.1050573-1-ruipengqi3@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Lance Yang Patch series "hung_task: extend blocking
 task stacktrace dump to semaphore", v5. Inspired by mutex blocker tracking[1], 
 this patch series extend the feature to not only dump the blocker task holding
 a mutex but also to support semaphores. Unlike mutexes,
 semaphores lack explicit o [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [ruipengqi3(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [ruipengqi3(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.175 listed in wl.mailspike.net]
X-Headers-End: 1w5PEL-0000pz-LE
Subject: [f2fs-dev] [PATCH 1/2] hung_task: replace blocker_mutex with
 encoded blocker
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
Cc: Anna Schumaker <anna.schumaker@oracle.com>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Yongliang Gao <leonylgao@tencent.com>, Peter Zijlstra <peterz@infradead.org>,
 Lance Yang <ioworker0@gmail.com>, linux-kernel@vger.kernel.org,
 Joel Granados <joel.granados@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net,
 Sergey Senozhatsky <senozhatsky@chromium.org>, Ingo Molnar <mingo@redhat.com>,
 John Stultz <jstultz@google.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Waiman Long <longman@redhat.com>, Zi Li <amaindex@outlook.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Andrew Morton <akpm@linux-foundation.org>, Tomasz Figa <tfiga@chromium.org>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Mingzhe Yang <mingzhe.yang@ly.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [1.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:anna.schumaker@oracle.com,m:kent.overstreet@linux.dev,m:leonylgao@tencent.com,m:peterz@infradead.org,m:ioworker0@gmail.com,m:linux-kernel@vger.kernel.org,m:joel.granados@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:senozhatsky@chromium.org,m:mingo@redhat.com,m:jstultz@google.com,m:mhiramat@kernel.org,m:longman@redhat.com,m:amaindex@outlook.com,m:rostedt@goodmis.org,m:akpm@linux-foundation.org,m:tfiga@chromium.org,m:will@kernel.org,m:boqun.feng@gmail.com,m:mingzhe.yang@ly.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ruipengqi3@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruipengqi3@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[oracle.com,linux.dev,tencent.com,infradead.org,gmail.com,vger.kernel.org,kernel.org,lists.sourceforge.net,chromium.org,redhat.com,google.com,outlook.com,goodmis.org,linux-foundation.org,ly.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 0B6D3326C6C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lance Yang <ioworker0@gmail.com>

Patch series "hung_task: extend blocking task stacktrace dump to
semaphore", v5.

Inspired by mutex blocker tracking[1], this patch series extend the
feature to not only dump the blocker task holding a mutex but also to
support semaphores.  Unlike mutexes, semaphores lack explicit ownership
tracking, making it challenging to identify the root cause of hangs.  To
address this, we introduce a last_holder field to the semaphore structure,
which is updated when a task successfully calls down() and cleared during
up().

The assumption is that if a task is blocked on a semaphore, the holders
must not have released it.  While this does not guarantee that the last
holder is one of the current blockers, it likely provides a practical hint
for diagnosing semaphore-related stalls.

With this change, the hung task detector can now show blocker task's info
like below:

[Tue Apr  8 12:19:07 2025] INFO: task cat:945 blocked for more than 120 seconds.
[Tue Apr  8 12:19:07 2025]       Tainted: G            E      6.14.0-rc6+ #1
[Tue Apr  8 12:19:07 2025] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[Tue Apr  8 12:19:07 2025] task:cat             state:D stack:0     pid:945   tgid:945   ppid:828    task_flags:0x400000 flags:0x00000000
[Tue Apr  8 12:19:07 2025] Call Trace:
[Tue Apr  8 12:19:07 2025]  <TASK>
[Tue Apr  8 12:19:07 2025]  __schedule+0x491/0xbd0
[Tue Apr  8 12:19:07 2025]  schedule+0x27/0xf0
[Tue Apr  8 12:19:07 2025]  schedule_timeout+0xe3/0xf0
[Tue Apr  8 12:19:07 2025]  ? __folio_mod_stat+0x2a/0x80
[Tue Apr  8 12:19:07 2025]  ? set_ptes.constprop.0+0x27/0x90
[Tue Apr  8 12:19:07 2025]  __down_common+0x155/0x280
[Tue Apr  8 12:19:07 2025]  down+0x53/0x70
[Tue Apr  8 12:19:07 2025]  read_dummy_semaphore+0x23/0x60
[Tue Apr  8 12:19:07 2025]  full_proxy_read+0x5f/0xa0
[Tue Apr  8 12:19:07 2025]  vfs_read+0xbc/0x350
[Tue Apr  8 12:19:07 2025]  ? __count_memcg_events+0xa5/0x140
[Tue Apr  8 12:19:07 2025]  ? count_memcg_events.constprop.0+0x1a/0x30
[Tue Apr  8 12:19:07 2025]  ? handle_mm_fault+0x180/0x260
[Tue Apr  8 12:19:07 2025]  ksys_read+0x66/0xe0
[Tue Apr  8 12:19:07 2025]  do_syscall_64+0x51/0x120
[Tue Apr  8 12:19:07 2025]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[Tue Apr  8 12:19:07 2025] RIP: 0033:0x7f419478f46e
[Tue Apr  8 12:19:07 2025] RSP: 002b:00007fff1c4d2668 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
[Tue Apr  8 12:19:07 2025] RAX: ffffffffffffffda RBX: 0000000000020000 RCX: 00007f419478f46e
[Tue Apr  8 12:19:07 2025] RDX: 0000000000020000 RSI: 00007f4194683000 RDI: 0000000000000003
[Tue Apr  8 12:19:07 2025] RBP: 00007f4194683000 R08: 00007f4194682010 R09: 0000000000000000
[Tue Apr  8 12:19:07 2025] R10: fffffffffffffbc5 R11: 0000000000000246 R12: 0000000000000000
[Tue Apr  8 12:19:07 2025] R13: 0000000000000003 R14: 0000000000020000 R15: 0000000000020000
[Tue Apr  8 12:19:07 2025]  </TASK>
[Tue Apr  8 12:19:07 2025] INFO: task cat:945 blocked on a semaphore likely last held by task cat:938
[Tue Apr  8 12:19:07 2025] task:cat             state:S stack:0     pid:938   tgid:938   ppid:584    task_flags:0x400000 flags:0x00000000
[Tue Apr  8 12:19:07 2025] Call Trace:
[Tue Apr  8 12:19:07 2025]  <TASK>
[Tue Apr  8 12:19:07 2025]  __schedule+0x491/0xbd0
[Tue Apr  8 12:19:07 2025]  ? _raw_spin_unlock_irqrestore+0xe/0x40
[Tue Apr  8 12:19:07 2025]  schedule+0x27/0xf0
[Tue Apr  8 12:19:07 2025]  schedule_timeout+0x77/0xf0
[Tue Apr  8 12:19:07 2025]  ? __pfx_process_timeout+0x10/0x10
[Tue Apr  8 12:19:07 2025]  msleep_interruptible+0x49/0x60
[Tue Apr  8 12:19:07 2025]  read_dummy_semaphore+0x2d/0x60
[Tue Apr  8 12:19:07 2025]  full_proxy_read+0x5f/0xa0
[Tue Apr  8 12:19:07 2025]  vfs_read+0xbc/0x350
[Tue Apr  8 12:19:07 2025]  ? __count_memcg_events+0xa5/0x140
[Tue Apr  8 12:19:07 2025]  ? count_memcg_events.constprop.0+0x1a/0x30
[Tue Apr  8 12:19:07 2025]  ? handle_mm_fault+0x180/0x260
[Tue Apr  8 12:19:07 2025]  ksys_read+0x66/0xe0
[Tue Apr  8 12:19:07 2025]  do_syscall_64+0x51/0x120
[Tue Apr  8 12:19:07 2025]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[Tue Apr  8 12:19:07 2025] RIP: 0033:0x7f7c584a646e
[Tue Apr  8 12:19:07 2025] RSP: 002b:00007ffdba8ce158 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
[Tue Apr  8 12:19:07 2025] RAX: ffffffffffffffda RBX: 0000000000020000 RCX: 00007f7c584a646e
[Tue Apr  8 12:19:07 2025] RDX: 0000000000020000 RSI: 00007f7c5839a000 RDI: 0000000000000003
[Tue Apr  8 12:19:07 2025] RBP: 00007f7c5839a000 R08: 00007f7c58399010 R09: 0000000000000000
[Tue Apr  8 12:19:07 2025] R10: fffffffffffffbc5 R11: 0000000000000246 R12: 0000000000000000
[Tue Apr  8 12:19:07 2025] R13: 0000000000000003 R14: 0000000000020000 R15: 0000000000020000
[Tue Apr  8 12:19:07 2025]  </TASK>


This patch (of 3):

This patch replaces 'struct mutex *blocker_mutex' with 'unsigned long
blocker', as only one blocker is active at a time.

The blocker filed can store both the lock addrees and the lock type, with
LSB used to encode the type as Masami suggested, making it easier to
extend the feature to cover other types of locks.

Also, once the lock type is determined, we can directly extract the
address and cast it to a lock pointer ;)

Link: https://lkml.kernel.org/r/20250414145945.84916-1-ioworker0@gmail.com
Link: https://lore.kernel.org/all/174046694331.2194069.15472952050240807469.stgit@mhiramat.tok.corp.google.com [1]
Link: https://lkml.kernel.org/r/20250414145945.84916-2-ioworker0@gmail.com
Signed-off-by: Mingzhe Yang <mingzhe.yang@ly.com>
Signed-off-by: Lance Yang <ioworker0@gmail.com>
Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Suggested-by: Andrew Morton <akpm@linux-foundation.org>
Suggested-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Cc: Anna Schumaker <anna.schumaker@oracle.com>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Joel Granados <joel.granados@kernel.org>
Cc: John Stultz <jstultz@google.com>
Cc: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Tomasz Figa <tfiga@chromium.org>
Cc: Waiman Long <longman@redhat.com>
Cc: Will Deacon <will@kernel.org>
Cc: Yongliang Gao <leonylgao@tencent.com>
Cc: Zi Li <amaindex@outlook.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---
 include/linux/hung_task.h | 99 +++++++++++++++++++++++++++++++++++++++
 include/linux/sched.h     |  6 ++-
 kernel/hung_task.c        | 13 +++--
 kernel/locking/mutex.c    |  5 +-
 4 files changed, 115 insertions(+), 8 deletions(-)
 create mode 100644 include/linux/hung_task.h

diff --git a/include/linux/hung_task.h b/include/linux/hung_task.h
new file mode 100644
index 000000000000..1bc2b3244613
--- /dev/null
+++ b/include/linux/hung_task.h
@@ -0,0 +1,99 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Detect Hung Task: detecting tasks stuck in D state
+ *
+ * Copyright (C) 2025 Tongcheng Travel (www.ly.com)
+ * Author: Lance Yang <mingzhe.yang@ly.com>
+ */
+#ifndef __LINUX_HUNG_TASK_H
+#define __LINUX_HUNG_TASK_H
+
+#include <linux/bug.h>
+#include <linux/sched.h>
+#include <linux/compiler.h>
+
+/*
+ * @blocker: Combines lock address and blocking type.
+ *
+ * Since lock pointers are at least 4-byte aligned(32-bit) or 8-byte
+ * aligned(64-bit). This leaves the 2 least bits (LSBs) of the pointer
+ * always zero. So we can use these bits to encode the specific blocking
+ * type.
+ *
+ * Type encoding:
+ * 00 - Blocked on mutex        (BLOCKER_TYPE_MUTEX)
+ * 01 - Blocked on semaphore    (BLOCKER_TYPE_SEM)
+ * 10 - Blocked on rt-mutex     (BLOCKER_TYPE_RTMUTEX)
+ * 11 - Blocked on rw-semaphore (BLOCKER_TYPE_RWSEM)
+ */
+#define BLOCKER_TYPE_MUTEX      0x00UL
+#define BLOCKER_TYPE_SEM        0x01UL
+#define BLOCKER_TYPE_RTMUTEX    0x02UL
+#define BLOCKER_TYPE_RWSEM      0x03UL
+
+#define BLOCKER_TYPE_MASK       0x03UL
+
+#ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
+static inline void hung_task_set_blocker(void *lock, unsigned long type)
+{
+	unsigned long lock_ptr = (unsigned long)lock;
+
+	WARN_ON_ONCE(!lock_ptr);
+	WARN_ON_ONCE(READ_ONCE(current->blocker));
+
+	/*
+	 * If the lock pointer matches the BLOCKER_TYPE_MASK, return
+	 * without writing anything.
+	 */
+	if (WARN_ON_ONCE(lock_ptr & BLOCKER_TYPE_MASK))
+		return;
+
+	WRITE_ONCE(current->blocker, lock_ptr | type);
+}
+
+static inline void hung_task_clear_blocker(void)
+{
+	WARN_ON_ONCE(!READ_ONCE(current->blocker));
+
+	WRITE_ONCE(current->blocker, 0UL);
+}
+
+/*
+ * hung_task_get_blocker_type - Extracts blocker type from encoded blocker
+ * address.
+ *
+ * @blocker: Blocker pointer with encoded type (via LSB bits)
+ *
+ * Returns: BLOCKER_TYPE_MUTEX, BLOCKER_TYPE_SEM, etc.
+ */
+static inline unsigned long hung_task_get_blocker_type(unsigned long blocker)
+{
+	WARN_ON_ONCE(!blocker);
+
+	return blocker & BLOCKER_TYPE_MASK;
+}
+
+static inline void *hung_task_blocker_to_lock(unsigned long blocker)
+{
+	WARN_ON_ONCE(!blocker);
+
+	return (void *)(blocker & ~BLOCKER_TYPE_MASK);
+}
+#else
+static inline void hung_task_set_blocker(void *lock, unsigned long type)
+{
+}
+static inline void hung_task_clear_blocker(void)
+{
+}
+static inline unsigned long hung_task_get_blocker_type(unsigned long blocker)
+{
+	return 0UL;
+}
+static inline void *hung_task_blocker_to_lock(unsigned long blocker)
+{
+	return NULL;
+}
+#endif
+
+#endif /* __LINUX_HUNG_TASK_H */
diff --git a/include/linux/sched.h b/include/linux/sched.h
index f96ac1982893..393d81978f40 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1240,7 +1240,11 @@ struct task_struct {
 #endif
 
 #ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
-	struct mutex			*blocker_mutex;
+	/*
+	 * Encoded lock address causing task block (lower 2 bits = type from
+	 * <linux/hung_task.h>). Accessed via hung_task_*() helpers.
+	 */
+	unsigned long			blocker;
 #endif
 
 #ifdef CONFIG_DEBUG_ATOMIC_SLEEP
diff --git a/kernel/hung_task.c b/kernel/hung_task.c
index dc898ec93463..79558d76ef06 100644
--- a/kernel/hung_task.c
+++ b/kernel/hung_task.c
@@ -22,6 +22,7 @@
 #include <linux/sched/signal.h>
 #include <linux/sched/debug.h>
 #include <linux/sched/sysctl.h>
+#include <linux/hung_task.h>
 
 #include <trace/events/sched.h>
 
@@ -98,16 +99,18 @@ static struct notifier_block panic_block = {
 static void debug_show_blocker(struct task_struct *task)
 {
 	struct task_struct *g, *t;
-	unsigned long owner;
-	struct mutex *lock;
+	unsigned long owner, blocker;
 
 	RCU_LOCKDEP_WARN(!rcu_read_lock_held(), "No rcu lock held");
 
-	lock = READ_ONCE(task->blocker_mutex);
-	if (!lock)
+	blocker = READ_ONCE(task->blocker);
+	if (!blocker ||
+	    hung_task_get_blocker_type(blocker) != BLOCKER_TYPE_MUTEX)
 		return;
 
-	owner = mutex_get_owner(lock);
+	owner = mutex_get_owner(
+		(struct mutex *)hung_task_blocker_to_lock(blocker));
+
 	if (unlikely(!owner)) {
 		pr_err("INFO: task %s:%d is blocked on a mutex, but the owner is not found.\n",
 			task->comm, task->pid);
diff --git a/kernel/locking/mutex.c b/kernel/locking/mutex.c
index 555e2b3a665a..61fa97da7989 100644
--- a/kernel/locking/mutex.c
+++ b/kernel/locking/mutex.c
@@ -29,6 +29,7 @@
 #include <linux/interrupt.h>
 #include <linux/debug_locks.h>
 #include <linux/osq_lock.h>
+#include <linux/hung_task.h>
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/lock.h>
@@ -191,7 +192,7 @@ __mutex_add_waiter(struct mutex *lock, struct mutex_waiter *waiter,
 		   struct list_head *list)
 {
 #ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
-	WRITE_ONCE(current->blocker_mutex, lock);
+	hung_task_set_blocker(lock, BLOCKER_TYPE_MUTEX);
 #endif
 	debug_mutex_add_waiter(lock, waiter, current);
 
@@ -209,7 +210,7 @@ __mutex_remove_waiter(struct mutex *lock, struct mutex_waiter *waiter)
 
 	debug_mutex_remove_waiter(lock, waiter, current);
 #ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
-	WRITE_ONCE(current->blocker_mutex, NULL);
+	hung_task_clear_blocker();
 #endif
 }
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
