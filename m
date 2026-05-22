Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULRSEjgTEGryTAYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 May 2026 10:26:32 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A55E5B08B9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 May 2026 10:26:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HcGuoSer9ZUCdSRGWpkWTlCdna9Qj+Dx73MTUsQKjZg=; b=DOnpHuCgy6M6r45jpO1q+PzkEk
	Ad1DHQ09KGLdZtbJrnUgZjNY8riq4Gh8IQrJpsbxk4ez8HPdD+SECeyEn8y4gQLqXTvjSQAb4d7l9
	acl4tUv5i+oasha7vdKWa5/IWEVGfJTzkMZuwW1zb2OM1yCsgwWS0NOitLbwlf/YJ4/E=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wQLD9-0004p2-Hn;
	Fri, 22 May 2026 08:26:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1wQLD0-0004km-D7
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 May 2026 08:26:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RZb97fPIEBQ2kgV9tOcdvOhMShqwfgTknavbgpERkeM=; b=eKslhQcNrzoPyz8fPBWp27uXHv
 nWLyYo2u4jv8PoLGdJ3qR6o5CBHXX8ZtPYScPG8Qonsif6Z/E2xF7blPlKoDcJWkzil519ISh/fah
 u00ZU9hb0h5CDE2X1MjVceG3lYsZAXTP5c2VFTsDKScVGkoqbaPPrVP4z32MddYAen5Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=RZb97fPIEBQ2kgV9tOcdvOhMShqwfgTknavbgpERkeM=; b=b
 wfVYpX3MDrzwj44wXxpaxzUed3fpVG0TabkkV2wovPCX50gfDudfJ1Fnp+3cPvW1i3560znswwRbD
 ALv+sMZuDGIFb4V2uJybOAiWCh186zLXK9ASN0ueMn2NdDLqQk/eorBBMTYPZXMkW1pjATEgu5cuG
 Sk0xix8XAJukXsEQ=;
Received: from r3-23.sinamail.sina.com.cn ([202.108.3.23])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wQLCv-00084s-Ei for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 May 2026 08:26:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1779438374; bh=RZb97fPIEBQ2kgV9tOcdvOhMShqwfgTknavbgpERkeM=;
 h=From:Subject:Date:Message-ID;
 b=y89loQluIB2iE3Xos8aI4tZIOrNQHdq01KLm3VW1vGlkSAor7gAO0P6YO0gfhdKpV
 8jmkDiXXTVkpCyB+hCG5gHPhL6+7A37fcTLMNeofW0lUhtTHEL97GAmKHFqdtx1MMY
 n6edYYL/NeKi3EYDTokNKCFusEFMcM2M6hLDbpHw=
X-SMAIL-HELO: xiaomi-ThinkCentre-M760t.mioffice.cn
Received: from unknown (HELO
 xiaomi-ThinkCentre-M760t.mioffice.cn)([114.247.175.249])
 by sina.com (10.54.253.31) with ESMTP
 id 6A10131A000005F2; Fri, 22 May 2026 16:26:05 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 9246366816258
X-SMAIL-UIID: BDDB5E34FF4F45649126E73581957B72-20260522-162605-1
From: Yongpeng Yang <monty_pavel@sina.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Fri, 22 May 2026 16:25:52 +0800
Message-ID: <20260522082551.3728258-2-monty_pavel@sina.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yongpeng Yang Add support for
 F2FS_IOC_GET_READ_CACHE_EXTENTS
 ioctl which exports the read extent cache of a file to userspace. Uses a
 two-call pattern: first queries node_count, then fetches all extents. 
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
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1wQLCv-00084s-Ei
Subject: [f2fs-dev] [PATCH] f2fs_io: add get_read_extents command for read
 extent cache ioctl
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 Yongpeng Yang <monty_pavel@sina.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[sina.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[sina.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,sina.com:s=201208];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,sina.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,sina.com:mid]
X-Rspamd-Queue-Id: 7A55E5B08B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

Add support for F2FS_IOC_GET_READ_CACHE_EXTENTS ioctl which exports
the read extent cache of a file to userspace. Uses a two-call pattern:
first queries node_count, then fetches all extents.

Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
 tools/f2fs_io/f2fs_io.c | 73 +++++++++++++++++++++++++++++++++++++++++
 tools/f2fs_io/f2fs_io.h | 20 +++++++++++
 2 files changed, 93 insertions(+)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 94e61b8..3084dda 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -1948,6 +1948,78 @@ static void do_precache_extents(int argc, char **argv, const struct cmd_desc *cm
 	exit(0);
 }
 
