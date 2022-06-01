Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 349E253ADB6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 Jun 2022 22:45:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nwVDA-0001p6-LN; Wed, 01 Jun 2022 20:45:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <krisman@collabora.com>) id 1nwVD8-0001ot-TD
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jun 2022 20:44:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AiEB06xWkv1/cHOyy1V8jJR/7oezRcZIgjdvOZFzO6U=; b=RQnHhbp0S9AospjCFWXxDhbF6S
 nioVLy9yTrEvaYG+pWubtFVRouWtOuTMgvc95GXkmQAvQDOfit71l+2DtwdGd2uLmCBktyWNTlphT
 tX3R0mSv4H3zIr9jHKcn5dNCjXGdJyC3wBF6q3IvTSxZyQx6S50aafQmFeSC3MgaG+/A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AiEB06xWkv1/cHOyy1V8jJR/7oezRcZIgjdvOZFzO6U=; b=m9x5N6vH2diHVXGu69VSfVdkjr
 ipQiOlcSdLJuagKtDUrEF99pnhFXNFQnc3f4X6ytCaLRnFW1xy/i0nmQCirnqN9tSLgGz1h2K14SP
 tRAKjH9BZOF4FU3maARP9bvrC/R55SwvPvsawUz4Uqp0q/s+WXh/j0Np5nSz31co9uwo=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nwVD8-001KTE-HB
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jun 2022 20:44:59 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 36E601F438C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1654116292;
 bh=MlhhI4KNumY+gCoHEanKUqEAs+Rh5WqCT1slFMX1xD4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=atMZNmTS2/Z3FB/qUsDTkwAy3b75U/OSvu1g9Nm5kWX+CCnCF0mvO8wFqTYFJQJU9
 dPSbFJGLpoqw8BN0NCpKT5TOYiUC1Wr/p7csdxOB1r/JZ+ttjb+QjtZ1Mw+XJDyQ4J
 FT0Z73eO8iLzs57BPjCOvg5WgRrXk/5QqZtVhhxmMfL8E6AlW68vo/UK7m7KsXTgdi
 +LbFAncbQHP565b1R7phYlcfr5yfpmlOqgL7lTMIYelxBcdRleePeylucRG+Rt8tOi
 Y11IQzPWUjVVzbZ8QKUD/gOP5F+8D3K9brmubrbRGUWcnqURoQ7xXfO+3+YIX70AmL
 6c9oMKvyEUQ4Q==
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: viro@zeniv.linux.org.uk,
	tytso@mit.edu,
	jaegeuk@kernel.org
Date: Wed,  1 Jun 2022 16:44:33 -0400
Message-Id: <20220601204437.676872-4-krisman@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220601204437.676872-1-krisman@collabora.com>
References: <20220601204437.676872-1-krisman@collabora.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Introduce a dentry revalidation helper to be used by
 case-insensitive
 filesystems to check if it is safe to reuse a negative dentry. A negative
 dentry is safe to be reused on a case-insensitive lookup if it was created
 during a case-insensitive lookup and this is not a lookup that will
 instantiate a dentry. If this is a creation lo [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal
 information
X-Headers-End: 1nwVD8-001KTE-HB
Subject: [f2fs-dev] [PATCH RFC 3/7] libfs: Validate negative dentries in
 case-insensitive directories
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
Cc: kernel@collabora.com, linux-f2fs-devel@lists.sourceforge.net,
 ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Introduce a dentry revalidation helper to be used by case-insensitive
filesystems to check if it is safe to reuse a negative dentry.

A negative dentry is safe to be reused on a case-insensitive lookup if
it was created during a case-insensitive lookup and this is not a lookup
that will instantiate a dentry. If this is a creation lookup, we also
need to make sure the name matches sensitively the name under lookup in
order to assure the name preserving semantics.

Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
---
 fs/libfs.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/fs/libfs.c b/fs/libfs.c
index e64bdedef168..618a85c08aa7 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -1450,9 +1450,33 @@ static int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
 	return 0;
 }
 
+static inline int generic_ci_d_revalidate(struct dentry *dentry,
+					  const struct qstr *name,
+					  unsigned int flags)
+{
+	int is_creation = flags & (LOOKUP_CREATE | LOOKUP_RENAME_TARGET);
+
+	if (d_is_negative(dentry)) {
+		const struct dentry *parent = READ_ONCE(dentry->d_parent);
+		const struct inode *dir = READ_ONCE(parent->d_inode);
+
+		if (dir && needs_casefold(dir)) {
+			if (!d_is_casefold_lookup(dentry))
+				return 0;
+
+			if (is_creation &&
+			    (dentry->d_name.len != name->len ||
+			     memcmp(dentry->d_name.name, name->name, name->len)))
+				return 0;
+		}
+	}
+	return 1;
+}
+
 static const struct dentry_operations generic_ci_dentry_ops = {
 	.d_hash = generic_ci_d_hash,
 	.d_compare = generic_ci_d_compare,
+	.d_revalidate_name = generic_ci_d_revalidate,
 };
 #endif
 
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
