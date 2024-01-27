Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A70F783E7F2
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Jan 2024 01:10:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rTWHg-0000wZ-D5;
	Sat, 27 Jan 2024 00:10:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rTWHd-0000wN-TR
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Jan 2024 00:10:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+ZCrOUp4n/eBPbinavPK6B+r0bHWbQ20H7Kc7iNUiVw=; b=N/6ib37nwFkagtYiWyfAcuvkMA
 0PlWXGrciER3ocSzg5k40wpDAymm2RcnecxhBI+267NQGfx+q9ni1gK7S42wno+xQ9dCzgUQjskvM
 zaE+LNWUh6m+lspeh1tWCNwMiAbDkQiTyFUFqYsD+87ywaCSzLs+Nl7xVGA3+uAvXgz4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+ZCrOUp4n/eBPbinavPK6B+r0bHWbQ20H7Kc7iNUiVw=; b=N06vlhMLAkFp9oOGE08PlBGQKf
 uisPI8T1tJO6L2/ftra4K/Nx8sGy17rJWtbUti087y6EwCE1tpLmAwrMwGb4V7La3iwXCZUAE/ybX
 M8P9KE5BWJp3S4+oyJYUrKHAWuFwZcSI8Fy9nZJ78f7e7N/6aW5Y20/ja4o0nMwKoxrM=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rTWHc-0006vE-Bu for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Jan 2024 00:10:53 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 915CA1FDB8;
 Sat, 27 Jan 2024 00:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706314241; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ZCrOUp4n/eBPbinavPK6B+r0bHWbQ20H7Kc7iNUiVw=;
 b=eT6KPM+FMAU5IeLIpxOYN2I128O8z1jnvI2GRpwIlgqLgo/huantEdyHhXhUUrcvP+2n83
 do8oeGK06JPl322ekv9cvpObqr4CMK98jgopbLuQiYZjCxZMLtnGQqMzV2kpUP6b+qLlBQ
 qdaLKq1ZSw4V6n8kAe6hB6P6Q0DlEYQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706314241;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ZCrOUp4n/eBPbinavPK6B+r0bHWbQ20H7Kc7iNUiVw=;
 b=kQZLtEWJo8myyfCR33d/bkax0GXApatqynGR0pEpyo+07wNlhFy4M/r0V0oPJZUCPnKsrL
 wbg/zdrM8dp9/kDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706314241; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ZCrOUp4n/eBPbinavPK6B+r0bHWbQ20H7Kc7iNUiVw=;
 b=eT6KPM+FMAU5IeLIpxOYN2I128O8z1jnvI2GRpwIlgqLgo/huantEdyHhXhUUrcvP+2n83
 do8oeGK06JPl322ekv9cvpObqr4CMK98jgopbLuQiYZjCxZMLtnGQqMzV2kpUP6b+qLlBQ
 qdaLKq1ZSw4V6n8kAe6hB6P6Q0DlEYQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706314241;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ZCrOUp4n/eBPbinavPK6B+r0bHWbQ20H7Kc7iNUiVw=;
 b=kQZLtEWJo8myyfCR33d/bkax0GXApatqynGR0pEpyo+07wNlhFy4M/r0V0oPJZUCPnKsrL
 wbg/zdrM8dp9/kDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E20E013998;
 Sat, 27 Jan 2024 00:10:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id z4aoJABKtGVtEQAAD6G6ig
 (envelope-from <krisman@suse.de>); Sat, 27 Jan 2024 00:10:40 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: ebiggers@kernel.org, viro@zeniv.linux.org.uk, jaegeuk@kernel.org,
 tytso@mit.edu
Date: Fri, 26 Jan 2024 21:10:06 -0300
Message-ID: <20240127001013.2845-7-krisman@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240127001013.2845-1-krisman@suse.de>
References: <20240127001013.2845-1-krisman@suse.de>
MIME-Version: 1.0
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=eT6KPM+F;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=kQZLtEWJ
X-Spamd-Result: default: False [2.58 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; R_MISSING_CHARSET(2.50)[];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 BROKEN_CONTENT_TYPE(1.50)[];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_SEVEN(0.00)[9]; MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.sourceforge.net,suse.de];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-0.11)[66.00%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 2.58
X-Rspamd-Queue-Id: 915CA1FDB8
X-Spam-Level: **
X-Spam-Flag: NO
X-Spamd-Bar: ++
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Now that we do more than just clear the DCACHE_NOKEY_NAME
 in fscrypt_handle_d_move, skip it entirely for volumes that don't need fscrypt,
 to save the extra cost. Note that fscrypt_handle_d_move is hopefully inlined
 back into __d_move, so the call cost is not significant, and theefore we
 do the check in the callee to avoid polluting the caller code with header
 [...] Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.131 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rTWHc-0006vE-Bu
Subject: [f2fs-dev] [PATCH v4 06/12] fscrypt: Ignore non-fscrypt volumes
 during d_move
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 amir73il@gmail.com, Gabriel Krisman Bertazi <krisman@suse.de>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Now that we do more than just clear the DCACHE_NOKEY_NAME in
fscrypt_handle_d_move, skip it entirely for volumes that don't need
fscrypt, to save the extra cost.

Note that fscrypt_handle_d_move is hopefully inlined back into __d_move,
so the call cost is not significant, and theefore we do the check in the
callee to avoid polluting the caller code with header guards.

Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>
---
 include/linux/fscrypt.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index c1e285053b3e..566362fdc3af 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -232,6 +232,10 @@ static inline bool fscrypt_needs_contents_encryption(const struct inode *inode)
  */
 static inline void fscrypt_handle_d_move(struct dentry *dentry)
 {
+	/* Ignore volumes that don't care about fscrypt. */
+	if (dentry->d_sb->s_cop)
+		return;
+
 	dentry->d_flags &= ~DCACHE_NOKEY_NAME;
 
 	/*
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
