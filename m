Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCb5Fg2bGmpA6AgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 30 May 2026 10:08:45 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FD060BA8C
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 30 May 2026 10:08:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:Message-ID:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=82jKTrKosYqWIdYC1zrvnFztoz43d8Gatbsga/IcxuM=; b=MRuHqMCvhcgMDkhf9919edjeHY
	hHqxFeWF7KS8qkqHqyGj6ztqMs6SNfXM6GqHFTbZ0LJ0i/qEi1jZ67yr8t80JlkIpewa0wtE34Pij
	DE8dUEFZdckgFaOirLheJCkiVxKrtY3gBPIhjU1TtYWAZWaJ+lewOWukuM+xYoP+81Ro=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wTEk8-0006Aq-IZ;
	Sat, 30 May 2026 08:08:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <error27@gmail.com>) id 1wTEk7-0006Aj-1X
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 30 May 2026 08:08:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kH8Pl7SP8LWSHPvqI1Gh+YwqGQGUx2sMcX2ZQOOsAWo=; b=Ov6DPS2Ct8+yygnprCj+URnVGR
 5PiN9h2iBhF40jDJoEyDMcdUdt5iZ4V+tu/KDV5hc4OEeC77fL/+VocqUd03gEi8ZCKBIXMAT7DKy
 shapgVSkcjsPWXxP/mBsrwZKSnYZq+QdV8wM9mSk1/5tEcUgza7z6ermFl4YhKdpQ4bs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kH8Pl7SP8LWSHPvqI1Gh+YwqGQGUx2sMcX2ZQOOsAWo=; b=B
 o/A2vapFrML8GV+JRL3R0bv/WE9SePKFb3IWwCJ4FQ07j+rea5OKvk6xUTHe30VdJ9D6Pecf0iLqW
 QIAOua8HjW9DKrmJ1LHsRR0tWIxIrZGXa9e9Oe2iptUhpQDbQH+2Swwq9/DxUzPIab3voayUk9X/S
 ltrqIjLs5hPIVvqQ=;
