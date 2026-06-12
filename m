Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CPFIJf8ALGqLJQQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jun 2026 14:52:15 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B16DA679817
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jun 2026 14:52:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=B7iA7Jsl;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=b9KN1ZYl;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="c e6VSFD";
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=I+Uhyh2N;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HcGuoSer9ZUCdSRGWpkWTlCdna9Qj+Dx73MTUsQKjZg=; b=B7iA7JslvPHTJeDq4epMoXSi6B
	ka2Sbi89AfeAFFkM8FhqH7rUoqr6RHFgl+gAXMx5ZZYPtXF0h9qXZNUonypvj8XaRhPJhRGPWIRGr
	gGN0LlQSWlqdUHBaDvxsnzzBE/uzws8lRHHJRC9h/jjB8uoQPCqfLUvuJ+mC7wQQWL0c=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wY1Mi-0004KE-3L;
	Fri, 12 Jun 2026 12:52:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1wY1MR-0004Jn-Gb
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jun 2026 12:51:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RZb97fPIEBQ2kgV9tOcdvOhMShqwfgTknavbgpERkeM=; b=b9KN1ZYlDFNN230xi1xuPh2wNs
 5P5QcVgmBBwFxZjI8IS35Ah/7M2SLYGc6pgBRbzanTJ0nZcXgabuhM3tV88bIsGhz9Rz4/kCBi5Xu
 xib7TOGfrEaFQjCXCTnTr0bJ2inTe5cWfnpaUDkIo9/mb4dxwIqYClarfJpHaPVn3dgA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=RZb97fPIEBQ2kgV9tOcdvOhMShqwfgTknavbgpERkeM=; b=c
 e6VSFDAXtzCQ9yOMw+AA/xAZQ7tEi9C5urratWbA5C4+0xmN5q6n/+sX5uboUf3R8J/wwv/Pt1Qws
 aw23B46/ArIIe3Oqe+FPs0HPMEZJtgUYF/+cktIoD7+cLSIf4m69pvN1d3N8fK8PICh9BwqxPEIy5
 e8VBOkUOvAZy4AsI=;
Received: from mail-pf1-f175.google.com ([209.85.210.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wY1MN-0004rJ-1N for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jun 2026 12:51:44 +0000
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-842307473b5so751264b3a.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 12 Jun 2026 05:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781268693; x=1781873493; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RZb97fPIEBQ2kgV9tOcdvOhMShqwfgTknavbgpERkeM=;
 b=I+Uhyh2N1gmgjI+g7w9BcgzFvphwR2u+5rqnH1QYcC3KYwqG2v+ICutDddezYWp+T4
 fUjZ/pipFRn4BxXIjgj5wV5qFXiAGAHzk9eeNdp7rbl1Rgr+0pcmjzt8R3RzgZBXBJ50
 9MvK+ursZgs+DWKxoVsFGadau9jiMoChJCJhjFlpKyDrY8QRL5KL2VgVQmeHZdhXPjdX
 orN61j6q5RbxJDvJWLEDsW6M4rtfb8AiUoWxmDQlWGaJ8+10YVMMXEj1xAUL/FVnpETN
 rWa6doGXX3bnoMmhAkOGpknhGCZ0GjC/xFYcnt+ADJ/8nPMmCwwocQL8HjPRM/Fz/q++
 GJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781268693; x=1781873493;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RZb97fPIEBQ2kgV9tOcdvOhMShqwfgTknavbgpERkeM=;
 b=sSwZ092PSxrK+/PH4BD+AsJ8bvnUn8D7YiUvyRYGILjOhSTi70Tcf/BGpv3LNHFmSA
 X42pncTlxKmfn1JMoK9nOdYiL9tsitjxXfkG9MGyvGHX9clOhnQpEobXJryNSoqPVo4I
 rqsCp7wtpFDWdrP0hcceIBBuMBUnZtDdG5VKbUvWur2af8B685CluC2l2Q7j19EAf+4M
 xxpHvxvibVi4rvy/UDQ0szRWNji6acfGirmz4OqjCmtY2Le71+uzHiihhgTNEiBggrNj
 8s9x4L0UC54LlC4JapDrkJZAyw/PmKiT9+8mizCVHGJIKd6AGzvFRqaA4duDnPC6YOK+
 NM+w==
X-Gm-Message-State: AOJu0YywDoj34gFsdFu6vOXtxfjmKSsVs21Tm/nx6DnIK7jsMN5hIQVz
 e+HOk+1Mm1tV7CG2JLmJ0B/jmo8ObvYFSRMHl21o6Wfy4xygXEMkV0G6
X-Gm-Gg: Acq92OEopyhXpsfH+na3RqNQwAiPJj7tCwTFYmbPgHPteEBLTvsVTWF8MeNkl8LW4Dx
 3w8cSB4ZFlHCOJyQ8D2w223eA50GGxLQVm6N3rn5GUDV1mr3TXi+UWujCpIs+isrvkKFdOj1bMR
 MqhkCSDhVQaZy51FsDYapRckF5eaiDGEAYxtNOUIn6oP0mxoB0lmVW97kQziJb4r1DrgbZGrIYU
 vlKS7kgLF9hU34nv5Qpil0J9xrgV9O4DyUQy7GlCmMBheHJWfFnL0QMCo0b5FdcY93iFOFC69eO
 KDzdtEJwkAGG7NEQf///oO6d27MbgyWRL6Cc87v1leSlXIhw7KX7gHeQ/gS1HHzhNjup5YQ8Cbb
 woCfH1bbeaEj/QOxCfqtdAf0ty//EFQIqBH+YlhhwNO+BhxVXqmTqz1pTzo+FncCZHcV+wzFqUt
 JIMPBEKF98vHTOkA+qW5uO6wTeZPa9vXPw+HbmoZv4AiXW6Ug2SbDhkGj6fwaKXLmaeboBSA==
X-Received: by 2002:a05:6a00:1d99:b0:83f:a040:a3d3 with SMTP id
 d2e1a72fcca58-8434cec7839mr2699104b3a.43.1781268692686; 
 Fri, 12 Jun 2026 05:51:32 -0700 (PDT)
Received: from xiaomi-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8434acffd04sm2259005b3a.26.2026.06.12.05.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 05:51:32 -0700 (PDT)
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Fri, 12 Jun 2026 20:51:01 +0800
Message-ID: <20260612125100.2096510-2-yangyongpeng.storage@gmail.com>
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
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.175 listed in wl.mailspike.net]
X-Headers-End: 1wY1MN-0004rJ-1N
Subject: [f2fs-dev] [PATCH RESEND] f2fs_io: add get_read_extents command for
 read extent cache ioctl
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[yangyongpengstorage@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	DKIM_MIXED(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yangyongpengstorage@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B16DA679817

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
