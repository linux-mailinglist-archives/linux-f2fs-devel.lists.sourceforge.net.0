Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 500A3A55F14
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Mar 2025 05:02:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tqOuv-0005Au-No;
	Fri, 07 Mar 2025 04:02:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ddiss@suse.de>) id 1tqOuu-0005Am-8J
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Mar 2025 04:02:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bEEcOxDQxoBvOfODsZEs8MBZ31cdy6U4uglRqHtU0HY=; b=LzHDSdwAGgxOwTGbV/1gIE2yxr
 NlO2PQgkqoAvj3W+cxMK1LKjEW03/aqFwlCUaQ1ncwI47/2P5wQ8urGKT58LpgQx2uKcz9kQdBwp3
 xTQoSUtu277hcI4iniCt5hkITrqhPWUh1KXAvzRE5Kr74R+QuT+R0RMkWx3rABnq1TZg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bEEcOxDQxoBvOfODsZEs8MBZ31cdy6U4uglRqHtU0HY=; b=JwZl/I8aYmBT/S2sdLEiG2RwiC
 gk0+fNkfnq+N3miTJne5goLyE1qp40vz5AKRf4oN8QcWvGmaFIuX/fSOLyvaTn435dFxIwPPIkbft
 +n8BrmgmLiXt7MpZQyZQjQGqbclI+ZTvvYA38vs45eK4hRi/kbJRcLrd+j36F19qPljk=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tqOus-0001k2-Rv for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Mar 2025 04:02:32 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 58BE321193;
 Fri,  7 Mar 2025 04:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741320139; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bEEcOxDQxoBvOfODsZEs8MBZ31cdy6U4uglRqHtU0HY=;
 b=X/GrrDzPEOuinjP6Gs5WGnMps7InfKGg9Eu7s0VPHZS0+E92O6SrtIPdZStyVznBpvnbpk
 lb+VzUpPMLn3Ek760UOMlr3iYSaE/NrT9nQBh1Kjt1B50FEiTNxtqf33wWGvmppm4ZJubf
 kTP7ANOr6eQOmGsH1/RdXatr+awNoSM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741320139;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bEEcOxDQxoBvOfODsZEs8MBZ31cdy6U4uglRqHtU0HY=;
 b=zy1FyPf6I7253F8A5b5CjHaXaeRSbQ5U3VwARNc45y8ToZ5VkO/sjA5pxjdWCn12Xbm1T8
 rtNnlxw15N+06PCg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="X/GrrDzP";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zy1FyPf6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741320139; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bEEcOxDQxoBvOfODsZEs8MBZ31cdy6U4uglRqHtU0HY=;
 b=X/GrrDzPEOuinjP6Gs5WGnMps7InfKGg9Eu7s0VPHZS0+E92O6SrtIPdZStyVznBpvnbpk
 lb+VzUpPMLn3Ek760UOMlr3iYSaE/NrT9nQBh1Kjt1B50FEiTNxtqf33wWGvmppm4ZJubf
 kTP7ANOr6eQOmGsH1/RdXatr+awNoSM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741320139;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bEEcOxDQxoBvOfODsZEs8MBZ31cdy6U4uglRqHtU0HY=;
 b=zy1FyPf6I7253F8A5b5CjHaXaeRSbQ5U3VwARNc45y8ToZ5VkO/sjA5pxjdWCn12Xbm1T8
 rtNnlxw15N+06PCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4C5B613726;
 Fri,  7 Mar 2025 04:02:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4cdrAclvymdMagAAD6G6ig
 (envelope-from <ddiss@suse.de>); Fri, 07 Mar 2025 04:02:17 +0000
