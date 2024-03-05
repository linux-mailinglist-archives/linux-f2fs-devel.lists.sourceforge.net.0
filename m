Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5D9872B0B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Mar 2024 00:28:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rheDC-0007nd-T7;
	Tue, 05 Mar 2024 23:28:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rheDB-0007nU-Sf
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Mar 2024 23:28:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eEjPiKXIb+fynaUZxSbO7iiQJsbWGK5dOMznx7fun64=; b=hvK3mzGR0qjZZQsbrvMYOyaTGj
 cDruQFI+XA0H1unM1kjNXcPn0tq/R3YEIFcugLd6JniVx+cVBIfNtAHn2LkbBZxdsuJER6J0Wd65M
 MheyxkIJE6UsTtbuLwLFCWQCIlTCCVRTIBL6FafA6sarHQ76lsML/VLLt7sZ643WX6Bc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eEjPiKXIb+fynaUZxSbO7iiQJsbWGK5dOMznx7fun64=; b=l3n0ie577uHPtv7g9qdp68AJvT
 cSvzFCgLH4i9PLBP5HTGEEV9kyvIb0KVM6H0LY/udRP9xdqbJ3aHc/LxOAYy7kl3bxhebXxxtvo0f
 fyN4bYNLBxTWQ11EfVUqI1CSXNeynS14zayDxGBqvrt4j2xvZCmMM2LXYn1m6eXyyHyc=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rheD2-0003rJ-3z for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Mar 2024 23:28:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 849FBCE1F2C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  5 Mar 2024 23:28:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4BF5C433C7;
 Tue,  5 Mar 2024 23:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709681305;
 bh=27L4pOWFrwC1g57YyoUEfbh9+oQq5Vs01mlHipPt88w=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=mipPC2aeXfg/7ogYaUxPffwb4ewFUdxkoopES4d2yjjGNWMDBUD9/977cG1YZ5YYp
 FSoYNZs41dCN82TsO1nsFEJIYttizB+LEXOIxilmMZze8Ll+7h3UcHVgZZWovJ/DHE
 fqbmo3C/Z0Dx6RqayCFs4RPzr60E4y0FRFY00aGblAIX+5OzChpMYEggRpmWIRszq+
 Wc8B9b0mw5MFe9INHJqtxZitApnz+ZERmvY7utXw4CG4PP739LJRGauLT7VvdPK0+q
 lAiL4e/wAmDeJIDECZ/EgV171VN4drAwHG7FJncSebVbyXa4OV34SFXzVKNXwMGnl0
 fJwbdLBkfbT6w==
Date: Tue, 5 Mar 2024 15:28:24 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <ZeeqmMT8sdPyPKi0@google.com>
References: <20240305001709.637722-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240305001709.637722-1-jaegeuk@kernel.org>
X-Spam-Score: -3.1 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch adds the disk map of block address ranges
 configured
 by multiple partitions. Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> ---
 from v1: - add more layout information 
 Content analysis details:   (-3.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rheD2-0003rJ-3z
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add a proc entry show disk map
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch adds the disk map of block address ranges configured by multiple
partitions.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

 from v1:
  - add more layout information

 fs/f2fs/sysfs.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 10f308b3128f..a568ce96cf56 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -1492,6 +1492,50 @@ static int __maybe_unused discard_plist_seq_show(struct seq_file *seq,
 	return 0;
 }
 
+static int __maybe_unused disk_map_seq_show(struct seq_file *seq,
+						void *offset)
+{
+	struct super_block *sb = seq->private;
+	struct f2fs_sb_info *sbi = F2FS_SB(sb);
+	int i;
+
+	seq_printf(seq, "Address Layout   : %5luB Block address (# of Segments)\n",
+					F2FS_BLKSIZE);
+	seq_printf(seq, " SB            : %12s\n", "0/1024B");
+	seq_printf(seq, " seg0_blkaddr  : 0x%010x\n", SEG0_BLKADDR(sbi));
+	seq_printf(seq, " Checkpoint    : 0x%010x (%10d)\n",
+			le32_to_cpu(F2FS_RAW_SUPER(sbi)->cp_blkaddr), 2);
+	seq_printf(seq, " SIT           : 0x%010x (%10d)\n",
+			SIT_I(sbi)->sit_base_addr,
+			le32_to_cpu(F2FS_RAW_SUPER(sbi)->segment_count_sit));
+	seq_printf(seq, " NAT           : 0x%010x (%10d)\n",
+			NM_I(sbi)->nat_blkaddr,
+			le32_to_cpu(F2FS_RAW_SUPER(sbi)->segment_count_nat));
+	seq_printf(seq, " SSA           : 0x%010x (%10d)\n",
+			SM_I(sbi)->ssa_blkaddr,
+			le32_to_cpu(F2FS_RAW_SUPER(sbi)->segment_count_ssa));
+	seq_printf(seq, " Main          : 0x%010x (%10d)\n",
+			SM_I(sbi)->main_blkaddr,
+			le32_to_cpu(F2FS_RAW_SUPER(sbi)->segment_count_main));
+	seq_printf(seq, " # of Sections : %12d\n",
+			le32_to_cpu(F2FS_RAW_SUPER(sbi)->section_count));
+	seq_printf(seq, " Segs/Sections : %12d\n",
+			SEGS_PER_SEC(sbi));
+	seq_printf(seq, " Section size  : %12d MB\n",
+			SEGS_PER_SEC(sbi) << 1);
+
+	if (!f2fs_is_multi_device(sbi))
+		return 0;
+
+	seq_puts(seq, "\nDisk Map for multi devices:\n");
+	for (i = 0; i < sbi->s_ndevs; i++)
+		seq_printf(seq, "Disk:%2d (zoned=%d): 0x%010x - 0x%010x on %s\n",
+			i, bdev_is_zoned(FDEV(i).bdev),
+			FDEV(i).start_blk, FDEV(i).end_blk,
+			FDEV(i).path);
+	return 0;
+}
+
 int __init f2fs_init_sysfs(void)
 {
 	int ret;
@@ -1573,6 +1617,8 @@ int f2fs_register_sysfs(struct f2fs_sb_info *sbi)
 				victim_bits_seq_show, sb);
 	proc_create_single_data("discard_plist_info", 0444, sbi->s_proc,
 				discard_plist_seq_show, sb);
+	proc_create_single_data("disk_map", 0444, sbi->s_proc,
+				disk_map_seq_show, sb);
 	return 0;
 put_feature_list_kobj:
 	kobject_put(&sbi->s_feature_list_kobj);
-- 
2.44.0.278.ge034bb2e1d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
