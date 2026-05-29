Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCvfC+8XGWoMqQgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 May 2026 06:37:03 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3215FD07D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 May 2026 06:37:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZZMgYeg31NH6QIZeGbM0YkYtid2o1YW/5mE7PFgTOs=; b=ALn2zZTyNQXO2bZ9WaotA2wbb5
	p8tARofd3at0qAgIqT8+fWmGyUJ5asuYJ0hFT0NIyhEDuC4v1hA9ZP0VCN9cvGb0ZeYR98cmQoeiJ
	7+GTlc5vmXwlybwFwe9CKP2DzXh5EuJaMM2PKfyUOwGQBPdG8avY+uZOo5CkIjZ3QM9c=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wSoxs-0008F1-AV;
	Fri, 29 May 2026 04:36:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1wSoxq-0008Er-4V
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 May 2026 04:36:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1uMh8kfIvxutRrHMPIbf15YuJx36+dkpPQHw/A5q6+I=; b=gFmUREApbVOU9O2oImXbYoE7oO
 XIvDjd9vHsZm+xbJj0iI8w/b2IihK6EVFcV/dUVJG3Of4+fzoakxrn8VdZVbyrxsiJWS68rNlq6Ga
 yYHVf9j1fv4LQT5WW9+sI5Th8dk740LsesUkW28xENpmgi44FHHvC2G10K6c7DFErlwM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1uMh8kfIvxutRrHMPIbf15YuJx36+dkpPQHw/A5q6+I=; b=GZ65rlmz2HLZqYMygUqLOW4Rxy
 jPVSMdoes/DvgxmWUiFBZ31mFg4LtpQ0vNBN7dpqAQ6o4z/UvGiHkWgWvEM1uaMAhfbDchWVLqa2L
 QfkHArNQE+f3IMBJBcGsRM/9/ONb4wnyz9TyixnYVsSQeJdZFevtceeIDovcgzzXdgFQ=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wSoxo-0008O6-Tg for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 May 2026 04:36:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with UTF8SMTP id B8CEC60213;
 Fri, 29 May 2026 04:36:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 639141F00893;
 Fri, 29 May 2026 04:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1780029407;
 bh=1uMh8kfIvxutRrHMPIbf15YuJx36+dkpPQHw/A5q6+I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=bP3VdQvXftHQsR7jhfCHYT7Z8vFofwrhnZ09wdEG2sKIPUHSQ2mDE7tpOsGnCC1F9
 OR+bc5ki2aDqz5iuOXacUut65qSj+T6SQu6SM6VQjZQhCs+NfAdWnulUx3dDjrcg+O
 wMpwmA8UtR03qqzQsA5ugdg5iZ6OJvutKNfZDm3UfDsPlI2iZRRXh541NBjztELS7G
 zHikKv/ItfnyBlxY/Vzj1qmeEXi5y6CtYHR+0u1/ambXkm4iYeY7q4B+11fOXp3QLX
 8hSTXNHtV5RDszTuQpBRdNWB6/x7VwGRWeTcdi2Atx13/qzMbceyIEWYGjD2UxuJWY
 bRJJSqqLKvd1g==
Date: Thu, 28 May 2026 21:36:47 -0700
To: Anand Jain <asj@kernel.org>
Message-ID: <20260529043647.GF6070@frogsfrogsfrogs>
References: <cover.1779939330.git.asj@kernel.org>
 <ef076b330a047d2f19ed48f5b7166f419433bb73.1779939330.git.asj@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ef076b330a047d2f19ed48f5b7166f419433bb73.1779939330.git.asj@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, May 28, 2026 at 12:05:36PM +0800, Anand Jain wrote:
 > Verify that fanotify events are correctly routed to the appropriate >
 watcher
 when cloned filesystems are mounted. > Helps verify kernel's [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wSoxo-0008O6-Tg
