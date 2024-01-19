Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F216832F21
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Jan 2024 19:48:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rQtvE-0000NE-OH;
	Fri, 19 Jan 2024 18:48:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rQtuv-0000Mi-9A
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Jan 2024 18:48:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dAXxsZUzQs43nPmCR7QF70NpWme+IPIt3kqL7m9PrBY=; b=VkP4pbkI0siH2co+3sbUSBGARB
 lkDGdhdhIwM7MIryRPhtcLtNhhbnqeY4QsD53g5ucfqJV96tpQINAn8ffpy1fXNQPo5qrM5YUY+uP
 R57wzj4EJnNeL9L6sJwyPnzpEE7cUm/GMcVDgZc2p4eyVNiOyIqv6+JAAKWPs7KAmzlM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dAXxsZUzQs43nPmCR7QF70NpWme+IPIt3kqL7m9PrBY=; b=C/WkpXlCZw/oSyTUPASfmO5Rmt
 xAIISeAqdYfwsmgmaB2kIIX1NAFnbNdtqNBhes/n21eWGec+OB+RVEPg7dtLM9+vgZ0bW31KNAUxf
 pDiB9Cy1fnC3eiv1N5JGxeB0k2rrdE6DYFtITwblUGTwhNHXDKOKXp3yaurXZ/YKAChE=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rQtut-0001bW-Fb for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Jan 2024 18:48:36 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B76E81F809;
 Fri, 19 Jan 2024 18:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1705690109; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dAXxsZUzQs43nPmCR7QF70NpWme+IPIt3kqL7m9PrBY=;
 b=JYMOM1meZr7Mi6ZSnnbOP228XrfLLJx3ZkYcMwVzTA/PMT3sL0HPcfK1GikWkhCi8DXGcp
 VK8caVmJzYvkkvsguBtZKKdEIlwmENNZwNJdvEwkQ8vbqLxo98R3KFvPAecI+GzdTmZSg0
 rBGGR0heKvVI/6GKZQYEPeqF9pTySNI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1705690109;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dAXxsZUzQs43nPmCR7QF70NpWme+IPIt3kqL7m9PrBY=;
 b=bgQpMhXLHiXed8QoiOc+YQaSuLjG/18LuGi2jYzZdzsK6X2CFRGnnPuIwTTgARlKZvt+nk
 BZjBHH1f8ggFIkAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1705690109; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dAXxsZUzQs43nPmCR7QF70NpWme+IPIt3kqL7m9PrBY=;
 b=JYMOM1meZr7Mi6ZSnnbOP228XrfLLJx3ZkYcMwVzTA/PMT3sL0HPcfK1GikWkhCi8DXGcp
 VK8caVmJzYvkkvsguBtZKKdEIlwmENNZwNJdvEwkQ8vbqLxo98R3KFvPAecI+GzdTmZSg0
 rBGGR0heKvVI/6GKZQYEPeqF9pTySNI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1705690109;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dAXxsZUzQs43nPmCR7QF70NpWme+IPIt3kqL7m9PrBY=;
 b=bgQpMhXLHiXed8QoiOc+YQaSuLjG/18LuGi2jYzZdzsK6X2CFRGnnPuIwTTgARlKZvt+nk
 BZjBHH1f8ggFIkAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1CB09136F5;
 Fri, 19 Jan 2024 18:48:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id aqpxMPzDqmVkDAAAD6G6ig
 (envelope-from <krisman@suse.de>); Fri, 19 Jan 2024 18:48:28 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: viro@zeniv.linux.org.uk, ebiggers@kernel.org, jaegeuk@kernel.org,
 tytso@mit.edu
Date: Fri, 19 Jan 2024 15:47:39 -0300
Message-ID: <20240119184742.31088-8-krisman@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240119184742.31088-1-krisman@suse.de>
References: <20240119184742.31088-1-krisman@suse.de>
MIME-Version: 1.0
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -0.30
X-Spamd-Result: default: False [-0.30 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 REPLY(-4.00)[]; BROKEN_CONTENT_TYPE(1.50)[];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_RATELIMIT(0.00)[to_ip_from(RLzk7q5dcbbphp39zi8hi5jhbt)];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_SEVEN(0.00)[9];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[vger.kernel.org,lists.sourceforge.net,gmail.com,suse.de];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This was already the case for case-insensitive before commit
 bb9cd9106b22 ("fscrypt: Have filesystems handle their d_ops"), but it was
 changed to set at lookup-time to facilitate the integration with [...] 
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
X-Headers-End: 1rQtut-0001bW-Fb
Subject: [f2fs-dev] [PATCH v3 07/10] ext4: Configure dentry operations at
 dentry-creation time
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
 linux-ext4@vger.kernel.org, amir73il@gmail.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This was already the case for case-insensitive before commit
bb9cd9106b22 ("fscrypt: Have filesystems handle their d_ops"), but it
was changed to set at lookup-time to facilitate the integration with
fscrypt.  But it's a problem because dentries that don't get created
through ->lookup() won't have any visibility of the operations.

Since fscrypt now also supports configuring dentry operations at
creation-time, do it for any encrypted and/or casefold volume,
simplifying the implementation across these features.

Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>
---
 fs/ext4/namei.c | 1 -
 fs/ext4/super.c | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index d252935f9c8a..3f0b853a371e 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -1762,7 +1762,6 @@ static struct buffer_head *ext4_lookup_entry(struct inode *dir,
 	struct buffer_head *bh;
 
 	err = ext4_fname_prepare_lookup(dir, dentry, &fname);
-	generic_set_encrypted_ci_d_ops(dentry);
 	if (err == -ENOENT)
 		return NULL;
 	if (err)
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index c5fcf377ab1f..de80a9cc699a 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -5493,6 +5493,7 @@ static int __ext4_fill_super(struct fs_context *fc, struct super_block *sb)
 		goto failed_mount4;
 	}
 
+	generic_set_sb_d_ops(sb);
 	sb->s_root = d_make_root(root);
 	if (!sb->s_root) {
 		ext4_msg(sb, KERN_ERR, "get root dentry failed");
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
