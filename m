Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D0EC6E889
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Nov 2025 13:43:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m/VO7YNe53ohx4F4vgfkt9+H+BatL0tufj7n+BB7/Pw=; b=fAYhhFuf32eph7vaUZcpl1gqbP
	q1rWZ8aLFTMvPQ+lhNWY73Fzj4DGmgc+ohisRAPyZ9HM672L889DOU125YtBS1xbkx6IEdgy9iR36
	DOnCE6wYsVJRcLOTx5W21xSzA6dkMauL8UMcxyBIWwJ3eyKqURioa/pcovmKcxdF8DYs=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vLhX9-00041n-58;
	Wed, 19 Nov 2025 12:43:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1vLhX7-00041X-IS
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Nov 2025 12:43:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x3doaIU7nG7FPCbGZXY3OwxhizcVCnE1yaieNMvOZo4=; b=WvRFmaxyXpWSXd5ot2Le6w9QZm
 BB5xTjZbKsU8eFO6rbSDtkIYwh4X9VmLPB8+r+zGGachLCrD3of6JbaU03oXFLu6V5mqg51NzhEkx
 BB9F5REtrzbHE0inmal1mCaVfTmEWvRfuCI7tzCxgmR2oYIdW49pXlg0X3Krj9DpGPEA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x3doaIU7nG7FPCbGZXY3OwxhizcVCnE1yaieNMvOZo4=; b=blz5w4LlnWcovETIrULdiLi2CH
 yHKZBEC9e59EGxMbyqXgW707m16Z6oNyMcHYxbhk+CwY3ItNntrIM4dJmWagouvtYxJHfGA6kk/lm
 ohH+c6SV8/WM3kTxTmv3A9zvfCrWX8iOztD3uzgsuLrNY8AIgLcueStJKZNpSkV2sPRs=;
