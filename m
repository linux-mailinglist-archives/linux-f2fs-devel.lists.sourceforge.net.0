Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC0CC8DFF3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Nov 2025 12:22:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VeIZXqSyWG11a8PPoo02uvd/RvK13jvGHsf3YxPeaFo=; b=FlPJbQjuaDwcBznEhBiDFbbf9/
	uhVNp4VlasaY6q3i0yDZoREAG071zvMttOUo4RDEdotmQnKY5vNAMeahW0LHdBtu4wHoZ0/V3gsyA
	TNb0IB7dy9i/M5ycGvqUraJ4nNciTXLvC4Eughxdb9aXPs4YV5dok0BUYtCG3VsEA+hA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vOa4R-0004WG-08;
	Thu, 27 Nov 2025 11:21:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1vOa4P-0004W4-HH
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Nov 2025 11:21:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RiM+f4XBTP5bNsl/GUvCfA+u0+IoaVmBI8tk/Oh8gWE=; b=kXWm7JexO/0m1CS2FvO4CWPDXb
 77GEHxcyPReMMi/HTK03JXsOn5RpotTyPTEvTRjH5gCA+Ib7jwKz7eiBavokFI2ChGE3gVq4WOviJ
 kzhaJC9hqdSpwPyR2InOCRIAyIi6CfvCWtwXt2y7571QPNC1OkHA564XIBSRduzwyF4U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RiM+f4XBTP5bNsl/GUvCfA+u0+IoaVmBI8tk/Oh8gWE=; b=DtDrJ3ztoyO+e6YSY4Q1itAo6K
 LzyxDAIn+ddmlLGSY0fy+WkTREx1Ze2zLqr2sT4sG/PKF07KBkLmRKW7DifA6CRRcEOaAALA0/7h2
 PLIVgajqnCYXX9db1QzMi9kOw9bBjhaWZOWEHpGRAXDmedCBN6VHO6j01Rayi1YfD0sU=;
