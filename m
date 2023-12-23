Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 501A181D231
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 23 Dec 2023 05:24:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rGtYR-0005Z9-Bx;
	Sat, 23 Dec 2023 04:24:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rGtYP-0005Yr-M2
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 23 Dec 2023 04:24:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5JaqA2wt90SmZ4y/OQc30pqU+gGjb2WEHa8FTpQVI0I=; b=b6/2PItapSOct+qWKjGKgWPEcZ
 0nHMdEUQkngnXc7FF3Lf/Wdkjf3qgmcc2CaS0EPbypTWZwlORnGQTOKBuYbmJeN+9IlfH5dDgb268
 AR1/NbNN4oVFpwTL6QYd6iV+UY182PhQufVMG7D2omUFIRzBAY1gg/6V8wmaFGZwJP7w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5JaqA2wt90SmZ4y/OQc30pqU+gGjb2WEHa8FTpQVI0I=; b=FO3/91Ih2NktPqBRlUe8GTwP/w
 b51+X0yuLWPG+jWX3ZficMuJE3V3MAs3s/xLw030nFaTdfHmZK0U+QNJ0AtS0kZZniN7oguyBEyht
 6pW0lz5U47fDoVmmnZcUhoO1eYkZ32h4Pw0R8/c/g9R+e86BlClpzUw3GZP4XMr8SyxY=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rGtYL-000898-FF for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 23 Dec 2023 04:24:01 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 277461FD11;
 Sat, 23 Dec 2023 04:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1703305423; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5JaqA2wt90SmZ4y/OQc30pqU+gGjb2WEHa8FTpQVI0I=;
 b=x/6Gk3SKhI/F7FND4GXtGO4BLdcrq8kHR6dInEcdxdxw/eTQvi27dBWXv17Fo9pN5kM5fW
 bO2Vix/NhSEYELHXrRrQyOuv4V/CLy6DFw7TNKFLr59xpeDnvoehYZhbQMPEht2jNqesFe
 7W+lJg9nEfxHoPDQn65StLBZOwd9nw8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1703305423;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5JaqA2wt90SmZ4y/OQc30pqU+gGjb2WEHa8FTpQVI0I=;
 b=SqMAW7XbThI4yZhOhWKoJZZrxEx0/8P4xMcRIb8KAFIruvKhVpm6BLKTAKARLbK7ECLaC0
 OXt5ET/renWgTJBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1703305423; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5JaqA2wt90SmZ4y/OQc30pqU+gGjb2WEHa8FTpQVI0I=;
 b=x/6Gk3SKhI/F7FND4GXtGO4BLdcrq8kHR6dInEcdxdxw/eTQvi27dBWXv17Fo9pN5kM5fW
 bO2Vix/NhSEYELHXrRrQyOuv4V/CLy6DFw7TNKFLr59xpeDnvoehYZhbQMPEht2jNqesFe
 7W+lJg9nEfxHoPDQn65StLBZOwd9nw8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1703305423;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5JaqA2wt90SmZ4y/OQc30pqU+gGjb2WEHa8FTpQVI0I=;
 b=SqMAW7XbThI4yZhOhWKoJZZrxEx0/8P4xMcRIb8KAFIruvKhVpm6BLKTAKARLbK7ECLaC0
 OXt5ET/renWgTJBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D35F2137E8;
 Sat, 23 Dec 2023 04:23:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id amS1Lc5ghmU9QAAAD6G6ig
 (envelope-from <krisman@suse.de>); Sat, 23 Dec 2023 04:23:42 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Eric Biggers <ebiggers@kernel.org>, Amir Goldstein <amir73il@gmail.com>
In-Reply-To: <20231219231222.GI38652@quark.localdomain> (Eric Biggers's
 message of "Tue, 19 Dec 2023 16:12:22 -0700")
Organization: SUSE
References: <20231215211608.6449-1-krisman@suse.de>
 <20231219231222.GI38652@quark.localdomain>