+#define get_read_extents_desc "get read extent cache entries"
+#define get_read_extents_help					\
+"f2fs_io get_read_extents [file_path]\n\n"			\
+"  file_path : path to the target file\n"
+
+static void do_get_read_extents(int argc, char **argv,
+				const struct cmd_desc *cmd)
+{
+	struct f2fs_read_cache_extent *rec;
+	unsigned int i, count;
+	size_t alloc_size;
+	int fd, ret;
+
+	if (argc != 2) {
+		fputs("Excess arguments\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	fd = xopen(argv[1], O_RDONLY, 0);
+
+	/* first call: ext_count=0 to query the actual count */
+	alloc_size = sizeof(struct f2fs_read_cache_extent);
+	rec = xmalloc(alloc_size);
+	memset(rec, 0, alloc_size);
+
+	ret = ioctl(fd, F2FS_IOC_GET_READ_CACHE_EXTENTS, rec);
+	if (ret < 0)
+		die_errno("F2FS_IOC_GET_READ_CACHE_EXTENTS (query) failed");
+
+	count = rec->node_count;
+	printf("flags: 0x%x", rec->flags);
+	if (rec->flags & F2FS_EXT_FL_NO_EXTENT)
+		printf(" (NO_EXTENT: extent cache disabled)");
+	printf("\n");
+	printf("largest extent: fofs=%u blk=%u len=%u access_mode=%u\n",
+		rec->largest.fofs, rec->largest.blk, rec->largest.len,
+		rec->largest.last_access_mode);
+	printf("extent node count: %u\n", count);
+
+	if ((rec->flags & F2FS_EXT_FL_NO_EXTENT) || count == 0) {
+		free(rec);
+		close(fd);
+		exit(0);
+	}
+	free(rec);
+
+	/* second call: allocate array and fetch all extents */
+	alloc_size = sizeof(struct f2fs_read_cache_extent) +
+			count * sizeof(struct f2fs_cache_extent_info);
+	rec = xmalloc(alloc_size);
+	memset(rec, 0, alloc_size);
+	rec->ext_count = count;
+
+	ret = ioctl(fd, F2FS_IOC_GET_READ_CACHE_EXTENTS, rec);
+	if (ret < 0)
+		die_errno("F2FS_IOC_GET_READ_CACHE_EXTENTS (fetch) failed");
+
+	printf("\t%-12s%-12s%-12s%-12s\n", "fofs", "blk", "len", "access_mode");
+	for (i = 0; i < rec->ext_count && i < count; i++) {
+		printf("%u\t%-12u%-12u%-12u%-12u\n", i,
+			rec->extents[i].fofs,
+			rec->extents[i].blk,
+			rec->extents[i].len,
+			rec->extents[i].last_access_mode);
+	}
+
+	free(rec);
+	close(fd);
+	exit(0);
+}
+
 #define move_range_desc "moving a range of data blocks from source file to destination file"
 #define move_range_help						\
 "f2fs_io move_range [src_path] [dst_path] [src_start] [dst_start] "	\
@@ -2650,6 +2722,7 @@ const struct cmd_desc cmd_list[] = {
 	CMD(gc),
 	CMD(checkpoint),
 	CMD(precache_extents),
+	CMD(get_read_extents),
 	CMD(move_range),
 	CMD(gc_range),
 	CMD(listxattr),
diff --git a/tools/f2fs_io/f2fs_io.h b/tools/f2fs_io/f2fs_io.h
index 539964f..a84a299 100644
--- a/tools/f2fs_io/f2fs_io.h
+++ b/tools/f2fs_io/f2fs_io.h
@@ -96,6 +96,8 @@ typedef u32	__be32;
 #define F2FS_IOC_START_ATOMIC_REPLACE	_IO(F2FS_IOCTL_MAGIC, 25)
 #define F2FS_IOC_GET_DEV_ALIAS_FILE	_IOR(F2FS_IOCTL_MAGIC, 26, __u32)
 #define F2FS_IOC_IO_PRIO		_IOW(F2FS_IOCTL_MAGIC, 27, __u32)
+#define F2FS_IOC_GET_READ_CACHE_EXTENTS	_IOWR(F2FS_IOCTL_MAGIC, 28,	\
+						struct f2fs_read_cache_extent)
 
 #ifndef FSCRYPT_POLICY_V1
 #define FSCRYPT_POLICY_V1		0
@@ -263,3 +265,21 @@ struct f2fs_comp_option {
 	u8 algorithm;
 	u8 log_cluster_size;
 };
+
+struct f2fs_cache_extent_info {
+	u32 fofs;		/* start file offset in blocks */
+	u32 blk;		/* start block address */
+	u32 len;		/* length in blocks */
+	u32 last_access_mode;	/* last access mode of extent_node */
+};
+
+#define F2FS_EXT_FL_NO_EXTENT	0x1
+
+struct f2fs_read_cache_extent {
+	u32 ext_count;		/* in: array capacity; out: mapped extent count */
+	u32 flags;		/* out: status flags */
+	u32 node_count;		/* out: total extent nodes in tree */
+	u32 reserved;
+	struct f2fs_cache_extent_info largest;		/* out: largest extent */
+	struct f2fs_cache_extent_info extents[];	/* out: extent array */
+};
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
