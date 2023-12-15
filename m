Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB9F8151C0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Dec 2023 22:16:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rEFXs-0008RW-B4;
	Fri, 15 Dec 2023 21:16:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rEFXr-0008RP-9O
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Dec 2023 21:16:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A9VmviNzu9Vwca8703AouDgcma1pNK0L4pW+RXROQG0=; b=iObJWqPe7gwfRAPqAtm5iTcU7d
 kaw8Bt50p4CUCptch3snCA3Gk3hcqvTH0EA7w/rhayk9mAf6WHCkUlPKItSrbPBOYjMLjzsEP834y
 CHxY4ErpS5Ne9efOVaJlChmBPcHczdx8vbGY1CmsRXfEO5QMmeTSfLRWig2WJ1rubOvs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=A9VmviNzu9Vwca8703AouDgcma1pNK0L4pW+RXROQG0=; b=KQg40jjyUDSZBplkqFRonZBw9w
 J5nzY+7Jy79ua+JJDhDL0bVOatI+P7hak6JyUSQkt8ineQ0UCE5e8yUshCa5dTxqStXMwudbl1IXy
 p63+NROnaRbghCwZzjY1pN0M2CTybO3j6wM0n7KlZ7nyJrI/Cr8Be+WNFu8aNwWjKqlI=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rEFXq-0001Qf-T4 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Dec 2023 21:16:31 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 55E741F85D;
 Fri, 15 Dec 2023 21:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1702674978; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A9VmviNzu9Vwca8703AouDgcma1pNK0L4pW+RXROQG0=;
 b=zIumY2whvLC6NLAFrargTu5XWfdZTzqw81XE8601BGRFfVZYiXdlJAuCQ0xJc2nKNDg/T8
 WlbjEA41/HoOHj/leNo2OM6+PP/QdqCO8Zy+iHq+VpxQLQHO+UeUWzhxUun0n7ug6K1uzq
 +P6Aq90cCGVVZc5h1q4TScK2q3CpgtY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1702674978;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A9VmviNzu9Vwca8703AouDgcma1pNK0L4pW+RXROQG0=;
 b=2Z9wPl88QZXzb6XI7wyyPsxoolquOOQIl6Vt7s1RVT82tCb3OS7a/KOH6Ec2a+v2Y/8zGO
 sJRwY7r+Y7d1LdAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1702674977; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A9VmviNzu9Vwca8703AouDgcma1pNK0L4pW+RXROQG0=;
 b=Bv/qH1+vDs6zc4QEKLbXRCVoxgYmBOI64TVCCLmPpDZe5Lmc/4h/NGSoyON5dM9V1LEQvy
 vwWF09ZL8jPxDgwmQOqXUuoyZvPcr3KikbotoB80VFgQ7CUSveH2zp4LZvf0iwMivPkfkl
 V650/4mWndLt9Exy9U/ECsNMDdxZprs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1702674977;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A9VmviNzu9Vwca8703AouDgcma1pNK0L4pW+RXROQG0=;
 b=kgrYjC8Db6UBAm7X4QX3PEmscVheiAK5KCPO1Ak8YXxr8PFaouyFAqrqD3VW1Qwen0xsOI
 WKlf9wcCyHNiikCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 14752137D4;
 Fri, 15 Dec 2023 21:16:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id szpkOSDCfGWFOQAAD6G6ig
 (envelope-from <krisman@suse.de>); Fri, 15 Dec 2023 21:16:16 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: viro@zeniv.linux.org.uk, ebiggers@kernel.org, jaegeuk@kernel.org,
 tytso@mit.edu
Date: Fri, 15 Dec 2023 16:16:01 -0500
Message-ID: <20231215211608.6449-2-krisman@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231215211608.6449-1-krisman@suse.de>
References: <20231215211608.6449-1-krisman@suse.de>
MIME-Version: 1.0
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: ***
X-Spam-Score: 3.70
X-Spamd-Result: default: False [3.70 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 BROKEN_CONTENT_TYPE(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_SEVEN(0.00)[8];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[linux.org.uk:email,suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Case-insensitive wants d_compare/d_hash for every dentry in
 the filesystem, while fscrypt needs d_revalidate only for DCACHE_NOKEY_NAME.
 This means we currently can't use sb->s_d_op to set case-insens [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.131 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rEFXq-0001Qf-T4
Subject: [f2fs-dev] [PATCH v2 1/8] dcache: Add helper to disable
 d_revalidate for a specific dentry
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
Cc: linux-fsdevel@vger.kernel.org, Gabriel Krisman Bertazi <krisman@suse.de>,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Case-insensitive wants d_compare/d_hash for every dentry in the
filesystem, while fscrypt needs d_revalidate only for DCACHE_NOKEY_NAME.
This means we currently can't use sb->s_d_op to set case-insensitive
hooks in fscrypt+case-insensitive filesystems without paying the cost to
call d_revalidate for every dentry in the filesystem.

In preparation to doing exactly that, add a way to disable d_revalidate
later.

Suggested-by: Al Viro <viro@zeniv.linux.org.uk>
Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>
---
 fs/dcache.c            | 10 ++++++++++
 include/linux/dcache.h |  1 +
 2 files changed, 11 insertions(+)

diff --git a/fs/dcache.c b/fs/dcache.c
index c82ae731df9a..1f5464cd3bd1 100644
--- a/fs/dcache.c
+++ b/fs/dcache.c
@@ -1911,6 +1911,16 @@ struct dentry *d_alloc_name(struct dentry *parent, const char *name)
 }
 EXPORT_SYMBOL(d_alloc_name);
 
+void d_set_always_valid(struct dentry *dentry)
+{
+	if (!(dentry->d_flags & DCACHE_OP_REVALIDATE))
+		return;
+
+	spin_lock(&dentry->d_lock);
+	dentry->d_flags &= ~DCACHE_OP_REVALIDATE;
+	spin_unlock(&dentry->d_lock);
+}
+
 void d_set_d_op(struct dentry *dentry, const struct dentry_operations *op)
 {
 	WARN_ON_ONCE(dentry->d_op);
diff --git a/include/linux/dcache.h b/include/linux/dcache.h
index 3da2f0545d5d..d2ce151b2d8e 100644
--- a/include/linux/dcache.h
+++ b/include/linux/dcache.h
@@ -225,6 +225,7 @@ extern struct dentry * d_instantiate_anon(struct dentry *, struct inode *);
 extern void __d_drop(struct dentry *dentry);
 extern void d_drop(struct dentry *dentry);
 extern void d_delete(struct dentry *);
+extern void d_set_always_valid(struct dentry *dentry);
 extern void d_set_d_op(struct dentry *dentry, const struct dentry_operations *op);
 
 /* allocate/de-allocate */
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
