Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BFB87B543
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Mar 2024 00:36:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rkY9N-0006X5-Qv;
	Wed, 13 Mar 2024 23:36:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rkY9L-0006Wy-VO
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Mar 2024 23:36:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xZIOH1b0c2LE/iuLTWH0WnTuOq16yhQnSgF8iH0nLII=; b=EnuvarFGpY8t0wKAjPSPI1MqqE
 g7ikdpNKRniDBd8pIpMxdtTAXr/bab35CiiTrDaUsesfro+0CsxO3J+psP8MH/k9bVtOBJdDfwUoQ
 UUg4473lOBzwoZ/GYbdtcrTo4KirJy1+njpS90IKVAkPYlQYSzyu+Ui8kg8zClLq68Q4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xZIOH1b0c2LE/iuLTWH0WnTuOq16yhQnSgF8iH0nLII=; b=B6P+8cpCWMpqxLs03UDjN4K5iP
 Wka9rdsbp+HXkVerlgXZs8NesZ6qm0799TazT62GvoVArclfr+US1a6H76NCvEbm9P+XoZ6NmN1ni
 n6btbL3PqON2dMUZbQ8+e82aVlMNpI2LWg80GC1utY41bHbhCPafqNAflHl/kZXgl8HA=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rkY9B-000527-F2 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Mar 2024 23:36:44 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 776B31F7F8;
 Wed, 13 Mar 2024 23:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710372987; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xZIOH1b0c2LE/iuLTWH0WnTuOq16yhQnSgF8iH0nLII=;
 b=Bnd3kWsnYDr/3ubbhuA0F23HvEmHaKaADekrRDWkckJo9Z/ZtVPe95xkXOL3uBVO8BQbwZ
 myA9JFd9BVM0i8RpdY3lezr6z/jKO5+Z4OTs16yWQbugA0mG/CMv7lkGI4yhu34yVOmRSF
 1wAJsXiLeC4QAdk5Jh23U8n9tYgS5w8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710372987;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xZIOH1b0c2LE/iuLTWH0WnTuOq16yhQnSgF8iH0nLII=;
 b=OJxKQlLhwCXcC4Qtt1DfDFBjyFQt+Q13XqaIqQTJVV8EtNJY+S7UikYGFlrAB1QzHHvtRT
 LMO7D2O//YY4XqCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710372987; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xZIOH1b0c2LE/iuLTWH0WnTuOq16yhQnSgF8iH0nLII=;
 b=Bnd3kWsnYDr/3ubbhuA0F23HvEmHaKaADekrRDWkckJo9Z/ZtVPe95xkXOL3uBVO8BQbwZ
 myA9JFd9BVM0i8RpdY3lezr6z/jKO5+Z4OTs16yWQbugA0mG/CMv7lkGI4yhu34yVOmRSF
 1wAJsXiLeC4QAdk5Jh23U8n9tYgS5w8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710372987;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xZIOH1b0c2LE/iuLTWH0WnTuOq16yhQnSgF8iH0nLII=;
 b=OJxKQlLhwCXcC4Qtt1DfDFBjyFQt+Q13XqaIqQTJVV8EtNJY+S7UikYGFlrAB1QzHHvtRT
 LMO7D2O//YY4XqCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3165313977;
 Wed, 13 Mar 2024 23:36:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id DYIDBns48mXSCgAAD6G6ig
 (envelope-from <krisman@suse.de>); Wed, 13 Mar 2024 23:36:27 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <20240305101608.67943-3-eugen.hristev@collabora.com> (Eugen
 Hristev's message of "Tue, 5 Mar 2024 12:16:01 +0200")
Organization: SUSE
References: <20240305101608.67943-1-eugen.hristev@collabora.com>
 <20240305101608.67943-3-eugen.hristev@collabora.com>
Date: Wed, 13 Mar 2024 19:36:25 -0400
Message-ID: <87edcdk8li.fsf@mailhost.krisman.be>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Bnd3kWsn;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=OJxKQlLh
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; HAS_ORG_HEADER(0.00)[];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_TWELVE(0.00)[14];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%]
X-Spam-Score: -4.51
X-Rspamd-Queue-Id: 776B31F7F8
X-Spam-Flag: NO
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Eugen Hristev <eugen.hristev@collabora.com> writes: > +void
 f2fs_free_casefolded_name(struct f2fs_filename *fname) > +{ > + unsigned
 char *buf = (unsigned char *)fname->cf_name.name;
 > + > + kmem_cache_free(f2fs_cf_name_slab,
 buf); > + fname->cf_name.n [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.131 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rkY9B-000527-F2
Subject: Re: [f2fs-dev] [PATCH v13 2/9] f2fs: Simplify the handling of
 cached insensitive names
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
Cc: brauner@kernel.org, kernel@collabora.com, tytso@mit.edu, jack@suse.cz,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 adilger.kernel@dilger.ca, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Eugen Hristev <eugen.hristev@collabora.com> writes:

> +void f2fs_free_casefolded_name(struct f2fs_filename *fname)
> +{
> +	unsigned char *buf = (unsigned char *)fname->cf_name.name;
> +
> +	kmem_cache_free(f2fs_cf_name_slab, buf);
> +	fname->cf_name.name = NULL;

In my previous review, I mentioned you could drop the "if (buf)" check
here *if and only if* you used kfree. By doing an unchecked kmem_cache_free
like this, you will immediately hit an Oops in the first lookup (see below).

Please, make sure you actually stress test this patchset with fstests
against both f2fs and ext4 before sending each new version.

Thanks,


[   74.202044] F2FS-fs (loop0): Using encoding defined by superblock: utf8-12.1.0 with flags 0x0
[   74.206592] F2FS-fs (loop0): Found nat_bits in checkpoint
[   74.221467] F2FS-fs (loop0): Mounted with checkpoint version = 3e684111
FSTYP         -- f2fs
PLATFORM      -- Linux/x86_64 sle15sp5 6.7.0-gf27274eae416 #8 SMP PREEMPT_DYNAMIC Thu Mar 14 00:22:47 CET 2024
MKFS_OPTIONS  -- -O encrypt /dev/loop1
MOUNT_OPTIONS -- -o acl,user_xattr /dev/loop1 /root/work/scratch

[   75.038385] F2FS-fs (loop1): Found nat_bits in checkpoint
[   75.054311] F2FS-fs (loop1): Mounted with checkpoint version = 6b9fbccb
[   75.176328] F2FS-fs (loop0): Using encoding defined by superblock: utf8-12.1.0 with flags 0x0
[   75.179261] F2FS-fs (loop0): Found nat_bits in checkpoint
[   75.194264] F2FS-fs (loop0): Mounted with checkpoint version = 3e684114
f2fs/001 1s ... [   75.570867] run fstests f2fs/001 at 2024-03-14 00:24:33
[   75.753604] BUG: unable to handle page fault for address: fffff14ad2000008
[   75.754209] #PF: supervisor read access in kernel mode
[   75.754647] #PF: error_code(0x0000) - not-present page
[   75.755077] PGD 0 P4D 0 
[   75.755300] Oops: 0000 [#1] PREEMPT SMP NOPTI
[   75.755683] CPU: 0 PID: 2740 Comm: xfs_io Not tainted 6.7.0-gf27274eae416 #8
[   75.756266] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS unknown 2/2/2022
[   75.756911] RIP: 0010:kmem_cache_free+0x6a/0x320
[   75.757309] Code: 80 48 01 d8 0f 82 b4 02 00 00 48 c7 c2 00 00 00 80 48 2b 15 f8 c2 18 01 48 01 d0 48 c1 e8 0c 48 c1 e0 06 48 03 05 d6 c2 18 01 <48> 8b 50 08 49 89 c6 f6 c2 01 0f 85 ea 01 00 00 0f 1f 44 00 00 49
[   75.758834] RSP: 0018:ffffa59bc231bb10 EFLAGS: 00010286
[   75.759270] RAX: fffff14ad2000000 RBX: 0000000000000000 RCX: 0000000000000000
[   75.759860] RDX: 0000620400000000 RSI: 0000000000000000 RDI: ffff9dfc80043600
[   75.760450] RBP: ffffa59bc231bb30 R08: ffffa59bc231b9a0 R09: 00000000000003fa
[   75.761037] R10: 00000000000fd024 R11: 0000000000000107 R12: ffff9dfc80043600
[   75.761626] R13: ffffffff8404dc7a R14: 0000000000000000 R15: ffff9dfc8f1aa000
[   75.762221] FS:  00007f9601efb780(0000) GS:ffff9dfcfbc00000(0000) knlGS:0000000000000000
[   75.762888] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   75.763372] CR2: fffff14ad2000008 CR3: 0000000111750000 CR4: 0000000000750ef0
[   75.763962] PKRU: 55555554
[   75.764194] Call Trace:
[   75.764435]  <TASK>
[   75.764677]  ? __die_body+0x1a/0x60
[   75.764982]  ? page_fault_oops+0x154/0x440
[   75.765335]  ? srso_alias_return_thunk+0x5/0xfbef5
[   75.765760]  ? search_module_extables+0x46/0x70
[   75.766149]  ? srso_alias_return_thunk+0x5/0xfbef5
[   75.766548]  ? fixup_exception+0x22/0x300
[   75.766892]  ? srso_alias_return_thunk+0x5/0xfbef5
[   75.767292]  ? exc_page_fault+0xa6/0x140
[   75.767633]  ? asm_exc_page_fault+0x22/0x30
[   75.767995]  ? f2fs_free_filename+0x2a/0x40
[   75.768362]  ? kmem_cache_free+0x6a/0x320
[   75.768703]  ? f2fs_free_filename+0x2a/0x40
[   75.769061]  f2fs_free_filename+0x2a/0x40
[   75.769403]  f2fs_lookup+0x19f/0x380
[   75.769712]  __lookup_slow+0x8b/0x130
[   75.770034]  walk_component+0xfc/0x170
[   75.770353]  path_lookupat+0x69/0x140
[   75.770664]  filename_lookup+0xe1/0x1c0
[   75.770991]  ? srso_alias_return_thunk+0x5/0xfbef5
[   75.771393]  ? srso_alias_return_thunk+0x5/0xfbef5
[   75.771792]  ? do_wp_page+0x3f6/0xbf0
[   75.772109]  ? srso_alias_return_thunk+0x5/0xfbef5
[   75.772523]  ? preempt_count_add+0x70/0xa0
[   75.772902]  ? vfs_statx+0x89/0x180
[   75.773224]  vfs_statx+0x89/0x180
[   75.773530]  ? srso_alias_return_thunk+0x5/0xfbef5
[   75.773939]  vfs_fstatat+0x80/0xa0
[   75.774237]  __do_sys_newfstatat+0x26/0x60
[   75.774595]  ? srso_alias_return_thunk+0x5/0xfbef5
[   75.775021]  ? srso_alias_return_thunk+0x5/0xfbef5
[   75.775448]  ? srso_alias_return_thunk+0x5/0xfbef5
[   75.775878]  ? do_user_addr_fault+0x563/0x7c0
[   75.776273]  ? srso_alias_return_thunk+0x5/0xfbef5
[   75.776699]  do_syscall_64+0x50/0x110
[   75.777028]  entry_SYSCALL_64_after_hwframe+0x6e/0x76
[   75.777479] RIP: 0033:0x7f9601b07aea
[   75.777793] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 41 89 ca b8 06 01 00 00 0f 05 <3d> 00 f0 ff ff 77 07 31 c0 c3 0f 1f 40 00 48 8b 15 01 23 0e 00 f7
[   75.779391] RSP: 002b:00007ffc160eaae8 EFLAGS: 00000246 ORIG_RAX: 0000000000000106
[   75.780050] RAX: ffffffffffffffda RBX: 0000000000000042 RCX: 00007f9601b07aea
[   75.780663] RDX: 00007ffc160eab80 RSI: 00007ffc160ecb88 RDI: 00000000ffffff9c
[   75.781278] RBP: 00007ffc160ead20 R08: 00007ffc160ead20 R09: 0000000000000000
[   75.781902] R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffc160eae70
[   75.782532] R13: 00007ffc160ecb88 R14: 00007ffc160eae70 R15: 0000000000000020
[   75.783150]  </TASK>
[   75.783349] Modules linked in:
[   75.783628] CR2: fffff14ad2000008
[   75.783918] ---[ end trace 0000000000000000 ]---
[   75.784315] RIP: 0010:kmem_cache_free+0x6a/0x320
[   75.784718] Code: 80 48 01 d8 0f 82 b4 02 00 00 48 c7 c2 00 00 00 80 48 2b 15 f8 c2 18 01 48 01 d0 48 c1 e8 0c 48 c1 e0 06 48 03 05 d6 c2 18 01 <48> 8b 50 08 49 89 c6 f6 c2 01 0f 85 ea 01 00 00 0f 1f 44 00 00 49
[   75.786294] RSP: 0018:ffffa59bc231bb10 EFLAGS: 00010286
[   75.786747] RAX: fffff14ad2000000 RBX: 0000000000000000 RCX: 0000000000000000
[   75.787369] RDX: 0000620400000000 RSI: 0000000000000000 RDI: ffff9dfc80043600
[   75.788016] RBP: ffffa59bc231bb30 R08: ffffa59bc231b9a0 R09: 00000000000003fa
[   75.788672] R10: 00000000000fd024 R11: 0000000000000107 R12: ffff9dfc80043600
[   75.789296] R13: ffffffff8404dc7a R14: 0000000000000000 R15: ffff9dfc8f1aa000
[   75.789938] FS:  00007f9601efb780(0000) GS:ffff9dfcfbc00000(0000) knlGS:0000000000000000
[   75.790677] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   75.791212] CR2: fffff14ad2000008 CR3: 0000000111750000 CR4: 0000000000750ef0
[   75.791862] PKRU: 55555554
[   75.792112] Kernel panic - not syncing: Fatal exception
[   75.792797] Kernel Offset: 0x2a00000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)


-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
