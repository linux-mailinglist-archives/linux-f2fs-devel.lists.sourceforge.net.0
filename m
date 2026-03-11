Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAOBALhIsWlCtAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2026 11:49:28 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 450B82628AD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2026 11:49:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y5ZJCym6JQEzT7AmvKR161RGD8jw2dIPzPEHNJqhWqY=; b=PCpqI7ldMYrlI3DHbRmAreDSva
	8MRfH9sDqZYINKDytpfauggf8fEUWqTvOj5UwLrMku5t60C+P/0LTc2T5pM1H6XVRhbNCPOidwoup
	ts/xC/VR4OOzbbJFr6Gx4ZszxqePs28+9CqVB9ZkbNQ00KbveQ5Em5fHzq06GRdEAYHs=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0H7t-0007bd-2V;
	Wed, 11 Mar 2026 10:49:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangqing7171@gmail.com>) id 1w0H7q-0007bQ-Ub
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Mar 2026 10:49:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=icJ5IiXPMSMLmdnRhvkeTHga2mUYWqcZGNxqizcbQDw=; b=Em3qrhzdo8gv+e0tvHzT2Ibz8H
 nXv9YESwvs4cqE9k8K8HNUWO6a907gr4sLs0emtw4l0vWXW/3MdYg9tA1/E213rzWujlkpUQWQCiv
 I5fWoznUvaomMCH14JvNAVHrU49LeGqSg5/PfknNoxI3xDWBph6oJhDKdPwiVdWz6TLA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=icJ5IiXPMSMLmdnRhvkeTHga2mUYWqcZGNxqizcbQDw=; b=jqTh4zqF9j7/7e9CAthWOStlGn
 yZVO0ToNezi+/Mlfozj917UF5gfRjONUSoXIhTizzpJvNXY5/7puVR0jbW8xrdiYywAxIh+5IxaBg
 ZVl8BdwUb9Jts1SfuemzGJBUHEDVQSHf341EwV2QCXcS/6aPcSFgjtrw8P3tnwv0sq5o=;
Received: from mail-wm1-f67.google.com ([209.85.128.67])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1w0H7r-0005Yg-DW for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Mar 2026 10:49:15 +0000
Received: by mail-wm1-f67.google.com with SMTP id
 5b1f17b1804b1-48539d21b76so26315555e9.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 11 Mar 2026 03:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773226149; x=1773830949; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=icJ5IiXPMSMLmdnRhvkeTHga2mUYWqcZGNxqizcbQDw=;
 b=TCdihp8Bm9mGzdEGehMABY8dVHQf6EZWnQ5NzrnHKmYplOLQLpAx+KaNOrAUBURhtZ
 oif2GIEkuY9ID1pZHx49C6uHWY/jk6ZGm6MVEq2Erryxy22NWM77wpJQomh0gfBD8Ecn
 M2OSYTcNkoO4lor65/3GGwfvxVkc7N4yQbt5U1l3bKGBljphyxOlYt2Quw6f4/N/Dgjd
 7EL78n99O/LsSfMIEdPfK3c3Fm4dvbmAtQJmy45FNKysqqI5VHoF3y8nHQasnc3y2RK1
 8yfb4OUmS686fFpzJZx5VrJYB8xS52Z1GJTHeSpHYthZAmGEClmXwH1kssMkqvCpWSLA
 6Q6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773226149; x=1773830949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=icJ5IiXPMSMLmdnRhvkeTHga2mUYWqcZGNxqizcbQDw=;
 b=wbQ85a59BBYcjuLV+/4KkgwBJeqzw1OrLvsF2d0boATwckmEoUKFJDBOX5KLYQy42u
 3ZZakbr6baOF26dWnVzl8D7tHtIG+nRIGCn3PLRPm/pFeVvgZTBQSbC1t0YwWWDK41ub
 Kw55IVt6iQhkM+Ef4+g1+MhU0c/7wTkNBawLJGr5/ELB2tzQpUUW+11uDn3mYeefXzN+
 zbt3ZPF/kBSCXpg4KyyyHfdJbBTEIcx2rUFnBr5DtlBEwON7Gr5diGrRZsEzSFi2NugK
 0Mj5sf2KZhKNNP1OkoYTp/uuAACli8mE8qBvypTvgyuKz2qrVApCT9YWEZv9l3wf9WlV
 vGYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXn0183YV+JmvwFu+gaxWzjUYg+cnOoGr6e276Yvak3z/XDbmTaMCnK5AZrACBAOdIXHoaQOIJNmYjMLgPweh38@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyNcEAMinZbKlJOzuKi/MLrmjYIvDWNVrlqpF22rbOFS36M0YFa
 JSViVkkmJQd2CL5n3u8OlbtdLMrGR0posTMVCO0smQuxFKHQrxY/Nagj
