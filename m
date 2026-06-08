Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9OqtBqPVJmqplQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 08 Jun 2026 16:45:55 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D39B65777A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 08 Jun 2026 16:45:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=bdxxG9Vq;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=L1PaN2I3;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=HXfP35oK;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=IPtxXofW;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2OKUXLQXL7Np1LXF43RzwbngSJ4+5ksxDfNqyXbKf9I=; b=bdxxG9VqovueyH+WrleDZ3SVlD
	9NvEOGZol6UDjtkFc8iy5YdwiL7rzWJBMvamemJkA2QlBnVWTXBOCRUCIQFtIBSHzvdxlZdtrBGe1
	1Z34av6bjlnuYbL3l0Mbpqhe25B0IHKqFFvwq8xa3c0C4nWjAk1qDbUR1gOeTJ63wagE=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wWbEY-0002ub-7a;
	Mon, 08 Jun 2026 14:45:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <asj@kernel.org>) id 1wWbEW-0002uU-OY
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 Jun 2026 14:45:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eMupXoLHKpHSGL6RzI+ojljk59tkFXcgvJKiDR/wsfw=; b=L1PaN2I3Q19Nv8CirZyxHeoPvw
 YcJdNn3HtDfsa/Ou8f8URaYSsSpQ9uibTclu0vfTzlu6Nd+pLDO3A8+5VoVXLa4A2DZqX56hIOtRJ
 0PvfWL7g2Pk3o2fMstWtEa9aTk1lEk2gbQzzNvXzde1EmJQPMsB3V6XAYTi9L+Dn0ua4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:
 Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eMupXoLHKpHSGL6RzI+ojljk59tkFXcgvJKiDR/wsfw=; b=HXfP35oKfOseuz8mH8F4776849
 JW2NXRXhQ9LNmjpahO86qE4yuxBG47Dnaz0SGRSgoDJ2FE6r0/uHamGPP+G1c6FtvTNnuJqVrdfch
 ZZdeKIGW9v21yjF7M4sp66FWPIalIdoSvcxaHM905Kq7vetFQIL5K2uANk0zSQDmozvQ=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wWbEW-0004Q2-89 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 Jun 2026 14:45:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 1E350601E2;
 Mon,  8 Jun 2026 14:45:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17CFC1F00893;
 Mon,  8 Jun 2026 14:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1780929938;
 bh=eMupXoLHKpHSGL6RzI+ojljk59tkFXcgvJKiDR/wsfw=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To;
 b=IPtxXofWi98pL9w2GyjRszl4qWIMMQ1npzeaT75Dy7FcUq2tM1sVl20iW/h9STYro
 0GoYCpOubfssbhAjkhan+W/RMiG6OM4SGaICRyLhd3JCh/NWvXm6QB6GCaQHmnhgdB
 DmejkJLpr/fQiYWFjrRcLOQvDD5JXJwpjG/XjpnONIlOQECybg2jTlchBwdi7C3F+8
 SHqDi8KFzVk2HLiBVSloBo6CU2CkvH8CppoELb4bvXHG812r4c6KCgjAzE4jQjFtvh
 rd3vjYyHTCKYc84H26jh3kcMEScQR4CyYNjUU80GMYI/ZfRUWK4gtMB4LW1F6r8n9x
 JOI1GiYQ96kMw==
Message-ID: <68ae3aa7-b6bf-4b23-8aef-661377149126@kernel.org>
Date: Mon, 8 Jun 2026 22:45:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Darrick J. Wong" <djwong@kernel.org>
References: <cover.1779939330.git.asj@kernel.org>
 <ef076b330a047d2f19ed48f5b7166f419433bb73.1779939330.git.asj@kernel.org>
 <20260529043647.GF6070@frogsfrogsfrogs>
