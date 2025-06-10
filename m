Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7E4AD3D31
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Jun 2025 17:31:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FoD+C898EWhkeVCa2D6tHmb4nRWkF5uROCrgWcHUuGc=; b=GKEDw9oHfHAqujiEC6GBDf2bZ9
	Yk2VNwQVr4/rzIyoPWGTdeLxZfkD39I1GPTk8/PrBuqnO5ddnGy5OYAvY5dAQynQp7pYlSIGySNPQ
	2lC/0StIUBFMf1iav9ORiNbiDaL6Ceaixh0SwpicmT04+OAk1++f6rSDtmQgWS3s6LDE=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uP0x9-0000Ob-4h;
	Tue, 10 Jun 2025 15:31:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uP0x7-0000OR-Qs
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:31:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m0IZxA6PKAlUrpKmhY5TVnbhi1aMK34z/DqnKn1rLtE=; b=TTMRRBpqKPWxvKQ28EglEUZH06
 xqLlqoVPwE6CkBpvZj1R+ZxDVk+Kty14jCzXHEzTPTHGsV4B7LKhgSZrVFILZuDo8R1+1eOrab3jd
 00K0EqVka1GM3xazvPtn46HY8+pCBRM1A0EFsyXP+4hlBjCneaGdFkwjenk0kGN/j4kQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m0IZxA6PKAlUrpKmhY5TVnbhi1aMK34z/DqnKn1rLtE=; b=PbSc5j6Jsspt+giTRjw1c09R9g
 dV55Yx1QVUk6bZoXf/zWQ9TNtNkJred47cLVEXgnHn5X/YjzHK491TFe+l1CdefiVUSmfCCB0jtzl
 LH31cs8TscUwAS4WwOKFmYkgpMaXbTan+v6opVinubQQl85eJ7L/eh6IR9euVEudmRdQ=;