Received: from mail-wm1-f42.google.com ([209.85.128.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wTEk4-00053Q-RF for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 30 May 2026 08:08:26 +0000
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-490388fd0dbso89493725e9.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 30 May 2026 01:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780128494; x=1780733294; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kH8Pl7SP8LWSHPvqI1Gh+YwqGQGUx2sMcX2ZQOOsAWo=;
 b=sVsdJAZot7YiZvBCO3UYLZ0dEclcT1qBFEwnJaogGY1irLgcBinObmD73gSMw4BPlf
 V9p3ECt+9hCwmQwSjhr3JTPBb/D9I7dmhk5XaCkDgZIPias89hduiiWPtuubOa4edQk5
 N+kMr+X9CB2Bo5Mot/sz34RH6jmDSL0w8qc1faz+ttHqyGQMnv16fLbA1x1s+M6YlbqC
 ykJyTz5u+3MyEgZuHm7LHS5wg0I7oAgGhjhBFDO5PSRVCPvZFvgC126USp4oIVifPGKW
 aetJhchO5Tu2+jlWzS7uYNQacYV2uFr2fX/8daZDdQ2FNmEzw3IKRM754fB3hMZjM90W
 7YSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780128494; x=1780733294;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kH8Pl7SP8LWSHPvqI1Gh+YwqGQGUx2sMcX2ZQOOsAWo=;
 b=HiilCQcvYFsYjKWdkLxNdC+x0usiqPpxHL8YUpihSB8Ax6EBn7TPcr1wKo2j5M3bZJ
 X00ncsVsMXD/u5n735Olp5hLbqXZ7hiVAxzwWUudFhYfCc6dLGKyvzhuOmBTy5dj+f2A
 9ed1CBEuEA4Fm9SQpPzuh1P26F8iCQEVAgWYCchL5ZBiSgDFoXbBcyGu9zrBKP8Ub7tw
 xC+NC9DUjL/riqH4pziqMeaaPNSw4wAqcki4M4EUj2PShWxPl3cDPIRncAb8OBGE85H6
 XEr97faB67au3o7FIqfiRGwh2/w9oluoh4JujkaGNcprL9663Ri3wou5XzghH6ZlylSa
 rETQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8GF/jYH74k4WvwAwhVOGR7nG1HaIKFqdHYdb9NirWjStzyHF0xF7t3svO0YJpTyWOYEOvhavsT/C+rS1SWUAw7@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yyvw1rGCZT1ZusuJXa1ckOygbupNsg7ZeJfq2nGw3Zd0xrAefjj
 yssMarZh9jD+5Fk+ijRif+KS6u7tGz9/Ag1eIqYFkcPfVADYEFbOcbUv
X-Gm-Gg: Acq92OGJ6aas9RDqHTmOWrOAgxZTmWjYoYoIa6yJmh7qZNwuX2Wakq5ekUEy68LBalu
 IYiYPlno9E1Oa7lk8QeIneGqQgXJtj3l7XFWFRmhyvvr4z0upqgaYIEAvvP+FJGHFNX6tZ/nT7Z
 pC9NaYCf61K1SC0BS69knDbqreHc4oEhzROPicuGOYczx1w4xVuddbdayRw+Xg9EQx8zQMZ0FQO
 ZY/xuR/9hc2eJCkGqJzsqvo5hceqhHYVP9NZQUDyeavpWfqotdNzpOFIKRFEBapYcchJPkB5shp
 tUfNv6Uo9vOfyOzhekI7MDxCuqKsF5nDXt+yhMvZKLwAXcFikPtxzDBJ8kfopU8Hxg2cPSbg2f4
 euoUqSLq7+VctqkKxh59ReHmfJL6yrO2HRve/jNF98y3TcpouVYOO5Ft4AgqtoTuvRHCVMbMgAG
 /vgvxIm00YVF5ssR4IIfb3NT5BdR79JEq4Yg==
X-Received: by 2002:a05:600c:34c8:b0:488:ac01:72de with SMTP id
 5b1f17b1804b1-490a2b6e3d2mr43745985e9.5.1780128493612; 
 Sat, 30 May 2026 01:08:13 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c09abadsm29881905e9.1.2026.05.30.01.08.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2026 01:08:12 -0700 (PDT)
Date: Sat, 30 May 2026 11:08:09 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Zhang Cen <rollkingzzc@gmail.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Message-ID: <202605300627.kUlwXIge-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260528065601.3257303-1-rollkingzzc@gmail.com>
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Zhang,
 kernel test robot noticed the following build warnings:
 https://git-scm.com/docs/git-format-patch#_base_tree_information] 
 Content analysis details:   (1.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [196.207.164.177 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [error27(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [error27(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.42 listed in wl.mailspike.net]
X-Headers-End: 1wTEk4-00053Q-RF
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: protect published gc_thread during
 teardown
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
Cc: lkp@intel.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, 2045gemini@gmail.com,
 oe-kbuild-all@lists.linux.dev, Gao Xiang <xiang@kernel.org>,
 zerocling0077@gmail.com, Zhang Cen <rollkingzzc@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:oe-kbuild@lists.linux.dev,m:rollkingzzc@gmail.com,m:jaegeuk@kernel.org,m:chao@kernel.org,m:lkp@intel.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:2045gemini@gmail.com,m:oe-kbuild-all@lists.linux.dev,m:xiang@kernel.org,m:zerocling0077@gmail.com,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[error27@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[lists.linux.dev,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[intel.com,vger.kernel.org,lists.sourceforge.net,gmail.com,lists.linux.dev,kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url]
X-Rspamd-Queue-Id: 72FD060BA8C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Zhang,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhang-Cen/f2fs-protect-published-gc_thread-during-teardown/20260528-145912
base:   linus/master
patch link:    https://lore.kernel.org/r/20260528065601.3257303-1-rollkingzzc%40gmail.com
patch subject: [PATCH v3] f2fs: protect published gc_thread during teardown
config: i386-randconfig-r071-20260529 (https://download.01.org/0day-ci/archive/20260530/202605300627.kUlwXIge-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605300627.kUlwXIge-lkp@intel.com/

smatch warnings:
fs/f2fs/super.c:5006 f2fs_fill_super() warn: missing error code 'err'
fs/f2fs/sysfs.c:1027 __f2fs_sbi_store() warn: inconsistent indenting

vim +/err +5006 fs/f2fs/super.c

aff063e266cbf4 Jaegeuk Kim      2012-11-02  4961  
ed2e621a95d704 Jaegeuk Kim      2014-08-08  4962  try_onemore:
d1267b5f0b476d Zhang Cen        2026-05-28  4963  	gc_thread_srcu_inited = false;
da554e48caab95 hujianyang       2015-05-21  4964  	err = -EINVAL;
da554e48caab95 hujianyang       2015-05-21  4965  	raw_super = NULL;
e8240f656d4d5d Chao Yu          2015-12-15  4966  	valid_super_block = -1;
da554e48caab95 hujianyang       2015-05-21  4967  	recovery = 0;
da554e48caab95 hujianyang       2015-05-21  4968  
aff063e266cbf4 Jaegeuk Kim      2012-11-02  4969  	/* allocate memory for f2fs-specific super block info */
bf4afc53b77aea Linus Torvalds   2026-02-21  4970  	sbi = kzalloc_obj(struct f2fs_sb_info);
aff063e266cbf4 Jaegeuk Kim      2012-11-02  4971  	if (!sbi)
aff063e266cbf4 Jaegeuk Kim      2012-11-02  4972  		return -ENOMEM;
aff063e266cbf4 Jaegeuk Kim      2012-11-02  4973  
df728b0f6954c3 Jaegeuk Kim      2016-03-23  4974  	sbi->sb = sb;
df728b0f6954c3 Jaegeuk Kim      2016-03-23  4975  
92b4cf5b48955a Tetsuo Handa     2022-11-09  4976  	/* initialize locks within allocated memory */
e605302c14ffda Chao Yu          2026-01-04  4977  	init_f2fs_rwsem_trace(&sbi->gc_lock, sbi, LOCK_NAME_GC_LOCK);
92b4cf5b48955a Tetsuo Handa     2022-11-09  4978  	mutex_init(&sbi->writepages);
ce9fe67c9cdb21 Chao Yu          2026-01-04  4979  	init_f2fs_rwsem_trace(&sbi->cp_global_sem, sbi, LOCK_NAME_CP_GLOBAL);
6a5e3de9c2bb0b Chao Yu          2026-03-06  4980  #ifdef CONFIG_DEBUG_LOCK_ALLOC
6a5e3de9c2bb0b Chao Yu          2026-03-06  4981  	lockdep_register_key(&sbi->cp_global_sem_key);
6a5e3de9c2bb0b Chao Yu          2026-03-06  4982  	lockdep_set_class(&sbi->cp_global_sem.internal_rwsem,
6a5e3de9c2bb0b Chao Yu          2026-03-06  4983  					&sbi->cp_global_sem_key);
6a5e3de9c2bb0b Chao Yu          2026-03-06  4984  #endif
bb28b66875cca7 Chao Yu          2026-01-04  4985  	init_f2fs_rwsem_trace(&sbi->node_write, sbi, LOCK_NAME_NODE_WRITE);
f9f93602512bce Chao Yu          2026-01-04  4986  	init_f2fs_rwsem_trace(&sbi->node_change, sbi, LOCK_NAME_NODE_CHANGE);
92b4cf5b48955a Tetsuo Handa     2022-11-09  4987  	spin_lock_init(&sbi->stat_lock);
66e9e0d55d117a Chao Yu          2026-01-04  4988  	init_f2fs_rwsem_trace(&sbi->cp_rwsem, sbi, LOCK_NAME_CP_RWSEM);
92b4cf5b48955a Tetsuo Handa     2022-11-09  4989  	init_f2fs_rwsem(&sbi->quota_sem);
92b4cf5b48955a Tetsuo Handa     2022-11-09  4990  	init_waitqueue_head(&sbi->cp_wait);
92b4cf5b48955a Tetsuo Handa     2022-11-09  4991  	spin_lock_init(&sbi->error_lock);
92b4cf5b48955a Tetsuo Handa     2022-11-09  4992  
92b4cf5b48955a Tetsuo Handa     2022-11-09  4993  	for (i = 0; i < NR_INODE_TYPE; i++) {
92b4cf5b48955a Tetsuo Handa     2022-11-09  4994  		INIT_LIST_HEAD(&sbi->inode_list[i]);
92b4cf5b48955a Tetsuo Handa     2022-11-09  4995  		spin_lock_init(&sbi->inode_lock[i]);
92b4cf5b48955a Tetsuo Handa     2022-11-09  4996  	}
92b4cf5b48955a Tetsuo Handa     2022-11-09  4997  	mutex_init(&sbi->flush_lock);
d1267b5f0b476d Zhang Cen        2026-05-28  4998  	err = init_srcu_struct(&sbi->gc_thread_srcu);
d1267b5f0b476d Zhang Cen        2026-05-28  4999  	if (err)
d1267b5f0b476d Zhang Cen        2026-05-28  5000  		goto free_sbi;
d1267b5f0b476d Zhang Cen        2026-05-28  5001  	gc_thread_srcu_inited = true;
92b4cf5b48955a Tetsuo Handa     2022-11-09  5002  
ff9234ad4e9747 Namjae Jeon      2013-01-12  5003  	/* set a block size */
6bacf52fb58aeb Jaegeuk Kim      2013-12-06  5004  	if (unlikely(!sb_set_blocksize(sb, F2FS_BLKSIZE))) {
dcbb4c10e6d969 Joe Perches      2019-06-18  5005  		f2fs_err(sbi, "unable to set blocksize");
aff063e266cbf4 Jaegeuk Kim      2012-11-02 @5006  		goto free_sbi;

error code?

a07ef784356cf9 Namjae Jeon      2012-12-30  5007  	}
aff063e266cbf4 Jaegeuk Kim      2012-11-02  5008  
df728b0f6954c3 Jaegeuk Kim      2016-03-23  5009  	err = read_raw_super_block(sbi, &raw_super, &valid_super_block,
e8240f656d4d5d Chao Yu          2015-12-15  5010  								&recovery);
c0d39e65ba3243 Namjae Jeon      2013-03-17  5011  	if (err)
9076a75f8e0f23 Gu Zheng         2013-10-14  5012  		goto free_sbi;
9076a75f8e0f23 Gu Zheng         2013-10-14  5013  
5fb08372a68936 Gu Zheng         2013-06-07  5014  	sb->s_fs_info = sbi;
52763a4b7a2112 Jaegeuk Kim      2016-06-13  5015  	sbi->raw_super = raw_super;
52763a4b7a2112 Jaegeuk Kim      2016-06-13  5016  
b62e71be2110d8 Chao Yu          2023-04-23  5017  	INIT_WORK(&sbi->s_error_work, f2fs_record_error_work);
92b4cf5b48955a Tetsuo Handa     2022-11-09  5018  	memcpy(sbi->errors, raw_super->s_errors, MAX_F2FS_ERRORS);
b62e71be2110d8 Chao Yu          2023-04-23  5019  	memcpy(sbi->stop_reason, raw_super->s_stop_reason, MAX_STOP_REASON);
92b4cf5b48955a Tetsuo Handa     2022-11-09  5020  
704956ecf5bcdc Chao Yu          2017-07-31  5021  	/* precompute checksum seed for metadata */
7beb01f74415c5 Chao Yu          2018-10-24  5022  	if (f2fs_sb_has_inode_chksum(sbi))
d005af3b6756e5 Eric Biggers     2025-05-12  5023  		sbi->s_chksum_seed = f2fs_chksum(~0, raw_super->uuid,
704956ecf5bcdc Chao Yu          2017-07-31  5024  						 sizeof(raw_super->uuid));
704956ecf5bcdc Chao Yu          2017-07-31  5025  
458c15dfbce62c Chao Yu          2023-05-23  5026  	default_options(sbi, false);
dabc4a5c60f796 Jaegeuk Kim      2015-01-23  5027  
94b3ce7f1509d9 Hongbo Li        2025-07-10  5028  	err = f2fs_check_opt_consistency(fc, sb);
dabc4a5c60f796 Jaegeuk Kim      2015-01-23  5029  	if (err)
94b3ce7f1509d9 Hongbo Li        2025-07-10  5030  		goto free_sb_buf;
d185351325237d Hongbo Li        2025-07-10  5031  
94b3ce7f1509d9 Hongbo Li        2025-07-10  5032  	f2fs_apply_options(fc, sb);
d185351325237d Hongbo Li        2025-07-10  5033  
d185351325237d Hongbo Li        2025-07-10  5034  	err = f2fs_sanity_check_options(sbi, false);
abd0e040e9a516 Eric Sandeen     2025-03-03  5035  	if (err)
abd0e040e9a516 Eric Sandeen     2025-03-03  5036  		goto free_options;
abd0e040e9a516 Eric Sandeen     2025-03-03  5037  
6d1451bf7f84ea Chengguang Xu    2021-01-13  5038  	sb->s_maxbytes = max_file_blocks(NULL) <<
e0afc4d6d0d3e7 Chao Yu          2015-12-31  5039  				le32_to_cpu(raw_super->log_blocksize);
aff063e266cbf4 Jaegeuk Kim      2012-11-02  5040  	sb->s_max_links = F2FS_LINK_MAX;
aff063e266cbf4 Jaegeuk Kim      2012-11-02  5041  
5aba54302a46fd Daniel Rosenberg 2019-07-23  5042  	err = f2fs_setup_casefold(sbi);
5aba54302a46fd Daniel Rosenberg 2019-07-23  5043  	if (err)
5aba54302a46fd Daniel Rosenberg 2019-07-23  5044  		goto free_options;
5aba54302a46fd Daniel Rosenberg 2019-07-23  5045  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