Date: Fri, 7 Mar 2025 15:02:12 +1100
From: David Disseldorp <ddiss@suse.de>
To: Chao Yu <chao@kernel.org>
Message-ID: <20250307150212.7cda01f2.ddiss@suse.de>
In-Reply-To: <20250306081809.2397527-4-chao@kernel.org>
References: <20250306081809.2397527-1-chao@kernel.org>
 <20250306081809.2397527-4-chao@kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 58BE321193
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.997]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 MIME_TRACE(0.00)[0:+]; MISSING_XM_UA(0.00)[];
 TO_DN_SOME(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_FIVE(0.00)[5]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Thanks for submitting the new test. It looks good aside from
 a few minor things below... On Thu, 6 Mar 2025 16:18:09 +0800, Chao Yu wrote:
 > This is a regression test to check whether fsck can handle corrupted >
 nlinks correctly, it uses inject.f2fs to inject nlinks w/ wrong value, > and
 expects fsck.f2fs can detect such corruption and d [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.130 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [195.135.223.130 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [195.135.223.130 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tqOus-0001k2-Rv
Subject: Re: [f2fs-dev] [PATCH 4/4] f2fs/009: detect and repair nlink
 corruption
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
Cc: jaegeuk@kernel.org, Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Thanks for submitting the new test. It looks good aside from a few minor
things below...

On Thu,  6 Mar 2025 16:18:09 +0800, Chao Yu wrote:

> This is a regression test to check whether fsck can handle corrupted
> nlinks correctly, it uses inject.f2fs to inject nlinks w/ wrong value,
> and expects fsck.f2fs can detect such corruption and do the repair.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  tests/f2fs/009     | 142 +++++++++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/009.out |   2 +
>  2 files changed, 144 insertions(+)
>  create mode 100755 tests/f2fs/009
>  create mode 100644 tests/f2fs/009.out
> 
> diff --git a/tests/f2fs/009 b/tests/f2fs/009
> new file mode 100755
> index 00000000..8f6a3e11
> --- /dev/null
> +++ b/tests/f2fs/009
> @@ -0,0 +1,142 @@
> +#! /bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
> +#
> +# FS QA Test No. f2fs/009
> +#
> +# This is a regression test to check whether fsck can handle corrupted
> +# nlinks correctly, it uses inject.f2fs to inject nlinks w/ wrong value,
> +# and expects fsck.f2fs can detect such corruption and do the repair.
> +#
> +. ./common/preamble
> +_begin_fstest auto quick
> +
> +_require_scratch

You should probably check for F2FS_INJECT_PROG and skip if not present.
Is it dependent on CONFIG_F2FS_FAULT_INJECTION? If so it'd be nice if
you could check for that too.

Flag the fix for the regression via e.g.:
_fixed_by_git_commit f2fs-tools 958cd6e

> +
> +dir=$SCRATCH_MNT

I think it'd be easier to follow if you dropped this alias and just used
$SCRATCH_MNT directly.

> +filename=$dir/foo
> +hardlink=$dir/bar
> +
> +for ((i=0;i<14;i++)) do
> +	echo "round: " $i >> $seqres.full
> +
> +	_scratch_mkfs "-f" >> $seqres.full
> +	_scratch_mount >> $seqres.full
> +
> +	if [ $i == 0 ]; then
> +		touch $filename
> +		ino=`stat $filename | awk '/Inode:/ {print $4}'`

Use "stat -c '%i'" instead of piping into awk. Also, it looks like this
is called in every round, so just move it after the elifs.

> +		nlink=0
> +	elif [ $i == 1 ]; then
> +		mkdir $filename
> +		ino=`stat $filename | awk '/Inode:/ {print $4}'`
> +		nlink=1
> +	elif [ $i == 2 ]; then
> +		mknod $filename c 9 0
> +		ino=`stat $filename | awk '/Inode:/ {print $4}'`
> +		nlink=0
> +	elif [ $i == 3 ]; then
> +		mknod $filename b 8 0
> +		ino=`stat $filename | awk '/Inode:/ {print $4}'`
> +		nlink=0
> +	elif [ $i == 4 ]; then
> +		mkfifo $filename
> +		ino=`stat $filename | awk '/Inode:/ {print $4}'`
> +		nlink=0
> +	elif [ $i == 5 ]; then
> +		socket -s $filename >> $seqres.full 2>&1 &
> +		pid=$!
> +		sleep 2
> +		ino=`stat $filename | awk '/Inode:/ {print $4}'`
> +		kill $pid >> $seqres.full 2>&1
> +		nlink=0
> +	elif [ $i == 6 ]; then
> +		ln -s $dir/empty $filename
> +		ino=`stat $filename | awk '/Inode:/ {print $4}'`
> +		nlink=0
> +	elif [ $i == 7 ]; then
> +		# orphan inode
> +		touch $filename
> +		ino=`stat $filename | awk '/Inode:/ {print $4}'`
> +		$F2FS_IO_PROG write 1 0 1 zero atomic_commit $filename 5000 >> $seqres.full 2>&1 &
> +		stat $filename >> $seqres.full
> +		rm $filename
> +		$F2FS_IO_PROG shutdown 1 $dir/ >> $seqres.full
> +		sleep 6
> +		nlink=1
> +	elif [ $i == 8 ]; then
> +		# hardlink on file
> +		touch $filename
> +		ino=`stat $filename | awk '/Inode:/ {print $4}'`
> +		ln $filename $hardlink
> +		nlink=0
> +	elif [ $i == 9 ]; then
> +		# hardlink on charactor
> +		mknod $filename c 9 0
> +		ino=`stat $filename | awk '/Inode:/ {print $4}'`
> +		ln $filename $hardlink
> +		nlink=0
> +	elif [ $i == 10 ]; then
> +		# hardlink on blockdev
> +		mknod $filename b 8 0
> +		ino=`stat $filename | awk '/Inode:/ {print $4}'`
> +		ln $filename $hardlink
> +		nlink=0
> +	elif [ $i == 11 ]; then
> +		# hardlink on pipe
> +		mkfifo $filename
> +		ino=`stat $filename | awk '/Inode:/ {print $4}'`
> +		ln $filename $hardlink
> +		nlink=0
> +	elif [ $i == 12 ]; then
> +		# hardlink on socket
> +		socket -s $filename >> $seqres.full 2>&1 &
> +		pid=$!
> +		sleep 2
> +		ino=`stat $filename | awk '/Inode:/ {print $4}'`
> +		kill $pid >> $seqres.full 2>&1
> +		ln $filename $hardlink
> +		nlink=0
> +	elif [ $i == 13 ]; then
> +		# hardlink on symlink
> +		ln -s $dir/empty $filename
> +		ino=`stat $filename | awk '/Inode:/ {print $4}'`
> +		ln $filename $hardlink
> +		nlink=0
> +	fi
> +
> +	if [ $i != 7 ]; then
> +		stat $dir/* >> $seqres.full
> +	fi
> +	echo "ino:"$ino >> $seqres.full
> +	echo "nlink:"$nlink >> $seqres.full
> +
> +	_scratch_unmount
> +
> +	$F2FS_INJECT_PROG --node --mb i_links --nid $ino --val $nlink $SCRATCH_DEV >> $seqres.full
> +	if [ $? != 0 ]; then
> +		exit
> +	fi

xfstests failures are normally triggered via golden output mismatch
instead of explicit status checks or _fail calls... Can you filter the
inject / repair output so that it ends up in the golden output for
comparison?

> +	export FSCK_OPTIONS="-f"
> +	_repair_scratch_fs >> $seqres.full
> +	if [ $? != 1 ]; then
> +		_fail "fsck can not detect and repair zero nlink corruption "$i
> +		exit
> +	fi
> +
> +	export FSCK_OPTIONS=""
> +	_check_scratch_fs >> $seqres.full
> +	if [ $? != 0 ]; then
> +		_fail "fsck hasn't fixed nlink corruption "$i
> +		exit
> +	fi
> +
> +	_scratch_mount >> $seqres.full
> +	_scratch_unmount
> +done
> +
> +echo "Silence is golden"
> +
> +status=0
> +exit
> diff --git a/tests/f2fs/009.out b/tests/f2fs/009.out
> new file mode 100644
> index 00000000..7e977155
> --- /dev/null
> +++ b/tests/f2fs/009.out
> @@ -0,0 +1,2 @@
> +QA output created by 009
> +Silence is golden



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
