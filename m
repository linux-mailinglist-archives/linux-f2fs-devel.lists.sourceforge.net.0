Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id emBTEqX/RmqDgQsAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 03 Jul 2026 02:17:41 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB256FD95B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 03 Jul 2026 02:17:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=Wh0NYaWS;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=Sg3WcMbB;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=aovXlNKg;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=PMG4b5Uj;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BjuoesouQ/KNwJZBXHYX6qzySbyYy4zFLGsmMgnNBCc=; b=Wh0NYaWS2Mse/BwoJAWK+mndK8
	SbDY6aO0+vGAbpYpgdvggbKgLCNtYCvc7g4J9xaNdEdVVLSIAXZQzM2DWxxIoP7vfuS3xj2pUpwXE
	64LcW5vY8oug0cBK+atNHA/7xmDzbGsZNYzq+x3BsjiEIMDTUAFl7S3UKqwKo7Xn297o=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wfRb5-0002qI-5V;
	Fri, 03 Jul 2026 00:17:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wfRb3-0002qB-8V
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Jul 2026 00:17:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lEJr4PdzfS4BNp+gMvKovO0r2bUllJAAVk5U8aS8WEw=; b=Sg3WcMbBOcFy3Tc/2aFjBWHkyj
 8zdX5WeMTdEx6msmf+PbYPi/spNKNZKVYaH4M2AtBrPfiQBHPdDrssVFfvlwAkFdctamOSWULc5By
 h/EasfdwucsI8Gv/cnizMZFR4IFNsStbd8ub2LhqdLPMZUua3goHoCu3f3XivwAQ4oEQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lEJr4PdzfS4BNp+gMvKovO0r2bUllJAAVk5U8aS8WEw=; b=aovXlNKgm6ETGyuVZtbxQKkbXf
 RNTAK3q+9QjykHg0DU/kIqRqP9kduRBUpQL5sgBKlzlhtLc2jHDcERbyB77ZJopjsjLNozW9QoR6W
 QYHmYDH63oomGnx0vF55cctUrSmD9oTw2rdJte8Mfhb0uzY3bwFFcV037ZTNn4ZUrEVs=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wfRb1-0004EP-8O for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Jul 2026 00:17:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id E88C160051;
 Fri,  3 Jul 2026 00:17:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FBA61F000E9;
 Fri,  3 Jul 2026 00:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783037840;
 bh=lEJr4PdzfS4BNp+gMvKovO0r2bUllJAAVk5U8aS8WEw=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=PMG4b5Uj3XeKoi/WUxa746e2MoxA0xs0I1BBv5MJ4JpGd8xYzValdSFk1KRmazN0+
 DctQrjZtgNURjrCdI8sbMK2kKCT1ji2qTofhgErMUBB5z1CuNq4dZO6Lqh1L2mwQk0
 ignw+Utnmwr8VgC9F3jcML67OhqL9zCbkgboh0sgKw/QpcU5ZxrAERc6xKh1bQHxvA
 V3yzkQGnHl8d++lGyn363r9xUo2UHbJ74ZV9Sflg4LfqvKSY4oxRA6axMhC3kJK3Lr
 VTt/8mTmZnFRRUxDPiF8NK7+XbyX+HsddMFCyi898RRTyariZqG3xVmp/q20WApnHX
 NPRoTRLevkemA==
Message-ID: <703b2fea-5a20-4b48-be9d-f0787d2f22b5@kernel.org>
Date: Fri, 3 Jul 2026 08:17:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260629114918.224537-1-chao@kernel.org>
 <akZ1H45tI_Cqm2vR@google.com>