X-Gm-Gg: ATEYQzxWAQEafi+qAVGAb3XgDnbzpBwrXtzOJ4sQQBMw5B+zmSQF7cOGHIt+rOKuuE8
 Phw6PvXbwNksv00HEVivxJNpZ0Me5o9Er7rLLDt+r2dc6PmdFu+NTvgTQuq4o6nBhWcb8ms4+kU
 6tX44EKtBs1A8sTJaG8I7Pk8pOEFCsLyK4fIP8qbRV+gadfCzI7OhCX4jO2tGE4cG6jZQ2NgB1o
 JSMBH/3bt5GVUSgWLsmH/uf0h2RIcVfBOEJE1c2Zg1jfnWLzc2gVKBg3p5yXZwetHDnifrq5q4c
 ykcF6AkPXbNxx/U0xbZc2Fu62YSZMO3aDeeqIdOWINwhN6k5jcYpX6MBDjSAxMT5gClShUTUjCJ
 x2ZmvEaadAUb0j7OU62OJCfCfeQQqJcI6eJRLZNzAm8pRqOiFzOBq6U1MBMXw7818isXibXZdSh
 Bhbh6dIXKsU4bLAfpEov8I05z3zHuH0LupDdl4EAcI4Kp/35m/rw==
X-Received: by 2002:a05:600c:a4b:b0:477:9b35:3e49 with SMTP id
 5b1f17b1804b1-4854b0a71f3mr37638525e9.3.1773226148617; 
 Wed, 11 Mar 2026 03:49:08 -0700 (PDT)
Received: from lima-ubuntu.hz.ali.com ([47.246.98.213])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854b0febd2sm15459265e9.32.2026.03.11.03.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2026 03:49:07 -0700 (PDT)
From: Qing Wang <wangqing7171@gmail.com>
To: syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com
Date: Wed, 11 Mar 2026 18:48:55 +0800
Message-Id: <20260311104855.102050-1-wangqing7171@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <698a26d3.050a0220.3b3015.007e.GAE@google.com>
References: <698a26d3.050a0220.3b3015.007e.GAE@google.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: #syz test diff --git a/mm/slub.c b/mm/slub.c index
 20cb4f3b636d..73b2cfd0e123
 100644 --- a/mm/slub.c +++ b/mm/slub.c @@ -2797,6 +2797,7 @@ static void
 free_empty_sheaf(struct kmem_cache *s, struct slab_sheaf *s [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.67 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [wangqing7171(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [wangqing7171(at)gmail.com]
X-Headers-End: 1w0H7r-0005Yg-DW
Subject: Re: [f2fs-dev] [syzbot] [mm?] [f2fs?] [exfat?] memory leak in
 __kfree_rcu_sheaf
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
Cc: lorenzo.stoakes@oracle.com, jannh@google.com,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 Liam.Howlett@oracle.com, linux-f2fs-devel@lists.sourceforge.net,
 linux-mm@kvack.org, pfalcato@suse.de, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org, akpm@linux-foundation.org, sj1557.seo@samsung.com,
 linkinjeon@kernel.org, vbabka@suse.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 450B82628AD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[wangqing7171@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_MIXED(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com,m:lorenzo.stoakes@oracle.com,m:jannh@google.com,m:syzkaller-bugs@googlegroups.com,m:linux-kernel@vger.kernel.org,m:Liam.Howlett@oracle.com,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-mm@kvack.org,m:pfalcato@suse.de,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:akpm@linux-foundation.org,m:sj1557.seo@samsung.com,m:linkinjeon@kernel.org,m:vbabka@suse.cz,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20230601];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangqing7171@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo];
	TAGGED_RCPT(0.00)[linux-f2fs-devel,cae7809e9dc1459e4e63];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Action: no action

#syz test

diff --git a/mm/slub.c b/mm/slub.c
index 20cb4f3b636d..73b2cfd0e123 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -2797,6 +2797,7 @@ static void free_empty_sheaf(struct kmem_cache *s, struct slab_sheaf *sheaf)
 	if (s->flags & SLAB_KMALLOC)
 		mark_obj_codetag_empty(sheaf);
 
+	WARN_ON(sheaf->size > 0);
 	kfree(sheaf);
 
 	stat(s, SHEAF_FREE);
@@ -2828,6 +2829,7 @@ static int refill_sheaf(struct kmem_cache *s, struct slab_sheaf *sheaf,
 	return 0;
 }
 
+static void sheaf_flush_unused(struct kmem_cache *s, struct slab_sheaf *sheaf);
 
 static struct slab_sheaf *alloc_full_sheaf(struct kmem_cache *s, gfp_t gfp)
 {
@@ -2837,6 +2839,7 @@ static struct slab_sheaf *alloc_full_sheaf(struct kmem_cache *s, gfp_t gfp)
 		return NULL;
 
 	if (refill_sheaf(s, sheaf, gfp | __GFP_NOMEMALLOC | __GFP_NOWARN)) {
+		sheaf_flush_unused(s, sheaf);
 		free_empty_sheaf(s, sheaf);
 		return NULL;
 	}
@@ -4623,6 +4626,7 @@ __pcs_replace_empty_main(struct kmem_cache *s, struct slub_percpu_sheaves *pcs,
 			 * we must be very low on memory so don't bother
 			 * with the barn
 			 */
+			sheaf_flush_unused(s, empty);
 			free_empty_sheaf(s, empty);
 		}
 	} else {


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
