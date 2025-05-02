Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A48AA6C8F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 May 2025 10:32:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pslQDPTzhUdC6L7Pri9LRHlokmT0Oh0XNtPr3D/RvYY=; b=VFnjD0+Hpku1/dXj5sQdSdlVO5
	1Npm0Hakx/t/AaOjP2MMC4vPM6njwXqh8+065Yq0cr91GPO3AU2xROttzLmATcBLieVY+zl6wGMzd
	WmUCmkjTa7VXMI6OcnbyqGgZ64J1c0ZQ+CEuO2uo6aahtGB9set4GrSzBTqWYIPVnlG0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uAlov-0000VZ-Pz;
	Fri, 02 May 2025 08:32:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ddiss@suse.de>) id 1uAlot-0000VT-Go
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 May 2025 08:32:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ghNeC+MG9IlvRYK0ofUl0CH49yiAXbaCcQhz5nsE1ds=; b=aWUJ4FzgkIUb19DZNnt4dDo+29
 efeJTL76rdeaWkMdYNbAq8CdmTS8UHfAZCWxiVfz0yQcKQhi2bjDtdVrse9FilGfz9UH+jcdmtosr
 VJmKyv8lR5tK8F86voM8FPCqIfQrvvnKw2r9sIiNb5ag09aGIC1d/LHrKq2NXyBaxLjE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ghNeC+MG9IlvRYK0ofUl0CH49yiAXbaCcQhz5nsE1ds=; b=BH8pbcA+wIigTquLvkOoEWSYDk
 JTIbUgBBSXF5sQMq8nBmrVi6c8StqbPUPoOI3lJEiqDCLQZQK/f26zdk0xDkKhvLwKCx9kkuCfW6F
 sZ4zrtYV5/NNE0qyK2v2sZ5NbHaEG/sSbTeM590nJS8BmqndYklXeFMDdjYYYmmahaps=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uAlod-0003L8-7j for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 May 2025 08:32:31 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 65A5A211E3;
 Fri,  2 May 2025 08:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1746174728; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ghNeC+MG9IlvRYK0ofUl0CH49yiAXbaCcQhz5nsE1ds=;
 b=IbYBtjxJ06IE7vZsge5QDZy9JmI/fVCmcHPhXEt7LEBephLZGM4FY0xiLlbYLM66+EUJ8S
 wo3TYgTcAzj7hoQtTqFab7Zs3qwYRtauSHHrHN+XXzqpdOFUIB7NKjdOaWyyqFzNomOtfk
 R0RudGv3zVEZrIseWRwJz9DZCmQ9TzA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1746174728;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ghNeC+MG9IlvRYK0ofUl0CH49yiAXbaCcQhz5nsE1ds=;
 b=hLrJL5m89P4YbdRPOGpB8zehA930/FwyIMptNUR0b4ZGghqZZ2Lt0CTwHkjxrqZVMAUQ16
 0NJSF5JWj+YLcWCA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=IbYBtjxJ;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=hLrJL5m8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1746174728; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ghNeC+MG9IlvRYK0ofUl0CH49yiAXbaCcQhz5nsE1ds=;
 b=IbYBtjxJ06IE7vZsge5QDZy9JmI/fVCmcHPhXEt7LEBephLZGM4FY0xiLlbYLM66+EUJ8S
 wo3TYgTcAzj7hoQtTqFab7Zs3qwYRtauSHHrHN+XXzqpdOFUIB7NKjdOaWyyqFzNomOtfk
 R0RudGv3zVEZrIseWRwJz9DZCmQ9TzA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1746174728;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ghNeC+MG9IlvRYK0ofUl0CH49yiAXbaCcQhz5nsE1ds=;
 b=hLrJL5m89P4YbdRPOGpB8zehA930/FwyIMptNUR0b4ZGghqZZ2Lt0CTwHkjxrqZVMAUQ16
 0NJSF5JWj+YLcWCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 21F9A13687;
 Fri,  2 May 2025 08:32:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id D4svMwWDFGg7SgAAD6G6ig
 (envelope-from <ddiss@suse.de>); Fri, 02 May 2025 08:32:05 +0000
