Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D1077D9B1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Aug 2023 07:10:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qW8nD-0007xU-FH;
	Wed, 16 Aug 2023 05:10:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <groeck7@gmail.com>) id 1qW8n9-0007wq-F4
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Aug 2023 05:10:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eVzchJIdcg4ZkC29z8EXuoYxEp24GJ+xQ7O5I/5gGLQ=; b=Hija3dOJThduWYiNKZOCux/VQ9
 2YfRIU5CKkTosAvBZQ5Mub8yMY2tHVin3fLrmPV3LWwh/3gJHSeoU0X6LfXU5Ht6wtOMqBGyVJtVL
 88gBh+IfFI6LFX009VAQdWk5g68OIlvtsVta+yL6Jcnod6GP6BfaKp0zUMpZN401D6FQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=eVzchJIdcg4ZkC29z8EXuoYxEp24GJ+xQ7O5I/5gGLQ=; b=V
 LDGZxXhIvJzdLAyGY0ZLc/dQ+ADSbwQl1/baVH+nUkBPHbFP/9yizAX1o69xmjzmsJYDGwLfEWp2s
 pyGKip/vf7W1Aro2FNEhoNdknCmbhG79bhRRLrT1CQ7natGhScHgfqO7agWFW1LMfRdByfnWvqeey
 rHPbxcPhhDCgXUtk=;
Received: from mail-il1-f176.google.com ([209.85.166.176])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qW8n7-006nnE-GS for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Aug 2023 05:09:58 +0000
Received: by mail-il1-f176.google.com with SMTP id
 e9e14a558f8ab-34aa0845837so8781065ab.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 15 Aug 2023 22:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692162592; x=1692767392;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=eVzchJIdcg4ZkC29z8EXuoYxEp24GJ+xQ7O5I/5gGLQ=;
 b=Jqh/urE2exiO0S1Z2zLKdiMzAx6LqcOl7FPEo9/NrtH1LORJXA6JaCbyFB3nX3CTs+
 N+XpMyXuujE1A82ZNyfTpNAT0PfqDo9akprFR9AtV1dfzXtOhdVaTbDCECE1tiOTa3Xr
 6G+OVzTrmMNPJhPz/EW70ZKbG+WuvrvduhJTNZ16ojUCEH6QdtKCSaa0Mob39tvgEqvN
 eR6nNbrhL/iiiYyxasqxvI+4yerrdsNTHqAlO7MiInzWy9KBAHct76A5uDOFdrtFhPXQ
 M6ebhvNOjgfI3TjKmnhiVBBb6ZSpiMoqKkAvcC++H1tTgqwSPa3x8DlZo33s1vE7S8T7
 DDkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692162592; x=1692767392;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eVzchJIdcg4ZkC29z8EXuoYxEp24GJ+xQ7O5I/5gGLQ=;
 b=KasdTVONZ2O80S6PkHP4ZnazMe55gqHlVPg5e0UBlvLa+sbtn5o0scZAmJK7smvj8p
 u2OFVT6g0qnbUblC2g1jbR1994blhyopDx1zLyQ3ftnNDxrtWMNmiF0b/F8FYYmqMplC
 sMaq7/VdRaKVkM9tF4kcZ3vsVRsITLjScwuRdh/7AfeZvyxBoL3fsyoZJ1jRRzcoZ8wt
 tKiHkZqQGT8QkCubGgqC7RsiIyAj8yz2znrx9ddcE3qv4fVHxmbCjap+BXJRfhdmpklX
 05AjsD5ZhmYn39qJJz9sjZBNGX83a973r0Vmq7XB2jxnIXESkfybCTnhQBj0sKrn6xUf
 iJBQ==
X-Gm-Message-State: AOJu0YyH60qsXd23vbaSwnbedLrCapGhd/V53cdutwxppGsb4xSLr8K4
 cQPpnU9X3VN5U8hh8qqpZRzQ0JgSNWo=
X-Google-Smtp-Source: AGHT+IETXg/9THpTnrov/SGUSn3jzaDpykn82kfJtaRFaESVYoATcmfzv6dCPKG//ELKShQGrmQr4w==
X-Received: by 2002:a92:c269:0:b0:348:f1c6:b978 with SMTP id
 h9-20020a92c269000000b00348f1c6b978mr1469196ild.0.1692162591669; 
 Tue, 15 Aug 2023 22:09:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 1-20020a92c641000000b0034982c7206esm4359890ill.71.2023.08.15.22.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Aug 2023 22:09:51 -0700 (PDT)