Content-Language: en-US
In-Reply-To: <akZ1H45tI_Cqm2vR@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/2/26 22:26, Jaegeuk Kim wrote: > Hi Chao, > > On 06/29, 
 Chao Yu via Linux-f2fs-devel wrote: >> Blocks of pinfile may not aligned
 to section size due to wrong use >> on pinfile, result in heavy ov [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1wfRb1-0004EP-8O
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid potential
 section-unaligned pinfile
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 stable@kernel.org, Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:stable@kernel.org,m:daehojeong@google.com,s:lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7AB256FD95B

On 7/2/26 22:26, Jaegeuk Kim wrote:
> Hi Chao,
> 
> On 06/29, Chao Yu via Linux-f2fs-devel wrote:
>> Blocks of pinfile may not aligned to section size due to wrong use
>> on pinfile, result in heavy overhead of GC, let avoid this by
>> adding additional check condition in f2fs_setattr().
>>
>> - truncate -s 8mb pinfile
>> : random checkpoint may persist filesize w/ inode
>> - fallocate -o 0 -l 8mb pinfile
>>   - f2fs_fallocate
>>    - f2fs_expand_inode_data
>>     - f2fs_allocate_pinning_section
>>     - f2fs_map_blocks
>>      - f2fs_map_lock
>>      - __allocate_data_block
>>      - file_need_truncate
>>      : w/ FADVISE_TRUNC_BIT, we can expect unaligned mapping can be
>>        truncated while open() if f2fs is not umount abnormally
>>      - f2fs_map_unlock
>>      : following f2fs checkpoint and sudden power-cut
>>
>> - mount
>> - open pinfile
>>   - f2fs_file_open
>>    - finish_preallocate_blocks
>>     - truncate_setsize
>>     : filesize is 8mb
>>     - f2fs_truncate
>>     : can only truncate block outside filesize, rather than truncating
>>       unaligned blocks inside filesize
> 
> Have we reproduced this?

Jaegeuk, I reproduced w/ below script:

#!/bin/bash

set -euo pipefail

DEV="/dev/vdb"
MNT="/mnt/f2fs"
PINFILE="${MNT}/pinfile"
CHUNK_SIZE=$((2 * 1024 * 1024)) # 2MB

# Ensure running as root
if [[ "${EUID:-$(id -u)}" -ne 0 ]]; then
     echo "Error: This script must be run as root." >&2
     exit 1
fi

# 0. Format f2fs image w/ /dev/vdb, and mount /dev/vdb to /mnt/f2fs/
echo "[+] Unmounting ${MNT} if currently mounted..."
umount "${MNT}" 2>/dev/null || true

echo "[+] Formatting ${DEV} with f2fs..."
mkfs.f2fs -f "${DEV}"

echo "[+] Creating mount point ${MNT} and mounting..."
mkdir -p "${MNT}"
mount "${DEV}" "${MNT}"

# 1. Create a pinfile in f2fs image
echo "[+] Creating pinfile at ${PINFILE}..."
touch "${PINFILE}"
f2fs_io pinfile set "${PINFILE}" 2>/dev/null || f2fs_io pinfile 1 "${PINFILE}"
truncate -s 8G "${PINFILE}"
sync

# Task 1: Call appendly fallocate on pinfile inside the range of [0, filesize]
task1_fallocate_append() {
     local file="$1"
     local chunk="$2"
     local max_size
     max_size=$(stat -c %s "$file" 2>/dev/null || echo 0)
     if [ "$max_size" -eq 0 ]; then
         max_size=$((8 * 1024 * 1024 * 1024))
     fi
     local offset=0
     while true; do
         # Try standard fallocate, fallback to f2fs_io fallocate
         fallocate -o "$offset" -l "$chunk" "$file" 2>/dev/null || \
         f2fs_io fallocate 0 "$offset" "$chunk" "$file" 2>/dev/null || break

         offset=$((offset + chunk))
         if [ "$offset" -ge "$max_size" ]; then
             offset=0
         fi
     done
}

# Task 2: Call f2fs checkpoint ioctl and then call shutdown 2 ioctl
task2_checkpoint_shutdown() {
     local target="$1"
     # Small delay to allow Task 1 to begin appending
     sleep 2

     # Call F2FS shutdown ioctl level 2
     f2fs_io shutdown 1 "$target"
}

# Check mapping alignment using f2fs_io fiemap
check_mapping_alignment() {
     local file="$1"
     local align_2mb=$((2 * 1024 * 1024)) # 2MB in bytes
     local align_blocks=512               # 2MB in 4KB blocks

     local fiemap_out
     fiemap_out=$(f2fs_io fiemap 0 4294967295 "$file" 2>/dev/null || f2fs_io fiemap "$file" 2>/dev/null || true)
     if [[ -z "$fiemap_out" ]]; then
         echo "Error: Failed to run f2fs_io fiemap on $file" >&2
         return 1
     fi

     echo "$fiemap_out"

     local aligned=true
     while IFS= read -r line; do
         [[ -z "$line" || "$line" =~ [Ff]iemap|[Ll]ogical|[Pp]hysical|[Ll]ength|[Ff]lags ]] && continue

         local -a cols
         read -r -a cols <<< "$line"
         local phy_str len_str
         if [[ ${#cols[@]} -ge 5 ]]; then
             phy_str="${cols[2]}"
             len_str="${cols[3]}"
         elif [[ ${#cols[@]} -ge 3 ]]; then
             phy_str="${cols[1]}"
             len_str="${cols[2]}"
         else
             continue
         fi

         local phy_val len_val
         if [[ "$phy_str" =~ ^0x || "$phy_str" =~ [a-fA-F] || "${#phy_str}" -gt 10 ]]; then
             phy_val=$((16#${phy_str#0x}))
         else
             phy_val=$((phy_str))
         fi

         if [[ "$len_str" =~ ^0x || "$len_str" =~ [a-fA-F] || "${#len_str}" -gt 10 ]]; then
             len_val=$((16#${len_str#0x}))
         else
             len_val=$((len_str))
         fi

         local unit_align=$align_blocks
         [[ "$len_val" -ge 4096 ]] && unit_align=$align_2mb

         if [[ $((phy_val % unit_align)) -ne 0 || $((len_val % unit_align)) -ne 0 ]]; then
             echo "[!] Unaligned extent mapping detected: $line" >&2
             aligned=false
         fi
     done <<< "$fiemap_out"

     $aligned
}

# 2. Test loop running the two tasks
iteration=0
while true; do
     iteration=$((iteration + 1))
     echo "[*] --- Iteration ${iteration} ---"

     # Task 1: call appendly fallocate on pinfile inside [0, filesize]
     task1_fallocate_append "${PINFILE}" "${CHUNK_SIZE}" &
     task1_pid=$!

     # Task 2: call f2fs checkpoint ioctl and then call shutdown 2 ioctl
     task2_checkpoint_shutdown "${PINFILE}" &
     task2_pid=$!

     # Wait for Task 2 to complete shutdown
     wait "${task2_pid}" 2>/dev/null || true

     # Terminate Task 1 and any child fallocate processes
     pkill -9 -P "${task1_pid}" 2>/dev/null || true
     kill -9 "${task1_pid}" 2>/dev/null || true
     wait "${task1_pid}" 2>/dev/null || true

     # Umount the image -> mount the image
     umount "${MNT}"
     mount "${DEV}" "${MNT}"

     # Use f2fs_io fiemap to check mapping
     if ! check_mapping_alignment "${PINFILE}"; then
         echo "[-] Mapping is not 2MB aligned. Print and break out."
         break
     fi

     echo "[+] Mapping is 2MB aligned."

     # Check space after test; if space exceed 80%, remove the file and call sync
     used_pct=$(df --output=pcent "${MNT}" | tail -n 1 | tr -dc '0-9')
     if [[ "${used_pct:-0}" -ge 80 ]]; then
         echo "[!] Space (${used_pct}%) exceeded 80%. Removing file and calling sync..."
         rm -f "${PINFILE}"
         sync
         touch "${PINFILE}"
         f2fs_io pinfile set "${PINFILE}" 2>/dev/null || f2fs_io pinfile 1 "${PINFILE}"
         truncate -s 8G "${PINFILE}"
     fi
done

> 
>>
>> Fixes: f5a53edcf01e ("f2fs: support aligned pinned file")
>> Cc: stable@kernel.org
>> Cc: Daeho Jeong <daehojeong@google.com>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   fs/f2fs/file.c | 28 +++++++++++++++++-----------
>>   1 file changed, 17 insertions(+), 11 deletions(-)
>>
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index f4facd409d9b..11cc8d79c235 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -1107,17 +1107,23 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>>   			!IS_ALIGNED(attr->ia_size,
>>   			F2FS_BLK_TO_BYTES(fi->i_cluster_size)))
>>   			return -EINVAL;
>> -		/*
>> -		 * To prevent scattered pin block generation, we don't allow
>> -		 * smaller/equal size unaligned truncation for pinned file.
>> -		 * We only support overwrite IO to pinned file, so don't
>> -		 * care about larger size truncation.
>> -		 */
>> -		if (f2fs_is_pinned_file(inode) &&
>> -			attr->ia_size <= i_size_read(inode) &&
>> -			!IS_ALIGNED(attr->ia_size,
>> -			F2FS_BLK_TO_BYTES(CAP_BLKS_PER_SEC(sbi))))
>> -			return -EINVAL;
>> +
>> +		if (f2fs_is_pinned_file(inode)) {
>> +			/*
>> +			 * It may break section-aligned fallocate recovery
>> +			 * mechanism, so do not allow larger size truncation.
>> +			 */
>> +			if (attr->ia_size > i_size_read(inode))
>> +				return -EINVAL;
>> +			/*
>> +			 * To prevent scattered pin block generation, we don't
>> +			 * allow smaller/equal size unaligned truncation for
>> +			 * pinned file.
>> +			 */
>> +			else if (!IS_ALIGNED(attr->ia_size,
>> +				F2FS_BLK_TO_BYTES(CAP_BLKS_PER_SEC(sbi))))
>> +				return -EINVAL;
>> +		}
>>   	}
>>   
>>   	if (is_quota_modification(idmap, inode, attr)) {
>> -- 
>> 2.49.0
>>
>>
>>
>> _______________________________________________
>> Linux-f2fs-devel mailing list
>> Linux-f2fs-devel@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