Date: Fri, 22 Dec 2023 23:23:41 -0500
Message-ID: <87a5q1eecy.fsf_-_@mailhost.krisman.be>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spam-Level: ****
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.31 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 HAS_ORG_HEADER(0.00)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_SEVEN(0.00)[8];
 FREEMAIL_TO(0.00)[kernel.org,gmail.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-3.00)[100.00%];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="x/6Gk3SK";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=SqMAW7Xb
X-Spam-Score: -3.31
X-Rspamd-Queue-Id: 277461FD11
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Eric Biggers <ebiggers@kernel.org> writes: > On Fri, Dec 15, 
 2023 at 04:16:00PM -0500, Gabriel Krisman Bertazi wrote: >> [Apologies for
 the quick spin of a v2. The only difference are a couple >> fixes to the
 build when CONFIG_UNICODE=n caught [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rGtYL-000898-FF
Subject: [f2fs-dev] [PATCH] ovl: Reject mounting case-insensitive filesystems
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
Cc: tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Eric Biggers <ebiggers@kernel.org> writes:

> On Fri, Dec 15, 2023 at 04:16:00PM -0500, Gabriel Krisman Bertazi wrote:
>> [Apologies for the quick spin of a v2.  The only difference are a couple
>> fixes to the build when CONFIG_UNICODE=n caught by LKP and detailed in
>> each patch changelog.]
>> 
>> When case-insensitive and fscrypt were adapted to work together, we moved the
>> code that sets the dentry operations for case-insensitive dentries(d_hash and
>> d_compare) to happen from a helper inside ->lookup.  This is because fscrypt
>> wants to set d_revalidate only on some dentries, so it does it only for them in
>> d_revalidate.
>> 
>> But, case-insensitive hooks are actually set on all dentries in the filesystem,
>> so the natural place to do it is through s_d_op and let d_alloc handle it [1].
>> In addition, doing it inside the ->lookup is a problem for case-insensitive
>> dentries that are not created through ->lookup, like those coming
>> open-by-fhandle[2], which will not see the required d_ops.
>> 
>> This patchset therefore reverts to using sb->s_d_op to set the dentry operations
>> for case-insensitive filesystems.  In order to set case-insensitive hooks early
>> and not require every dentry to have d_revalidate in case-insensitive
>> filesystems, it introduces a patch suggested by Al Viro to disable d_revalidate
>> on some dentries on the fly.
>> 
>> It survives fstests encrypt and quick groups without regressions.  Based on
>> v6.7-rc1.
>> 
>> [1] https://lore.kernel.org/linux-fsdevel/20231123195327.GP38156@ZenIV/
>> [2] https://lore.kernel.org/linux-fsdevel/20231123171255.GN38156@ZenIV/
>> 
>> Gabriel Krisman Bertazi (8):
>>   dcache: Add helper to disable d_revalidate for a specific dentry
>>   fscrypt: Drop d_revalidate if key is available
>>   libfs: Merge encrypted_ci_dentry_ops and ci_dentry_ops
>>   libfs: Expose generic_ci_dentry_ops outside of libfs
>>   ext4: Set the case-insensitive dentry operations through ->s_d_op
>>   f2fs: Set the case-insensitive dentry operations through ->s_d_op
>>   libfs: Don't support setting casefold operations during lookup
>>   fscrypt: Move d_revalidate configuration back into fscrypt
>
> Thanks Gabriel, this series looks good.  Sorry that we missed this when adding
> the support for encrypt+casefold.
>
> It's slightly awkward that some lines of code added by patches 5-6 are removed
> in patch 8.  These changes look very hard to split up, though, so you've
> probably done about the best that can be done.
>
> One question/request: besides performance, the other reason we're so careful
> about minimizing when ->d_revalidate is set for fscrypt is so that overlayfs
> works on encrypted directories.  This is because overlayfs is not compatible
> with ->d_revalidate.  I think your solution still works for that, since
> DCACHE_OP_REVALIDATE will be cleared after the first call to
> fscrypt_d_revalidate(), and when checking for usupported dentries overlayfs does
> indeed check for DCACHE_OP_REVALIDATE instead of ->d_revalidate directly.
> However, that does rely on that very first call to ->d_revalidate actually
> happening before the check is done.  It would be nice to verify that
> overlayfs+fscrypt indeed continues to work, and explicitly mention this
> somewhere (I don't see any mention of overlayfs+fscrypt in the series).

Hi Eric,

From my testing, overlayfs+fscrypt should work fine.  I tried mounting
it on top of encrypted directories, with and without key, and will add
this information to the commit message.  If we adopt the suggestion from
Al in the other subthread, even better, we won't need the first
d_revalidate to happen before the check, so I'll adopt that.

While looking into overlayfs, I found another reason we would need this
patchset.  A side effect of not configuring ->d_op through s_d_op is
that the root dentry won't have d_op set.  While this is fine for
casefold, because we forbid the root directory from being
case-insensitive, we can trick overlayfs into mounting a
filesystem it can't handle.

Even with this merged, and as Christian said in another thread regarding
ecryptfs, we should handle this explicitly.  Something like below.

Amir, would you consider this for -rc8?

-- >8 --
Subject: [PATCH] ovl: Reject mounting case-insensitive filesystems

overlayfs relies on the filesystem setting DCACHE_OP_HASH or
DCACHE_OP_COMPARE to reject mounting over case-insensitive directories.

Since commit bb9cd9106b22 ("fscrypt: Have filesystems handle their
d_ops"), we set ->d_op through a hook in ->d_lookup, which
means the root dentry won't have them, causing the mount to accidentally
succeed.

In v6.7-rc7, the following sequence will succeed to mount, but any
dentry other than the root dentry will be a "weird" dentry to ovl and
fail with EREMOTE.

  mkfs.ext4 -O casefold lower.img
  mount -O loop lower.img lower
  mount -t overlay -o lowerdir=lower,upperdir=upper,workdir=work ovl /mnt

Mounting on a subdirectory fails, as expected, because DCACHE_OP_HASH
and DCACHE_OP_COMPARE are properly set by ->lookup.

Fix by explicitly rejecting superblocks that allow case-insensitive
dentries.

Fixes: bb9cd9106b22 ("fscrypt: Have filesystems handle their d_ops")
Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>
---
 fs/overlayfs/params.c | 2 ++
 include/linux/fs.h    | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/fs/overlayfs/params.c b/fs/overlayfs/params.c
index 3fe2dde1598f..99495f079644 100644
--- a/fs/overlayfs/params.c
+++ b/fs/overlayfs/params.c
@@ -286,6 +286,8 @@ static int ovl_mount_dir_check(struct fs_context *fc, const struct path *path,
 	if (!d_is_dir(path->dentry))
 		return invalfc(fc, "%s is not a directory", name);
 
+	if (sb_has_encoding(path->mnt->mnt_sb))
+		return invalfc(fc, "caseless filesystem on %s not supported", name);
 
 	/*
 	 * Check whether upper path is read-only here to report failures
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 98b7a7a8c42e..e6667ece5e64 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3203,6 +3203,15 @@ extern int generic_check_addressable(unsigned, u64);
 
 extern void generic_set_encrypted_ci_d_ops(struct dentry *dentry);
 
+static inline bool sb_has_encoding(const struct super_block *sb)
+{
+#if IS_ENABLED(CONFIG_UNICODE)
+	return !!sb->s_encoding;
+#else
+	return false;
+#endif
+}
+
 int may_setattr(struct mnt_idmap *idmap, struct inode *inode,
 		unsigned int ia_valid);
 int setattr_prepare(struct mnt_idmap *, struct dentry *, struct iattr *);
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