Date: Tue, 15 Aug 2023 22:09:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Message-ID: <ae78956b-0c55-4980-8ec4-5cccf7e69c16@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: 0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, when trying to boot from an f2fs file system with lock
 debugging enabled, I get the attached circular locking dependency warning.
 Is this a known problem ? Thanks, Guenter 
 Content analysis details:   (0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.176 listed in list.dnswl.org]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [groeck7[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.176 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [groeck7[at]gmail.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1qW8n7-006nnE-GS
Subject: [f2fs-dev] circular locking dependency warning in f2fs
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

when trying to boot from an f2fs file system with lock debugging enabled,
I get the attached circular locking dependency warning. Is this a known
problem ?

Thanks,
Guenter

---
[   10.315522] ======================================================
[   10.315620] WARNING: possible circular locking dependency detected
[   10.315753] 6.5.0-rc6-00027-g91aa6c412d7f #1 Tainted: G                 N
[   10.315843] ------------------------------------------------------
[   10.315922] seedrng/717 is trying to acquire lock:
[   10.316010] ffff8e0e02c6b868 (&fi->i_sem){+.+.}-{3:3}, at: f2fs_add_inline_entry+0x134/0x2d0
[   10.316315] 
[   10.316315] but task is already holding lock:
[   10.316391] ffff8e0e02c6b278 (&fi->i_xattr_sem){.+.+}-{3:3}, at: f2fs_add_dentry+0x41/0xc0
[   10.316543] 
[   10.316543] which lock already depends on the new lock.
[   10.316543] 
[   10.316641] 
[   10.316641] the existing dependency chain (in reverse order) is:
[   10.316745] 
[   10.316745] -> #1 (&fi->i_xattr_sem){.+.+}-{3:3}:
[   10.316883]        down_read+0x3d/0x170
[   10.316973]        f2fs_getxattr+0x370/0x440
[   10.317036]        __f2fs_get_acl+0x38/0x1e0
[   10.317094]        f2fs_init_acl+0x69/0x420
[   10.317151]        f2fs_init_inode_metadata+0x72/0x450
[   10.317218]        f2fs_add_regular_entry+0x372/0x510
[   10.317283]        f2fs_add_dentry+0xb8/0xc0
[   10.317340]        f2fs_do_add_link+0xd9/0x110
[   10.317399]        f2fs_mkdir+0xdf/0x180
[   10.317453]        vfs_mkdir+0x142/0x220
[   10.317508]        do_mkdirat+0x7c/0x120
[   10.317561]        __x64_sys_mkdir+0x47/0x70
[   10.317617]        do_syscall_64+0x3f/0x90
[   10.317673]        entry_SYSCALL_64_after_hwframe+0x73/0xdd
[   10.317757] 
[   10.317757] -> #0 (&fi->i_sem){+.+.}-{3:3}:
[   10.317843]        __lock_acquire+0x16bf/0x2860
[   10.317907]        lock_acquire+0xcc/0x2c0
[   10.317962]        down_write+0x3a/0xc0
[   10.318014]        f2fs_add_inline_entry+0x134/0x2d0
[   10.318077]        f2fs_add_dentry+0x55/0xc0
[   10.318141]        f2fs_do_add_link+0xd9/0x110
[   10.318201]        f2fs_create+0xe8/0x170
[   10.318255]        lookup_open.isra.0+0x58e/0x6c0
[   10.318317]        path_openat+0x2af/0xa40
[   10.318372]        do_filp_open+0xb1/0x160
[   10.318428]        do_sys_openat2+0x91/0xc0
[   10.318485]        __x64_sys_open+0x54/0xa0
[   10.318541]        do_syscall_64+0x3f/0x90
[   10.318597]        entry_SYSCALL_64_after_hwframe+0x73/0xdd
[   10.318676] 
[   10.318676] other info that might help us debug this:
[   10.318676] 
[   10.318799]  Possible unsafe locking scenario:
[   10.318799] 
[   10.318875]        CPU0                    CPU1
[   10.318935]        ----                    ----
[   10.318999]   rlock(&fi->i_xattr_sem);
[   10.319068]                                lock(&fi->i_sem);
[   10.319166]                                lock(&fi->i_xattr_sem);
[   10.319264]   lock(&fi->i_sem);
[   10.319325] 
[   10.319325]  *** DEADLOCK ***
[   10.319325] 
[   10.319413] 4 locks held by seedrng/717:
[   10.319500]  #0: ffff8e0e049693e8 (sb_writers#4){.+.+}-{0:0}, at: path_openat+0xa08/0xa40
[   10.319645]  #1: ffff8e0e02c6ac28 (&type->i_mutex_dir_key#3){++++}-{3:3}, at: path_openat+0x29b/0xa40
[   10.319783]  #2: ffff8e0e050623a8 (&sbi->cp_rwsem){.+.+}-{3:3}, at: f2fs_create+0xcc/0x170
[   10.319899]  #3: ffff8e0e02c6b278 (&fi->i_xattr_sem){.+.+}-{3:3}, at: f2fs_add_dentry+0x41/0xc0
[   10.320029] 
[   10.320029] stack backtrace:
[   10.320166] CPU: 7 PID: 717 Comm: seedrng Tainted: G                 N 6.5.0-rc6-00027-g91aa6c412d7f #1
[   10.320302] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.2-0-gea1b7a073390-prebuilt.qemu.org 04/01/2014
[   10.320499] Call Trace:
[   10.320579]  <TASK>
[   10.320665]  dump_stack_lvl+0x64/0xb0
[   10.320766]  check_noncircular+0x151/0x170
[   10.320834]  ? register_lock_class+0x42/0x7a0
[   10.320906]  __lock_acquire+0x16bf/0x2860
[   10.320974]  lock_acquire+0xcc/0x2c0
[   10.321026]  ? f2fs_add_inline_entry+0x134/0x2d0
[   10.321098]  down_write+0x3a/0xc0
[   10.321156]  ? f2fs_add_inline_entry+0x134/0x2d0
[   10.321220]  f2fs_add_inline_entry+0x134/0x2d0
[   10.321290]  f2fs_add_dentry+0x55/0xc0
[   10.321348]  f2fs_do_add_link+0xd9/0x110
[   10.321410]  f2fs_create+0xe8/0x170
[   10.321464]  lookup_open.isra.0+0x58e/0x6c0
[   10.321536]  ? verify_cpu+0x20/0x100
[   10.321605]  ? verify_cpu+0x20/0x100
[   10.321662]  path_openat+0x2af/0xa40
[   10.321722]  do_filp_open+0xb1/0x160
[   10.321777]  ? alloc_fd+0x3c/0x220
[   10.321838]  ? _raw_spin_unlock+0x1e/0x40
[   10.321901]  do_sys_openat2+0x91/0xc0
[   10.321959]  __x64_sys_open+0x54/0xa0
[   10.322014]  do_syscall_64+0x3f/0x90
[   10.322066]  entry_SYSCALL_64_after_hwframe+0x73/0xdd
[   10.322182] RIP: 0033:0x7ffbe94532de
[   10.322384] Code: c3 8b 07 85 c0 75 24 49 89 fb 48 89 f0 48 89 d7 48 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 05 <c3> e9 4b ce ff ff 41 54 4
9 89 f4 be 00 88 08 00 55 53 48 81 ec a0
[   10.322619] RSP: 002b:00007ffc0cfc7ed8 EFLAGS: 00000246 ORIG_RAX: 0000000000000002
[   10.322730] RAX: ffffffffffffffda RBX: 00007ffbe9495b48 RCX: 00007ffbe94532de
[   10.322821] RDX: 0000000000000100 RSI: 0000000000008241 RDI: 000055f2b0816001
[   10.322910] RBP: 000055f2b0816001 R08: 0000000000000000 R09: 0000000000000000
[   10.322999] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000002
[   10.323089] R13: 000055f2b0816001 R14: 000055f2b0816059 R15: 00007ffc0cfc8148
[   10.323221]  </TASK>
[   10.383174] seedrng (717) used greatest stack depth: 12624 bytes left


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