Date: Fri, 2 May 2025 18:31:56 +1000
From: David Disseldorp <ddiss@suse.de>
To: Chao Yu <chao@kernel.org>
Message-ID: <20250502182729.2f6ec951.ddiss@suse.de>
In-Reply-To: <20250430024731.2722027-1-chao@kernel.org>
References: <20250430024731.2722027-1-chao@kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 65A5A211E3
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 MIME_TRACE(0.00)[0:+]; MISSING_XM_UA(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 RCPT_COUNT_FIVE(0.00)[6]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao Yu, On Wed, 30 Apr 2025 10:47:31 +0800,
 Chao Yu wrote:
 > This is a regression testcase to check whether we will handle database
 > inode dirty status correctly: > 1. make sure disk quota is enabled > 2.
 create a regular file, and write data into the file > [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [195.135.223.130 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [195.135.223.130 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.130 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1uAlod-0003L8-7j
Subject: Re: [f2fs-dev] [PATCH] f2fs/013: test to check potential corruption
 on atomic_write file
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
Cc: jaegeuk@kernel.org, Daeho Jeong <daehojeong@google.com>,
 Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao Yu,

On Wed, 30 Apr 2025 10:47:31 +0800, Chao Yu wrote:

> This is a regression testcase to check whether we will handle database
> inode dirty status correctly:
> 1. make sure disk quota is enabled
> 2. create a regular file, and write data into the file
> 3. start transaction on the file (via F2FS_IOC_START_ATOMIC_WRITE)
> 4. write transaction data to the file
> 5. commit and end the transaction (via F2FS_IOC_COMMIT_ATOMIC_WRITE)
> 6. meanwhile loop call fsync in parallel
> Before f098aeba04c9 ("f2fs: fix to avoid atomicity corruption of atomic
> file"), database file may become corrupted after atomic write while
> there is concurrent dirty inode flush in background.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Cc: Daeho Jeong <daehojeong@google.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  tests/f2fs/013     | 73 ++++++++++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/013.out |  2 ++
>  2 files changed, 75 insertions(+)
>  create mode 100755 tests/f2fs/013
>  create mode 100644 tests/f2fs/013.out
> 
> diff --git a/tests/f2fs/013 b/tests/f2fs/013
> new file mode 100755
> index 00000000..3db8448c
> --- /dev/null
> +++ b/tests/f2fs/013
> @@ -0,0 +1,73 @@
> +#! /bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
> +#
> +# FS QA Test No. f2fs/013
> +#
> +# This is a regression testcase to check whether we will handle database
> +# inode dirty status correctly:
> +# 1. make sure disk quota is enabled

Where is the check that disk quota is enabled?

> +# 2. create a regular file, and write data into the file
> +# 3. start transaction on the file (via F2FS_IOC_START_ATOMIC_WRITE)
> +# 4. write transaction data to the file
> +# 5. commit and end the transaction (via F2FS_IOC_COMMIT_ATOMIC_WRITE)
> +# 6. meanwhile loop call fsync in parallel
> +# Before f098aeba04c9 ("f2fs: fix to avoid atomicity corruption of atomic
> +# file"), database file may become corrupted after atomic write while
> +# there is concurrent dirty inode flush in background.
> +#
> +. ./common/preamble
> +_begin_fstest auto quick
> +
> +_cleanup()
> +{
> +	[ -n "$atomic_write_pid" ] && kill -9 $atomic_write_pid
> +	wait
> +	cd /
> +	rm -r -f $tmp.*
> +}
> +
> +_fixed_by_kernel_commit f098aeba04c9 \
> +	"f2fs: fix to avoid atomicity corruption of atomic file"
> +
> +_require_scratch
> +
> +_scratch_mkfs >> $seqres.full
> +# note that it relis on FAULT_TIMEOUT fault injection support in f2fs
> +_scratch_mount "-o fault_injection=1,fault_type=4194304" >> $seqres.full

This requires CONFIG_F2FS_FAULT_INJECTION=y, although now I see that
parse_options() just ignores them and the test still passes fine with
CONFIG_F2FS_FAULT_INJECTION unset. Does it make sense to run without
FAULT_TIMEOUT injection? It'd likely make sense to just _notrun if fault
injection is unavailable.

> +dbfile=$SCRATCH_MNT/file.db
> +
> +# initialize database file
> +$XFS_IO_PROG -c "pwrite 0 4k" -c "fsync" -f $dbfile >> $seqres.full
> +
> +# sync filesystem to clear dirty inode
> +sync
> +
> +# start atomic_write on src.db database file and commit transaction
> +$F2FS_IO_PROG write 1 0 2 zero atomic_commit $dbfile >> $seqres.full &
> +atomic_write_pid=$!
> +
> +# call fsync to flush dirty inode of database file in parallel
> +for ((j=0;j<1000;j++)) do
> +	$F2FS_IO_PROG fsync $dbfile >> $seqres.full
> +done
> +
> +wait $atomic_write_pid
> +unset atomic_write_pid
> +
> +# flush dirty data and drop cache
> +sync
> +echo 3 > /proc/sys/vm/drop_caches
> +
> +newsize=`stat $dbfile -c %s`
> +if [ "$newsize" != "8192" ]; then
> +	_fail "filesize is inconsistent:"$newsize
> +fi

nit: I think it'd be simpler to do:
  stat $dbfile -c %s
...and just put the 8192 in the golden output.

> +rm $dbfile
> +sync
> +
> +echo "Silence is golden"
> +
> +status=0
> +exit
> diff --git a/tests/f2fs/013.out b/tests/f2fs/013.out
> new file mode 100644
> index 00000000..3e66423b
> --- /dev/null
> +++ b/tests/f2fs/013.out
> @@ -0,0 +1,2 @@
> +QA output created by 013
> +Silence is golden



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
