Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cF0hB2avKGq5IAMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Jun 2026 02:27:18 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4EB664F46
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Jun 2026 02:27:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=FFQ9Jwkz;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=fykzTf+f;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=I2MSNNcH;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=c3iYbqR8;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DDRgdIIvJrqYUiynBNaWFvLNiMIzx8mayBRDFYoj2wA=; b=FFQ9JwkzYsFlN8nBQz3pW2yFFR
	0CQaJb+VoCxxsquaQ4ToOr79mtg2qKpU+TmBiU5JDFf35mBTlsBKd8rBRLKSqjUYPDYzDkaJl0avj
	Thttm4HTEWX8s8c88We7Widlrtf+modCkBX8RygwLAAWeDd/wynIeHjO6zXXDl2L22ow=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wX6me-0001Od-Rf;
	Wed, 10 Jun 2026 00:27:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1wX6mb-0001OW-Ky
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jun 2026 00:27:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IGvstAZW9nf+V7gkbUx6GISHABXm9vuy2cXtq4oBh4c=; b=fykzTf+fg57eMrW66MdIE1FrUd
 9gvFWd5TDK8nU0AaeaB/HIRYbxBt9gZgnvQefburUbNgprS1bkhs4aFlbK3AGKlaJKOZyAK5PeayL
 byetmfo5meM/qk/UmSNLhy4pBnuzGeryT5HbuZJnYgnuwgERf6lruzcNb1ws7yaswHnw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IGvstAZW9nf+V7gkbUx6GISHABXm9vuy2cXtq4oBh4c=; b=I2MSNNcHAoCdFImrWTh1EAboUT
 j8FcSRH3j8XIR2VHl3EsknzJ6Ow+MLcyTNvYi7Ynk0JGXVwFxWFg0paGPtRqaHP2rZfs3hRxEFHCv
 Se4sm4dbIJhRnGOTfYwgAUMs6Uud5Z7UkCLUdFOTBOsh/9P2P0/47RqWEZbKUsU70a/4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wX6ma-0000Wu-Dx for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jun 2026 00:27:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 5BDE943B84;
 Wed, 10 Jun 2026 00:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 117DB1F00893;
 Wed, 10 Jun 2026 00:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781051215;
 bh=IGvstAZW9nf+V7gkbUx6GISHABXm9vuy2cXtq4oBh4c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=c3iYbqR81aGdMs9Dh8vRG4m5siMtQUXGoDOqifpOdVyCGFjEwWgwbr/8QnXCNN1Sp
 22I8HL5Rz26UzMlp9y8ZjHiKvfXfHJByk1ZJWyhM3lnYoND4Z3rNn69TJLlsUT9EdN
 G0knQnH45hoeAjOpbd0Mn93rh4G5OmWSYsuaBYjYiqNyJU+rg3KngIMUz1pJcpfWKH
 f3BcDZQBssMSJFQ8scOIDXq4QGliW41x/iwaPbS/OVHSShactO9TyHZdOKx4WkrKQN
 HKu3cm1d4w1teUlM6Amk3MCnlVjDHx1IDz0LV/jA7+pmEjIyUGaOdR/IVq7DdG+pEJ
 U4cv31Ne1qYnQ==
Date: Wed, 10 Jun 2026 00:26:53 +0000
To: Wenjie Qi <qwjhust@gmail.com>
Message-ID: <aiivTdvRhZlk6wC3@google.com>
References: <20260521110526.1967583-1-qiwenjie@xiaomi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260521110526.1967583-1-qiwenjie@xiaomi.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/21,
 Wenjie Qi wrote: > F2FS large folio support is read-only.
 It rejects writable opens and > mmap writes when an inode mapping supports
 large folios, but setattr can > still reach the inode wit [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wX6ma-0000Wu-Dx
Subject: Re: [f2fs-dev] [PATCH] f2fs: reject setattr writes on large folio
 files
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net, qiwenjie@xiaomi.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qwjhust@gmail.com,m:linux-f2fs-devel@lists.sourceforge.net,m:qiwenjie@xiaomi.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[jaegeuk@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C4EB664F46

On 05/21, Wenjie Qi wrote:
> F2FS large folio support is read-only. It rejects writable opens and
> mmap writes when an inode mapping supports large folios, but setattr can
> still reach the inode without going through those checks.
> 
> For immutable large-folio files, clearing the immutable flag keeps the
> cached inode and its large-folio mapping alive until the inode is
> dropped. A path-based truncate(2) can then call f2fs_setattr() with
> ATTR_SIZE and change the file size without opening the file for write.
> 
> The user.fadvise path adds another visible case: after the file is
> reopened with large folios, chmod(WRITE) is documented to fail, but
> f2fs_setattr() currently allows ATTR_MODE to add write bits back.

We don't add this anymore. Can you update?

> 
> Reject size changes and mode changes that enable write permissions while
> the mapping still supports large folios. Read-only mode changes and
> unrelated metadata updates remain allowed.
> 
> Fixes: 05e65c14ea59 ("f2fs: support large folio for immutable non-compressed case")
> Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
> ---
>  fs/f2fs/file.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 71385ca4163d..3880ff5e6740 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1097,6 +1097,11 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>  				  ATTR_GID | ATTR_TIMES_SET))))
>  		return -EPERM;
>  
> +	if (mapping_large_folio_support(inode->i_mapping) &&
> +	    ((attr->ia_valid & ATTR_SIZE) ||
> +	     ((attr->ia_valid & ATTR_MODE) && (attr->ia_mode & 0222))))
> +		return -EOPNOTSUPP;
> +
>  	if ((attr->ia_valid & ATTR_SIZE)) {
>  		if (!f2fs_is_compress_backend_ready(inode) ||
>  				IS_DEVICE_ALIASING(inode))
> -- 
> 2.43.0
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