Content-Language: en-US
In-Reply-To: <20260529043647.GF6070@frogsfrogsfrogs>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 29/5/26 12:36, Darrick J. Wong wrote: > On Thu, May 28,
 2026 at 12:05:36PM +0800, Anand Jain wrote: >> Verify that fanotify events
 are correctly routed to the appropriate >> watcher when cloned fil [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1wWbEW-0004Q2-89
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
From: Anand Suveer Jain via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Anand Suveer Jain <asj@kernel.org>
Cc: hch@infradead.org, zlang@redhat.com, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:djwong@kernel.org,m:hch@infradead.org,m:zlang@redhat.com,m:fstests@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[asj@kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5D39B65777A

On 29/5/26 12:36, Darrick J. Wong wrote:
> On Thu, May 28, 2026 at 12:05:36PM +0800, Anand Jain wrote:
>> Verify that fanotify events are correctly routed to the appropriate
>> watcher when cloned filesystems are mounted.
>> Helps verify kernel's event notification distinguishes between devices
>> sharing the same FSID/UUID.
>>
>> Signed-off-by: Anand Jain <asj@kernel.org>
>> ---
>>  tests/generic/801     | 135 ++++++++++++++++++++++++++++++++++++++++++
>>  tests/generic/801.out |   7 +++
>>  2 files changed, 142 insertions(+)
>>  create mode 100644 tests/generic/801
>>  create mode 100644 tests/generic/801.out
>>
>> diff --git a/tests/generic/801 b/tests/generic/801
>> new file mode 100644
>> index 000000000000..3bfb87d41922
>> --- /dev/null
>> +++ b/tests/generic/801
>> @@ -0,0 +1,135 @@
>> +#! /bin/bash
>> +# SPDX-License-Identifier: GPL-2.0
>> +# Copyright (c) 2026 Anand Jain <asj@kernel.org>.  All Rights Reserved.
>> +#
>> +# FS QA Test 801
>> +# Verify fanotify FID functionality on cloned filesystems by setting up
>> +# watchers and making sure notifications are in the correct logs files.
>> +
>> +. ./common/preamble
>> +
>> +_begin_fstest auto quick mount clone
>> +
>> +_require_test
>> +_require_block_device $TEST_DEV
>> +_require_loop
>> +_require_command "$FSNOTIFYWAIT_PROG" fsnotifywait
>> +_require_unique_f_fsid
>> +
>> +_cleanup()
>> +{
>> +	cd /
>> +	[[ -n $pid1 ]] && { kill -TERM "$pid1" 2> /dev/null; wait $pid1; }
>> +	[[ -n $pid2 ]] && { kill -TERM "$pid2" 2> /dev/null; wait $pid2; }
>> +
>> +	if [ "$semanage_added" = "yes" ]; then
>> +		semanage permissive -d unconfined_t >/dev/null 2>&1 || true
>> +	fi
>> +
>> +	umount $mnt1 $mnt2 2>/dev/null
>> +	_loop_image_destroy "${devs[@]}" 2> /dev/null
>> +	rm -r -f $tmp.*
>> +}
>> +



>> +# Run fsnotifywait in unbuffered mode to watch filesystem-wide create events
>> +monitor_fanotify()
>> +{
>> +	local mmnt=$1
>> +	exec stdbuf -oL $FSNOTIFYWAIT_PROG -m -F -S -e create "$mmnt" 2>&1
> 
> I guess you need stdbuf to force fsnotifywait to run in linebuffered
> mode even if you pipe/redirect it somewhere?
> 

yeah, stdbuf helps get the output as and when created.

>> +}
>> +
>> +# Transform f_fsid into the hi.lo format used in fanotify FID logs
>> +fsid_to_fid_parts()
>> +{
>> +	local fsid=$1
>> +	# Pad to 16 hex chars (64-bit), then split into two 32-bit halves
>> +	local padded=$(printf '%016x' "0x${fsid}")
>> +	local hi=$(printf '%x' "0x${padded:0:8}")   # strips leading zeros
>> +	local lo=$(printf '%x' "0x${padded:8:8}")   # strips leading zeros
>> +	echo "${hi}.${lo}"
>> +}
>> +
>> +# Create base loop device and its clone
>> +devs=()
>> +_loop_image_create_clone devs
>> +mkdir -p $TEST_DIR/$seq
>> +mnt1=$TEST_DIR/$seq/mnt1
>> +mnt2=$TEST_DIR/$seq/mnt2
>> +mkdir -p $mnt1
>> +mkdir -p $mnt2
>> +
>> +# Mount both base and clone filesystems using required clone mount options
>> +_mount $(_common_dev_mount_options) $(_clone_mount_option) ${devs[0]} $mnt1 || \
>> +						_fail "Failed to mount dev1"
>> +_mount $(_common_dev_mount_options) $(_clone_mount_option) ${devs[1]} $mnt2 || \
>> +						_fail "Failed to mount dev2"
>> +
>> +# Fetch filesystem IDs to verify the kernel can differentiate between them
>> +fsid1=$(stat -f -c "%i" $mnt1)
>> +fsid2=$(stat -f -c "%i" $mnt2)
>> +
>> +log1=$tmp.fanotify1
>> +log2=$tmp.fanotify2
>> +
>> +pid1=""
>> +pid2=""
>> +echo "Setup FID fanotify watchers on both mnt1 and mnt2"
>> +
>> +# Permit unconfined_t domains when SELinux is enforcing to prevent fanotify
>> +# blockages
>> +semanage_added="no"
>> +if [ "$(getenforce 2>/dev/null)" = "Enforcing" ]; then
>> +    if ! semanage permissive -l | grep -q "unconfined_t"; then
>> +        semanage permissive -a unconfined_t >/dev/null 2>&1 && semanage_added="yes"
>> +    fi
>> +fi
> 
> Is there a cleaner way to manage setting up and automatically undoing
> this step?
> 
> There might not be, since iirc the suggestion to register cleanup
> functions in a cleanups=() array and call them all in reverse order
> didn't go anywhere.
> 

If there are multiple use cases, we could wrap it up in a helper,
similar to _scratch_dev_pool_{get|put}, if it helps.

Thanks, Anand


>> +
>> +# Start asynchronous fanotify monitors
>> +( monitor_fanotify "$mnt1" > "$log1" ) &
>> +pid1=$!
>> +( monitor_fanotify "$mnt2" > "$log2" ) &
>> +pid2=$!
>> +sleep 2
>> +
>> +echo "Trigger file creation on mnt1"
>> +touch $mnt1/file_on_mnt1
>> +sync
>> +sleep 1
>> +
>> +echo "Trigger file creation on mnt2"
>> +touch $mnt2/file_on_mnt2
>> +sync
>> +sleep 1
>> +
>> +echo "Verify fsid in the fanotify"
>> +kill $pid1 $pid2
>> +wait $pid1 $pid2 2>/dev/null
>> +pid1=""
>> +pid2=""
>> +
>> +e_fsid1=$(fsid_to_fid_parts "$fsid1")
>> +e_fsid2=$(fsid_to_fid_parts "$fsid2")
>> +
>> +# Dump debug details to the full log
>> +echo $fsid1 $e_fsid1 $fsid2 $e_fsid2 >> $seqres.full
>> +cat $log1 >> $seqres.full
>> +cat $log2 >> $seqres.full
>> +
>> +# Ensure monitor 1 only captured events belonging to mnt 1 and fsid 1
>> +if grep -qF "$e_fsid1" "$log1" && ! grep -qF "$e_fsid2" "$log1"; then
>> +	echo "SUCCESS: mnt1 events found"
>> +else
>> +	[ ! -s "$log1" ] && echo "  - mnt1 received no events."
>> +	grep -qF "$e_fsid2" "$log1" && echo "  - mnt1 received event from mnt2."
>> +fi
>> +
>> +# Ensure monitor 2 only captured events belonging to mnt 2 and fsid 2
>> +if grep -qF "$e_fsid2" "$log2" && ! grep -qF "$e_fsid1" "$log2"; then
>> +	echo "SUCCESS: mnt2 events found"
>> +else
>> +	[ ! -s "$log2" ] && echo "  - mnt2 received no events."
>> +	grep -qF "$e_fsid1" "$log2" && echo "  - mnt2 received event from mnt1."
>> +fi
>> +
>> +status=0
>> +exit
>> diff --git a/tests/generic/801.out b/tests/generic/801.out
>> new file mode 100644
>> index 000000000000..d7b318d9f27c
>> --- /dev/null
>> +++ b/tests/generic/801.out
>> @@ -0,0 +1,7 @@
>> +QA output created by 801
>> +Setup FID fanotify watchers on both mnt1 and mnt2
>> +Trigger file creation on mnt1
>> +Trigger file creation on mnt2
>> +Verify fsid in the fanotify
>> +SUCCESS: mnt1 events found
>> +SUCCESS: mnt2 events found
>> -- 
>> 2.43.0
>>
>>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