Received: from mail-qv1-f46.google.com ([209.85.219.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uP0x6-0005Jh-QC for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:31:53 +0000
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-6fad3400ea3so50791046d6.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Jun 2025 08:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749569507; x=1750174307; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m0IZxA6PKAlUrpKmhY5TVnbhi1aMK34z/DqnKn1rLtE=;
 b=BNhNUR1MpH+tyNE050tN6pG18iFZYVqMeTlGzU2cDtbtg2GLdOVepxB/btfuswC30a
 VJ/tHdKobgsE/4OIcZSgH7DWoum9LsGlbinCo750jYKC9AnRXuPaDg5+Bl1YAodF8uot
 7hktKdsQ8EGnOOdQXBXAxe6A8twEU/atnTV3O93NTY4TsiWyCoDwnn9ldAtmvdxz2+ro
 nS/9DXSuUpzwNf3vmviseBktjOdZwmFK39H6Ivg3rCkFYRXlK/7Fi9K2iDN73ayvOZsl
 dRomkpG5zujC3sLewDCKUGV3VE+Xf8OaAshOPJkX81cmEuy5UPlMQuafp4huJXbivK4N
 p6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749569507; x=1750174307;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m0IZxA6PKAlUrpKmhY5TVnbhi1aMK34z/DqnKn1rLtE=;
 b=S3rvhLNkQ3HFe3qB8yxbcQWQojPHZVBx0hlq6AR1OVILI7lg5aJVdHIyE/luVqh/fs
 vRmNEugCNDl6shgz1JclDBxmlzCaYyW3cBUBKxzMUfvggeHGudqbg6CfG0GfrXzbokPP
 fx7FY4baXZpv9tKiMysNs2kg1wxNbjxk4WShC+ii5PgAq2348EyptMFUo85aA240XBuJ
 dR89wtP2KQX8fs+En5kU/cA45xxX4/lGL8QZvenOBdDrpJHtBWNbAGseynNNiUrsky6o
 QnaNxhk+HJZTk8O1hsDybVOxboAuUFpTzQpt1P/Oe+PSOOXBIEQvFEoj5aophGg0rzL3
 c8zA==
X-Gm-Message-State: AOJu0YyUcPOzo/n4gHNYDMLogZWes3KJSNOa0QqXoauVr4HNFzjDuYp+
 lkmmEVBtHfyF2YnXto1gYdxLI6IvJkI8eWknHOpVpKSMEN1JWbaghFm8k3P4Rw==
X-Gm-Gg: ASbGncuP/V1AB4HyPrXyWtzcZfE9ForFj4mqxFl9IZPeu6EMASCHLG9ZPrFmObY/jPE
 rDRFgbCT8xObrV061I+Wd0P4mIapmrHc5AmVsPDPfArmzWNXlqBCRcgNGy1dq9s1r9ZZn4JvKae
 /HfuDQsXysHFiNQUOk35O2QW8h/Ztf0P6VzMDPFPKsqYelZQP5CzuzSX1FiZQGxNYZXy2q5r9Lm
 zXh6pl4XMok1Bd00uwuLJDnuMbywbAFzVR8ESDHSw77Bza856VWibFn+H9kr17dUODCqsBemqxd
 7qAvMZ65q9Ki5on5++cw8EMpMu5WKUojQfm1c4C3t1ZZ4OmttYZ7pS5sHAdYVTN7RsGM2jlIE7k
 B7WA=
X-Google-Smtp-Source: AGHT+IEryjaUjuPdgJ45MZHngg7uZLn/GZc+PhMmdehdryZqre9Q2cmPInjrgdiqmO4A/qWIsyPAww==
X-Received: by 2002:a05:6a20:3d86:b0:21c:faa4:9abb with SMTP id
 adf61e73a8af0-21f78c49b90mr4508943637.20.1749559107963; 
 Tue, 10 Jun 2025 05:38:27 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0847aesm7539815b3a.105.2025.06.10.05.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:38:27 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 10 Jun 2025 20:37:23 +0800
Message-ID: <20250610123743.667183-14-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610123743.667183-1-shengyong1@xiaomi.com>
References: <20250610123743.667183-1-shengyong1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Sheng Yong This patch adds a new member `filename' in
 inject_dentry to inject dentry filename. The dentry is specified by nid
 option.
 Note that '.' and '..' dentries are special, because they are not in the
 parent directory of nid. So this patch also adds a new option `--dots' to
 inject these two dentries. 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.46 listed in wl.mailspike.net]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
X-Headers-End: 1uP0x6-0005Jh-QC
Subject: [f2fs-dev] [RFC PATCH v2 13/32] inject.f2fs: add member `filename'
 in inject_dentry
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
Cc: shengyong1@xiaomi.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Sheng Yong <shengyong1@xiaomi.com>

This patch adds a new member `filename' in inject_dentry to inject
dentry filename. The dentry is specified by nid option.

Note that '.' and '..' dentries are special, because they are not in the
parent directory of nid. So this patch also adds a new option `--dots'
to inject these two dentries.

Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
---
 fsck/inject.c     | 94 ++++++++++++++++++++++++++++++++++++++++-------
 fsck/inject.h     |  1 +
 man/inject.f2fs.8 | 12 +++++-
 3 files changed, 92 insertions(+), 15 deletions(-)

diff --git a/fsck/inject.c b/fsck/inject.c
index 8c2f8c5dc332..5eb913fefad7 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -105,7 +105,7 @@ void inject_usage(void)
 	MSG(0, "  --sit <0|1|2> --mb <name> --blk <blk> [--idx <index>] --val <value> inject sit entry\n");
 	MSG(0, "  --ssa --mb <name> --blk <blk> [--idx <index>] --val <value> inject summary entry\n");
 	MSG(0, "  --node --mb <name> --nid <nid> [--idx <index>] --val <value> inject node\n");
-	MSG(0, "  --dent --mb <name> --nid <ino> [--idx <index>] --val <value> inject ino's dentry\n");
+	MSG(0, "  --dent --mb <name> --nid <ino> [--dots <1|2>] --val/str <value/string> inject ino's dentry\n");
 	MSG(0, "  --dry-run do not really inject\n");
 
 	exit(1);
@@ -212,12 +212,16 @@ static void inject_node_usage(void)
 
 static void inject_dent_usage(void)
 {
-	MSG(0, "inject.f2fs --dent --mb <name> --nid <nid> [--idx <index>] --val <value> inject dentry\n");
+	MSG(0, "inject.f2fs --dent --mb <name> --nid <nid> [--dots <1|2>] --val/str <value/string> inject dentry\n");
+	MSG(0, "[dots]:\n");
+	MSG(0, "  1: inject \".\" in directory which is specified by nid\n");
+	MSG(0, "  2: inject \"..\" in directory which is specified by nid\n");
 	MSG(0, "[mb]:\n");
 	MSG(0, "  d_bitmap: inject dentry block d_bitmap of nid\n");
 	MSG(0, "  d_hash: inject dentry hash\n");
 	MSG(0, "  d_ino: inject dentry ino\n");
 	MSG(0, "  d_ftype: inject dentry ftype\n");
+	MSG(0, "  filename: inject dentry filename, its hash and len are updated implicitly\n");
 }
 
 int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
@@ -241,6 +245,7 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 		{"ssa", no_argument, 0, 12},
 		{"node", no_argument, 0, 13},
 		{"dent", no_argument, 0, 14},
+		{"dots", required_argument, 0, 15},
 		{0, 0, 0, 0}
 	};
 
@@ -339,6 +344,14 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 			opt->dent = true;
 			MSG(0, "Info: inject dentry\n");
 			break;
+		case 15:
+			opt->dots = atoi(optarg);
+			if (opt->dots != TYPE_DOT &&
+			    opt->dots != TYPE_DOTDOT)
+				return -ERANGE;
+			MSG(0, "Info: inject %s dentry\n",
+			    opt->dots == TYPE_DOT ? "dot" : "dotdot");
+			break;
 		case 'd':
 			if (optarg[0] == '-' || !is_digits(optarg))
 				return EWRONG_OPT;
@@ -371,6 +384,9 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 			} else if (opt->dent) {
 				inject_dent_usage();
 				exit(0);
+			} else {
+				MSG(0, "\tError: Wrong option -%c (%d) %s\n",
+				    o, o, optarg);
 			}
 			return EUNKNOWN_OPT;
 		}
@@ -1146,12 +1162,12 @@ static int find_dir_entry(struct f2fs_dentry_ptr *d, nid_t ino)
 		}
 
 		de = &d->dentry[slot];
-		if (le32_to_cpu(de->ino) == ino && de->hash_code != 0)
-			return slot;
 		if (de->name_len == 0) {
 			slot++;
 			continue;
 		}
+		if (le32_to_cpu(de->ino) == ino)
+			return slot;
 		slot += GET_DENTRY_SLOTS(le16_to_cpu(de->name_len));
 	}
 
@@ -1164,14 +1180,15 @@ static int inject_dentry(struct f2fs_sb_info *sbi, struct inject_option *opt)
 	struct f2fs_node *node_blk = NULL;
 	struct f2fs_inode *inode;
 	struct f2fs_dentry_ptr d;
-	void *inline_dentry;
+	void *buf = NULL, *inline_dentry;
 	struct f2fs_dentry_block *dent_blk = NULL;
 	block_t addr = 0;
-	void *buf = NULL;
 	struct f2fs_dir_entry *dent = NULL;
 	struct dnode_of_data dn;
 	nid_t pino;
-	int slot = -ENOENT, ret;
+	int slot = -ENOENT, namelen, namecap, ret;
+	unsigned int dentry_hash;
+	char *name;
 
 	node_blk = malloc(F2FS_BLKSIZE);
 	ASSERT(node_blk != NULL);
@@ -1180,12 +1197,25 @@ static int inject_dentry(struct f2fs_sb_info *sbi, struct inject_option *opt)
 	get_node_info(sbi, opt->nid, &ni);
 	ret = dev_read_block(node_blk, ni.blk_addr);
 	ASSERT(ret >= 0);
-	pino = le32_to_cpu(node_blk->i.i_pino);
 
-	/* get parent inode */
-	get_node_info(sbi, pino, &ni);
-	ret = dev_read_block(node_blk, ni.blk_addr);
-	ASSERT(ret >= 0);
+	if (opt->dots) {
+		if (!LINUX_S_ISDIR(le16_to_cpu(node_blk->i.i_mode))) {
+			ERR_MSG("ino %u is not a directory, cannot inject "
+				"its %s\n", opt->nid,
+				opt->dots == TYPE_DOT ? "." : "..");
+			ret = -EINVAL;
+			goto out;
+		}
+		/* pino is itself */
+		pino = opt->nid;
+	} else {
+		pino = le32_to_cpu(node_blk->i.i_pino);
+
+		/* get parent inode */
+		get_node_info(sbi, pino, &ni);
+		ret = dev_read_block(node_blk, ni.blk_addr);
+		ASSERT(ret >= 0);
+	}
 	inode = &node_blk->i;
 
 	/* find child dentry */
@@ -1195,7 +1225,10 @@ static int inject_dentry(struct f2fs_sb_info *sbi, struct inject_option *opt)
 		addr = ni.blk_addr;
 		buf = node_blk;
 
-		slot = find_dir_entry(&d, opt->nid);
+		if (opt->dots == TYPE_DOTDOT)
+			slot = find_dir_entry(&d, le32_to_cpu(node_blk->i.i_pino));
+		else
+			slot = find_dir_entry(&d, opt->nid);
 		if (slot >= 0)
 			dent = &d.dentry[slot];
 	} else {
@@ -1231,7 +1264,10 @@ static int inject_dentry(struct f2fs_sb_info *sbi, struct inject_option *opt)
 			ASSERT(ret >= 0);
 
 			make_dentry_ptr(&d, node_blk, dent_blk, 1);
-			slot = find_dir_entry(&d, opt->nid);
+			if (opt->dots == TYPE_DOTDOT)
+				slot = find_dir_entry(&d, le32_to_cpu(node_blk->i.i_pino));
+			else
+				slot = find_dir_entry(&d, opt->nid);
 			if (slot >= 0) {
 				dent = &d.dentry[slot];
 				buf = dent_blk;
@@ -1265,6 +1301,36 @@ static int inject_dentry(struct f2fs_sb_info *sbi, struct inject_option *opt)
 		    "%d -> %d\n", opt->nid, dent->file_type,
 		    (u8)opt->val);
 		dent->file_type = (u8)opt->val;
+	} else if (!strcmp(opt->mb, "filename")) {
+		if (!opt->str) {
+			ERR_MSG("option str is needed\n");
+			ret = -EINVAL;
+			goto out;
+		}
+		namecap = ALIGN_UP(le16_to_cpu(dent->name_len), F2FS_SLOT_LEN);
+		namelen = strlen(opt->str);
+		if (namelen > namecap || namelen > F2FS_NAME_LEN) {
+			ERR_MSG("option str too long\n");
+			ret = -EINVAL;
+			goto out;
+		}
+		name = (char *)d.filename[slot];
+		MSG(0, "Info: inject dentry filename of nid %u: "
+		    "%.*s -> %s\n", opt->nid, le16_to_cpu(dent->name_len),
+		    name, opt->str);
+		memcpy(name, opt->str, namelen);
+		MSG(0, "Info: inject dentry namelen of nid %u: "
+		    "%d -> %d\n", opt->nid, le16_to_cpu(dent->name_len),
+		    namelen);
+		dent->name_len = cpu_to_le16(namelen);
+		dentry_hash = f2fs_dentry_hash(get_encoding(sbi),
+						IS_CASEFOLDED(inode),
+						(unsigned char *)name,
+						namelen);
+		MSG(0, "Info: inject dentry d_hash of nid %u: "
+		    "0x%x -> 0x%x\n", opt->nid, le32_to_cpu(dent->hash_code),
+		    dentry_hash);
+		dent->hash_code = cpu_to_le32(dentry_hash);
 	} else {
 		ERR_MSG("unknown or unsupported member \"%s\"\n", opt->mb);
 		ret = -EINVAL;
diff --git a/fsck/inject.h b/fsck/inject.h
index 43c21b56a7eb..706a211bc645 100644
--- a/fsck/inject.h
+++ b/fsck/inject.h
@@ -30,6 +30,7 @@ struct inject_option {
 	int cp;			/* which cp */
 	int nat;		/* which nat pack */
 	int sit;		/* which sit pack */
+	int dots;		/* . or .. dentry */
 	bool ssa;
 	bool node;
 	bool dent;
diff --git a/man/inject.f2fs.8 b/man/inject.f2fs.8
index 72d1c90f7ce4..27b66f59b77d 100644
--- a/man/inject.f2fs.8
+++ b/man/inject.f2fs.8
@@ -214,7 +214,14 @@ inode i_nid array specified by \fIidx\fP.
 .RE
 .TP
 .BI \-\-dent
-Inject dentry block or dir entry specified \fInid\fP.
+Inject dentry block or dir entry specified by \fInid\fP.
+.RS 1.2i
+.TP
+.BI \-\-dots " 1 or 2"
+The option means the "." or ".." directory entry of \fInid\fP is going to be injected.
+.RE
+.TP
+.BI ""
 The available \fImb\fP of \fIdent\fP are:
 .RS 1.2i
 .TP
@@ -229,6 +236,9 @@ dentry ino.
 .TP
 .BI d_ftype
 dentry ftype.
+.TP
+.BI filename
+dentry filename, and corresponding d_hash and namelen are updated implicitly.
 .RE
 .TP
 .BI \-\-dry\-run
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