Subject: Re: [f2fs-dev] [PATCH v6 05/11] fstests: verify fanotify isolation
 on cloned filesystems
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
From: "Darrick J. Wong via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Darrick J. Wong" <djwong@kernel.org>
Cc: hch@infradead.org, zlang@redhat.com, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:asj@kernel.org,m:hch@infradead.org,m:zlang@redhat.com,m:fstests@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[djwong@kernel.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: 6F3215FD07D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 12:05:36PM +0800, Anand Jain wrote:
> Verify that fanotify events are correctly routed to the appropriate
> watcher when cloned filesystems are mounted.
> Helps verify kernel's event notification distinguishes between devices
> sharing the same FSID/UUID.
> 
> Signed-off-by: Anand Jain <asj@kernel.org>
> ---
>  tests/generic/801     | 135 ++++++++++++++++++++++++++++++++++++++++++
>  tests/generic/801.out |   7 +++
>  2 files changed, 142 insertions(+)
>  create mode 100644 tests/generic/801
>  create mode 100644 tests/generic/801.out
> 
> diff --git a/tests/generic/801 b/tests/generic/801
> new file mode 100644
> index 000000000000..3bfb87d41922
> --- /dev/null
> +++ b/tests/generic/801
> @@ -0,0 +1,135 @@
> +#! /bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2026 Anand Jain <asj@kernel.org>.  All Rights Reserved.
> +#
> +# FS QA Test 801
> +# Verify fanotify FID functionality on cloned filesystems by setting up
> +# watchers and making sure notifications are in the correct logs files.
> +
> +. ./common/preamble
> +
> +_begin_fstest auto quick mount clone
> +
> +_require_test
> +_require_block_device $TEST_DEV
> +_require_loop
> +_require_command "$FSNOTIFYWAIT_PROG" fsnotifywait
> +_require_unique_f_fsid
> +
> +_cleanup()
> +{
> +	cd /
> +	[[ -n $pid1 ]] && { kill -TERM "$pid1" 2> /dev/null; wait $pid1; }
> +	[[ -n $pid2 ]] && { kill -TERM "$pid2" 2> /dev/null; wait $pid2; }
> +
> +	if [ "$semanage_added" = "yes" ]; then
> +		semanage permissive -d unconfined_t >/dev/null 2>&1 || true
> +	fi
> +
> +	umount $mnt1 $mnt2 2>/dev/null
> +	_loop_image_destroy "${devs[@]}" 2> /dev/null
> +	rm -r -f $tmp.*
> +}
> +
> +# Run fsnotifywait in unbuffered mode to watch filesystem-wide create events
> +monitor_fanotify()
> +{
> +	local mmnt=$1
> +	exec stdbuf -oL $FSNOTIFYWAIT_PROG -m -F -S -e create "$mmnt" 2>&1

I guess you need stdbuf to force fsnotifywait to run in linebuffered
mode even if you pipe/redirect it somewhere?

> +}
> +
> +# Transform f_fsid into the hi.lo format used in fanotify FID logs
> +fsid_to_fid_parts()
> +{
> +	local fsid=$1
> +	# Pad to 16 hex chars (64-bit), then split into two 32-bit halves
> +	local padded=$(printf '%016x' "0x${fsid}")
> +	local hi=$(printf '%x' "0x${padded:0:8}")   # strips leading zeros
> +	local lo=$(printf '%x' "0x${padded:8:8}")   # strips leading zeros
> +	echo "${hi}.${lo}"
> +}
> +
> +# Create base loop device and its clone
> +devs=()
> +_loop_image_create_clone devs
> +mkdir -p $TEST_DIR/$seq
> +mnt1=$TEST_DIR/$seq/mnt1
> +mnt2=$TEST_DIR/$seq/mnt2
> +mkdir -p $mnt1
> +mkdir -p $mnt2
> +
> +# Mount both base and clone filesystems using required clone mount options
> +_mount $(_common_dev_mount_options) $(_clone_mount_option) ${devs[0]} $mnt1 || \
> +						_fail "Failed to mount dev1"
> +_mount $(_common_dev_mount_options) $(_clone_mount_option) ${devs[1]} $mnt2 || \
> +						_fail "Failed to mount dev2"
> +
> +# Fetch filesystem IDs to verify the kernel can differentiate between them
> +fsid1=$(stat -f -c "%i" $mnt1)
> +fsid2=$(stat -f -c "%i" $mnt2)
> +
> +log1=$tmp.fanotify1
> +log2=$tmp.fanotify2
> +
> +pid1=""
> +pid2=""
> +echo "Setup FID fanotify watchers on both mnt1 and mnt2"
> +
> +# Permit unconfined_t domains when SELinux is enforcing to prevent fanotify
> +# blockages
> +semanage_added="no"
> +if [ "$(getenforce 2>/dev/null)" = "Enforcing" ]; then
> +    if ! semanage permissive -l | grep -q "unconfined_t"; then
> +        semanage permissive -a unconfined_t >/dev/null 2>&1 && semanage_added="yes"
> +    fi
> +fi

Is there a cleaner way to manage setting up and automatically undoing
this step?

There might not be, since iirc the suggestion to register cleanup
functions in a cleanups=() array and call them all in reverse order
didn't go anywhere.

> +
> +# Start asynchronous fanotify monitors
> +( monitor_fanotify "$mnt1" > "$log1" ) &
> +pid1=$!
> +( monitor_fanotify "$mnt2" > "$log2" ) &
> +pid2=$!
> +sleep 2
> +
> +echo "Trigger file creation on mnt1"
> +touch $mnt1/file_on_mnt1
> +sync
> +sleep 1
> +
> +echo "Trigger file creation on mnt2"
> +touch $mnt2/file_on_mnt2
> +sync
> +sleep 1
> +
> +echo "Verify fsid in the fanotify"
> +kill $pid1 $pid2
> +wait $pid1 $pid2 2>/dev/null
> +pid1=""
> +pid2=""
> +
> +e_fsid1=$(fsid_to_fid_parts "$fsid1")
> +e_fsid2=$(fsid_to_fid_parts "$fsid2")
> +
> +# Dump debug details to the full log
> +echo $fsid1 $e_fsid1 $fsid2 $e_fsid2 >> $seqres.full
> +cat $log1 >> $seqres.full
> +cat $log2 >> $seqres.full
> +
> +# Ensure monitor 1 only captured events belonging to mnt 1 and fsid 1
> +if grep -qF "$e_fsid1" "$log1" && ! grep -qF "$e_fsid2" "$log1"; then
> +	echo "SUCCESS: mnt1 events found"
> +else
> +	[ ! -s "$log1" ] && echo "  - mnt1 received no events."
> +	grep -qF "$e_fsid2" "$log1" && echo "  - mnt1 received event from mnt2."
> +fi
> +
> +# Ensure monitor 2 only captured events belonging to mnt 2 and fsid 2
> +if grep -qF "$e_fsid2" "$log2" && ! grep -qF "$e_fsid1" "$log2"; then
> +	echo "SUCCESS: mnt2 events found"
> +else
> +	[ ! -s "$log2" ] && echo "  - mnt2 received no events."
> +	grep -qF "$e_fsid1" "$log2" && echo "  - mnt2 received event from mnt1."
> +fi
> +
> +status=0
> +exit
> diff --git a/tests/generic/801.out b/tests/generic/801.out
> new file mode 100644
> index 000000000000..d7b318d9f27c
> --- /dev/null
> +++ b/tests/generic/801.out
> @@ -0,0 +1,7 @@
> +QA output created by 801
> +Setup FID fanotify watchers on both mnt1 and mnt2
> +Trigger file creation on mnt1
> +Trigger file creation on mnt2
> +Verify fsid in the fanotify
> +SUCCESS: mnt1 events found
> +SUCCESS: mnt2 events found
> -- 
> 2.43.0
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