Received: from mail-pf1-f175.google.com ([209.85.210.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vOa4P-0006cC-Iv for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Nov 2025 11:21:54 +0000
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-7ba55660769so624055b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 27 Nov 2025 03:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764242503; x=1764847303; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:cc:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RiM+f4XBTP5bNsl/GUvCfA+u0+IoaVmBI8tk/Oh8gWE=;
 b=VJ409X1iuKVYJLozAnIPAHoX6xgkHUninwMSBLvMKzu6/a/FJziB2AjfbG4e3F0pSg
 QtTiDV3se+ya0bcGQZ+MXzEFCw067/DrSRG7Jn6GACcfmRy8CSxgDG8m2byNtWrwmOMk
 id2RIQrangID2vH9LacDH9H4acgNcHhWvr+ZM3Yz/3EhcZkSZALsvNTr/nRWZ6hqFcEA
 VsexwQfkQ0i8KCIA2QTc1yTaMW336NX3+Lm9ezLA5UUNhC6pYdAv+IRFF+E4YVI8mxFv
 lbR/tm/NaTacgAfqfC/Tpyl1HbWR5JE5MJ4ekXHds579sr7J+iAD/OIUIjdyD45833AX
 UE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764242503; x=1764847303;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:cc:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RiM+f4XBTP5bNsl/GUvCfA+u0+IoaVmBI8tk/Oh8gWE=;
 b=EUdtOEVGKa2htcIjL0YO8+impa7FiyYlmlCJMxTy2L/MeRQSW73SndsYQXaQQyqSTT
 E67alkc3UC3uZwo3nOiP2y16/neXQeshO9vrdygX8jee45mOZP+XMZrNFESG8ud4YgB9
 AiSmfv8bXBDrdW6DmEhhng4munN3JmqQGU4QU5lgKXnieUgJ0vqdAxXQFJYtJNdxOpvP
 evCdmrGnOhd0UYMzPZMNMQ+IDvAnhbL+DbWciJ581tpj8buaWE+aaN/VFpnB8wbG+p5I
 2QP5als30j7Z55kPknsTh3oKpaR9FWGtHMc9OSSBgHg1qno6nbV1NWA6pAFQHn9A/nGd
 oK5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmqTbrjgVCJsfoM1nBu5WHpkEynr0Ylpb/V0QFWIAsQtXc3HhbXd8NnHI0y1BuI+GqY/iU+f2KJSmQtKjuj9jA@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwOZu+4MmxWcRVxwffDSFx+SM5JF9QjK2XNvRfpIopMDyX6ag9Z
 LeMKpz0LpCJpNyd28oZmimWvob2dOeNvCc69NogVl+Kt9elNxIoRSbRo
X-Gm-Gg: ASbGncsUOiTL1Y7CNGLDFz8/U70JvhkDo+4kRO087kWcJ9U3UvMtk6B0ezkfom4RXwL
 nA4k5+OmXSCog9jPxsxLMok3J60GKlG4Ti0Mt8ztoXkx7OYYbxDEl69PBC2ltziXE9dd9Uj1r96
 LqroAd6ZwWrZ6LR95CxI2pDLrmKH6bjYSTJznaE74qxB08Qd4evMc6bwcNEyO3gOjRQhg1bNmEF
 gbd19w/wG6fDuBKT4vkPV6joAAsKJRLfoLP96l6MAz0X38plL0aMu9c0VpMUmuwFLMrHI9DoLZq
 SyLqP8ni9k1yBdbd06FDfj5YAnznOPbrlEsf9IeWH5jAtSx+UWOSWWPMfPL6sNacpuVLI07oT9Q
 MfRjyzguKbGrGA1zh2kYwbEHQdA6DfMsjEDvo40rERQ3gPy/U/gActOWpDe3JcwcQeZDDuSLEoy
 C1q5TPKWNbdaBHJ87p/f6uzg==
X-Google-Smtp-Source: AGHT+IHXXutIjQbulWcuWp0J8TuO4uvnDR8pjIAI7surQ1jHLENlJO/oKe4iA5UagYO30nHf7w3FDQ==
X-Received: by 2002:a05:6a00:1ad1:b0:7ac:9d93:3efa with SMTP id
 d2e1a72fcca58-7c58c2b0f28mr24544425b3a.7.1764242502863; 
 Thu, 27 Nov 2025 03:21:42 -0800 (PST)
Received: from [10.189.144.225] ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7d15e9c3dfcsm1657383b3a.40.2025.11.27.03.21.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Nov 2025 03:21:42 -0800 (PST)
Message-ID: <4078376a-606e-463d-a44d-62ed6c92254c@gmail.com>
Date: Thu, 27 Nov 2025 19:21:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Xiaole He <hexiaole1994@126.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20251119060045.52471-1-hexiaole1994@126.com>
Content-Language: en-US, fr-CH
From: Sheng Yong <shengyong2021@gmail.com>
In-Reply-To: <20251119060045.52471-1-hexiaole1994@126.com>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/19/25 14:00, Xiaole He wrote: [...] > > With default
 values: > - blk_size_bytes = 4096 > - c.blks_per_seg = 512 > - c.segs_per_sec
 = 1 > - c.secs_per_zone = 1 > - zone_size_bytes = blk_size_byte [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.175 listed in wl.mailspike.net]
X-Headers-End: 1vOa4P-0006cC-Iv
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
Cc: liujinbao1@xiaomi.com, jaegeuk@kernel.org, shengyong1@xiaomi.com,
 daehojeong@google.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/19/25 14:00, Xiaole He wrote:
[...]
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

Hi, Xiaole,

We are considering if this is also correct for the current resize. The resize.f2fs
also does this calculation, but it does not update segment0_blkaddr. As a result,
segment_count is 1 section larger than it should be after resizing.

For example, a partition has 2621664 blocks (10G + 224blks) and its start_sector
is 3557152 (in 4K size, 3557152 % 512 = 228). However, the f2fs image is created
separately, its start_sector is 0. Now we are resizing the f2fs image to the
partition.

before: start_sector = 0, zone_align_start_offset = 512 blks
============================================================
block_count                             [0x  2800e0 : 2621664]
section_count                           [0x    13d9 : 5081]
segment_count                           [0x    13ff : 5119]
segment_count_ckpt                      [0x       2 : 2]
segment_count_sit                       [0x       2 : 2]
segment_count_nat                       [0x      18 : 24]
segment_count_ssa                       [0x       a : 10]
segment_count_main                      [0x    13d9 : 5081]
segment0_blkaddr                        [0x     200 : 512]
cp_blkaddr                              [0x     200 : 512]
sit_blkaddr                             [0x     600 : 1536]
nat_blkaddr                             [0x     a00 : 2560]
ssa_blkaddr                             [0x    3a00 : 14848]
main_blkaddr                            [0x    4e00 : 19968]

after: start_sector = 3557152 blks, zone_align_start_offset = 224 blks
======================================================================
block_count                             [0x  2800e0 : 2621664]
section_count                           [0x    13da : 5082]
segment_count                           [0x    1400 : 5120]
segment_count_ckpt                      [0x       2 : 2]
segment_count_sit                       [0x       2 : 2]
segment_count_nat                       [0x      18 : 24]
segment_count_ssa                       [0x       a : 10]
segment_count_main                      [0x    13da : 5082]
segment0_blkaddr                        [0x     200 : 512]
cp_blkaddr                              [0x     200 : 512]
sit_blkaddr                             [0x     600 : 1536]
nat_blkaddr                             [0x     a00 : 2560]
ssa_blkaddr                             [0x    3a00 : 14848]
main_blkaddr                            [0x    4e00 : 19968]

After resizing with HDIO_GETGEO fixed, section_count/segment_count/segment_count_main
are 1 section larger than that without HDIO_GETGEO fixed, while segment0_blkaddr
is still 512.

So, we think the following change is still needed. Could you do more test on the
resize scenario?

Otherwise, I think we should keep HDIO_GETGEO not called for resize for now :-(

thanks,
shengyong

[RFT PATCH] resize.f2fs: fix start_sector not starting from 0

Fixes: mkfs.f2fs: fix incorrect start_sector detection due to typo in HDIO_GETGEO macro check
Reported-by: Liu Jinbao <liujinbao1@xiaomi.com>
Signed-off-by: Liu Jinbao <liujinbao1@xiaomi.com>
Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
---
  fsck/resize.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++++--
  1 file changed, 54 insertions(+), 2 deletions(-)

diff --git a/fsck/resize.c b/fsck/resize.c
index 58914ec2ab88..e82ddf2ddac5 100644
--- a/fsck/resize.c
+++ b/fsck/resize.c
@@ -22,6 +22,8 @@ static int get_new_sb(struct f2fs_super_block *sb)
  					get_sb(log_blocks_per_seg));
  	uint32_t blks_per_seg = 1 << get_sb(log_blocks_per_seg);
  	uint32_t segs_per_zone = get_sb(segs_per_sec) * get_sb(secs_per_zone);
+	uint32_t blk_size_bytes = 1 << get_sb(log_blocksize);
+	unsigned int old_seg0_blkaddr, new_seg0_blkaddr;
  
  	set_sb(block_count, c.target_sectors >>
  				get_sb(log_sectors_per_block));
@@ -33,6 +35,19 @@ static int get_new_sb(struct f2fs_super_block *sb)
  		zone_size_bytes * zone_size_bytes -
  		(uint64_t) c.start_sector * DEFAULT_SECTOR_SIZE;
  
+	old_seg0_blkaddr = get_sb(segment0_blkaddr);
+	new_seg0_blkaddr = zone_align_start_offset / blk_size_bytes;
+	/*
+	 * new_seg0_blkaddr must be larger than old_seg0_blkaddr, otherwise
+	 * migration metadata will be overlapped.
+	 */
+	while (new_seg0_blkaddr < old_seg0_blkaddr)
+		new_seg0_blkaddr += blks_per_seg;
+	zone_align_start_offset = new_seg0_blkaddr * blk_size_bytes;
+	set_sb(segment0_blkaddr, new_seg0_blkaddr);
+	sb->cp_blkaddr = sb->segment0_blkaddr;
+	set_sb(sit_blkaddr, get_sb(segment0_blkaddr) + get_sb(segment_count_ckpt) * c.blks_per_seg);
+
  	set_sb(segment_count, (c.target_sectors * c.sector_size -
  				zone_align_start_offset) / segment_size_bytes /
  				c.segs_per_sec * c.segs_per_sec);
@@ -628,6 +643,35 @@ static int f2fs_resize_check(struct f2fs_sb_info *sbi, struct f2fs_super_block *
  	return 0;
  }
  
+static void migrate_cp(struct f2fs_sb_info *sbi, struct f2fs_super_block *new_sb)
+{
+	struct f2fs_super_block *sb = sbi->raw_super;
+	block_t old_end, new_end;
+	int count, ret;
+	char *blk = calloc(F2FS_BLKSIZE, 1);
+
+	ASSERT(blk != NULL);
+	count = get_sb(segment_count_ckpt) * sbi->blocks_per_seg;
+	old_end = get_sb(cp_blkaddr) + count - 1;
+	new_end = get_newsb(cp_blkaddr) + count - 1;
+	for (; count > 0; count--) {
+		ret = dev_read_block(blk, old_end);
+		ASSERT(ret >= 0);
+		ret = dev_write_block(blk, new_end, WRITE_LIFE_NONE);
+		ASSERT(ret >= 0);
+		old_end--;
+		new_end--;
+	}
+	/*
+	 * All cp packs are migrated to new position, it is safe to change
+	 * cp_blkaddr in old sb so that rebuild_checkpoint() can get the
+	 * correct cp_blkaddr
+	 */
+	MSG(0, "Info: Done to migrate CP blocks: cp_blkaddr = 0x%x -> 0x%x\n",
+		sb->cp_blkaddr, new_sb->cp_blkaddr);
+	sb->cp_blkaddr = new_sb->cp_blkaddr;
+}
+
  static int f2fs_resize_grow(struct f2fs_sb_info *sbi)
  {
  	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
@@ -664,13 +708,20 @@ static int f2fs_resize_grow(struct f2fs_sb_info *sbi)
  			get_sb(log_blocks_per_seg)) + get_sb(main_blkaddr);
  
  	err = -EAGAIN;
-	if (new_main_blkaddr < end_blkaddr) {
+	/*
+	 * main_blkaddr may be updated, if it is not aligned with the old
+	 * image, defragment will change the consistency between data/node
+	 * block and SIT/NAT/SSA.
+	 */
+	if (new_main_blkaddr < end_blkaddr &&
+	    OFFSET_IN_SEG(sbi, new_main_blkaddr) == 0) {
  		err = f2fs_defragment(sbi, old_main_blkaddr, offset,
  						new_main_blkaddr, 0);
  		if (!err)
  			offset_seg = offset >> get_sb(log_blocks_per_seg);
  		MSG(0, "Try to do defragement: %s\n", err ? "Skip": "Done");
-	}
+	} else
+		MSG(0, "do not defrag\n");
  	/* move whole data region */
  	if (err)
  		migrate_main(sbi, offset);
@@ -678,6 +729,7 @@ static int f2fs_resize_grow(struct f2fs_sb_info *sbi)
  	migrate_ssa(sbi, new_sb, offset_seg);
  	migrate_nat(sbi, new_sb);
  	migrate_sit(sbi, new_sb, offset_seg);
+	migrate_cp(sbi, new_sb);
  	rebuild_checkpoint(sbi, new_sb, offset_seg);
  	update_superblock(new_sb, SB_MASK_ALL);
  	print_raw_sb_info(sb);
-- 
2.43.0




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