Received: from mail-pl1-f174.google.com ([209.85.214.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vLhX7-00047q-ST for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Nov 2025 12:43:38 +0000
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-298039e00c2so84559345ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 19 Nov 2025 04:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763556207; x=1764161007; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:cc:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x3doaIU7nG7FPCbGZXY3OwxhizcVCnE1yaieNMvOZo4=;
 b=UcFXO3abSnuKF2wY5Oy2sbyTZAMkJ7CQX8d31/IFZLy9RUoV5onUd37YPRpZDTYksm
 pI0MHQ30SJrLe0zsE2jH+xcpHEfuRla3LtNc+x97n6FBCSxmwXmLWa5VngSzTdzjrmYt
 D27UFC/zueGqRyX4gKSsQ9Sy9YnLP2pjH4Auw6xlYtQ4CoyYoCXPFDFhijTfnbnOF1dY
 yHUY8iZz6gG3+M9ykgccMRTdLEcDx+gsHDKo4AY7wXnzBWVcKLpa3tVC178/4evXkLhh
 fD8ms0cE3Va/xmsdM3O4b9kTMueYs06soBecD+fbfKMnaPmOoXd/kTkJLAJH/XXs3AUT
 MwPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763556207; x=1764161007;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:cc:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x3doaIU7nG7FPCbGZXY3OwxhizcVCnE1yaieNMvOZo4=;
 b=s6FcIDFtjVUkhzhvc3eb/v/sZMOkM8gfIiaj55N7R/pihM8+uDmsUIUEFqZuSwt+tL
 9V3CKPpQamkKG0J5gmXeOCqC/A7g/YNh2+1wbjCtwg+c/TsRw/0V54NwQloOQPVdX/gQ
 pMAfP4Sqd3uQxTv7pKpUhjxkHBxw8dbsga5omqYNcx0BA/9dxtZVc7aP0LXDk2PtThto
 f+uQgUkTg0vC9jvPAAzq2TJ51yAXshORJI8MMeh70VvA1+wOlMNwwKVNU5WtLYOvhGpF
 E5gf5eTIS1i/jGOdZeRKYLAwsyyC1xU1wZZQiHacdN79O3vbVxAYkE346b98c8jtUp8w
 AJng==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtJKXgH0EkkflHC/nq/sEAeLusiOIdRVXgsFIFDUPviHz9h3+SfOgEKya0Fiw5X+vgHsOZEnbdubZYl2u59lSM@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwL3PngUX4tvKltT6vba3cw0hYH7qvBFHzVySQL0HrANYFIoh30
 3heToYxT4tMfMwab+hfgPlqJ9/AqhCV0wJhbccGNtBq/TU9BjPbJc2Wh
X-Gm-Gg: ASbGncvY5g0y1pneds6Oy6E8KgOgy9v58bp8J763YgTYKShS4zQKxzp6dpT+YWCvr+6
 2TvVb59Yu1eOnqdXjJTsQu5GYAcirjHvt8RFFFwex4pbBQSzS8I2gdnw8xRcg+ZvfOpiAvmrSB2
 yIevro0nhJ/qbVHBnILopchf041XLOr+SADd+ykKeNInGCx0IVT3c060ZvEG2GKHyAVwN7y+CPG
 SdmJ9Cm0BPa3huu2YgmZGcAeY87cpOqOc4dy25/ME1HQyoT4zVVDuYFWZNDtV/g5bWVQpaVGYbp
 a7/c+Jmy7VKSz7ahUfOp0iQIumZiix/oFsu6IejAg7325PrD5FtCeJCUilQ85/1ji2Lg06OA474
 qHLGZPRX97i9Hz7UY4w0AQ6PjJaZuBWPdF+mH+eMcID29yWflIIRhJ5eP+g1iGwSaD5jGpdmLXv
 X6byO6PWQr9K0/gff50cxqbw==
X-Google-Smtp-Source: AGHT+IGjvNEtuPPwjHz7kJ7mAWFz5VK3+t0vHodSkzytAbRTbEjnymhgZpE/GR48/9parR4KwFrfEw==
X-Received: by 2002:a17:902:ce0c:b0:295:4d50:aab6 with SMTP id
 d9443c01a7336-2986a6d6755mr267554075ad.18.1763556207174; 
 Wed, 19 Nov 2025 04:43:27 -0800 (PST)
Received: from [10.189.144.225] ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7ba611682cfsm16611016b3a.26.2025.11.19.04.43.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Nov 2025 04:43:26 -0800 (PST)
Message-ID: <7878d09e-1706-41e6-820a-f9abae8e3b29@gmail.com>
Date: Wed, 19 Nov 2025 20:43:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Xiaole He <hexiaole1994@126.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20251119060045.52471-1-hexiaole1994@126.com>
Content-Language: en-US, fr-CH
From: Sheng Yong <shengyong2021@gmail.com>
In-Reply-To: <20251119060045.52471-1-hexiaole1994@126.com>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/19/25 14:00, Xiaole He wrote: > The code was checking
 for a non-existent macro `HDIO_GETGIO` instead of > `HDIO_GETGEO`, which
 caused the ioctl() call to never be executed. > This resulted in st [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.174 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vLhX7-00047q-ST
Subject: Re: [f2fs-dev] [PATCH v1] mkfs.f2fs: fix incorrect start_sector
 detection due to typo in HDIO_GETGEO macro check
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
Cc: jaegeuk@kernel.org, shengyong1@xiaomi.com, daehojeong@google.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/19/25 14:00, Xiaole He wrote:
> The code was checking for a non-existent macro `HDIO_GETGIO` instead of
> `HDIO_GETGEO`, which caused the ioctl() call to never be executed.
> This resulted in start_sector always being set to 0, even when the
> partition actually starts at a different sector (e.g., 2048).
> 
> This bug affects:
> - lib/libf2fs.c: get_device_info() function (lines 967, 1076)
> - tools/fibmap.c: stat_bdev() function (lines 91, 108)
> 
> Reproducer:
> 1. Create a partition starting at sector 2048:
>     # parted -s /dev/sdb mklabel gpt
>     # parted -s /dev/sdb mkpart primary 2048s 32GiB
> 
> 2. Verify the partition start sector:
>     # cat /sys/block/sdb/sdb1/start
>     2048
> 
> 3. Format with f2fs-tools (before fix) and verify incorrect calculation:
>     # mkfs.f2fs /dev/sdb1
>     # Info: zone aligned segment0 blkaddr: 512
> 
>     The calculation happens in
>     mkfs/f2fs_format.c:f2fs_prepare_super_block():
> 
>     With default values:
>     - blk_size_bytes = 4096
>     - c.blks_per_seg = 512
>     - c.segs_per_sec = 1
>     - c.secs_per_zone = 1
>     - zone_size_bytes = blk_size_bytes * c.secs_per_zone
>                         * c.segs_per_sec * c.blks_per_seg
>                       = 4096 * 1 * 1 * 512 = 2,097,152 bytes (2MB)
>     - alignment_bytes = zone_size_bytes (for non-zoned or single device)
> 
>     With c.start_sector = 0 (bug case):
>     - zone_align_start_offset
>         = ((c.start_sector * DEFAULT_SECTOR_SIZE +
>            2 * F2FS_BLKSIZE + alignment_bytes - 1) /
>            alignment_bytes * alignment_bytes) -
>            (c.start_sector * DEFAULT_SECTOR_SIZE)
>         = ((0 * 512 + 2 * 4096 + 2,097,152 - 1) /
>            2,097,152 * 2,097,152) - (0 * 512)
>         = ((8,192 + 2,097,152 - 1) / 2,097,152 * 2,097,152) - 0
>         = 2,097,152 - 0 = 2,097,152 bytes (2MB)
>     - segment0_blkaddr = zone_align_start_offset / blk_size_bytes
>         = 2,097,152 / 4,096 = 512 blocks
> 
>     This matches the output "segment0 blkaddr: 512".
> 
>     With c.start_sector = 2048 (correct case):
>     - zone_align_start_offset
>         = ((2048 * 512 + 2 * 4096 + 2,097,152 - 1) /
>            2,097,152 * 2,097,152) - (2048 * 512)
>         = ((1,048,576 + 8,192 + 2,097,152 - 1) /
>            2,097,152 * 2,097,152) - 1,048,576
>         = 2,097,152 - 1,048,576 = 1,048,576 bytes (1MB)
>     - segment0_blkaddr = zone_align_start_offset / blk_size_bytes
>         = 1,048,576 / 4,096 = 256 blocks
> 
> 4. Confirm the bug with gdb:
>     So the correct output should be "segment0 blkaddr: 256", not 512.
> 
>     # gdb --args mkfs.f2fs /dev/sdb1
>     (gdb) b lib/libf2fs.c:1075
>     (gdb) run
>     1075                    if (i == 0) {
>     (gdb) l
>     1075                    if (i == 0) {
>     1076    #ifdef HDIO_GETGIO
>     1077                            if (ioctl(fd, HDIO_GETGEO, &geom) < 0)
>     1078                                    c.start_sector = 0;
>     1079                            else
>     1080                                    c.start_sector = geom.start;
>     1081    #else
>     1082                            c.start_sector = 0;
>     1083    #endif
>     1084                    }
>     (gdb) n
>     1082                            c.start_sector = 0;
>     # At line 1076: #ifdef HDIO_GETGIO (bug - this macro doesn't exist)
>     # The ioctl() call at line 1077 is skipped, and execution goes
>     # directly to line 1082, setting c.start_sector = 0
> 
> After fix:
>     mkfs.f2fs output:
>     Info: zone aligned segment0 blkaddr: 256
> 
>     gdb output:
>     (gdb) p c.start_sector
>     $1 = 2048
> 
>     The ioctl() correctly retrieves the partition start sector (2048),
>     and zone_align_start_offset is calculated correctly, resulting in
>     segment0_blkaddr = 256.
> 
> Fixes: 43bb7b6c99fa ("f2fs-tools: build binaries in Mac")
> Signed-off-by: Xiaole He <hexiaole1994@126.com>

Reviewed-by: Sheng Yong <shengyong1@xiaomi.com>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
