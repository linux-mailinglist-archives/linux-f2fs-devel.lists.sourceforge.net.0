Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4086C927D
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 26 Mar 2023 07:04:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pgIYl-0003Ea-44;
	Sun, 26 Mar 2023 05:04:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <viro@ftp.linux.org.uk>) id 1pgIYi-0003ET-U3
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 26 Mar 2023 05:04:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wRdGMeDukOPfpIChX8oC11+lUjNcyTUDpDS6QjoKQTc=; b=cTtUY16mvVTBD6y+JRvUGi0vCX
 yQd5+BnmBEO/pqWkubMMzPRAO0Dc0drzfPaI9jqCY/PHrZCSnhxnUgSduL2+3MDlJiglfI/fRJjPO
 1IHwGnT2+P/IeB3KX+CtLYftWjrtdapDeJsAgo3Y0E5Mx5CWQwzLSgOgPbTWp76HSXKs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wRdGMeDukOPfpIChX8oC11+lUjNcyTUDpDS6QjoKQTc=; b=WWOFunxMfRGaQECcjDBneXAnwY
 hxUwT1AOQBQGg9AiAYlbsB89WWKFeTvbGRXg8zVmVgeNwC6CDbTBKukYkpHYY7MxRM7xQXfIf2JWR
 HtJ/SnDndq+jIvOpwg0WoBdhh67ERrBTqlLePqgacYuxnh5cObUY4RsY0ckyiZ4bAJt8=;
Received: from zeniv.linux.org.uk ([62.89.141.173])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pgIYi-003tZa-LZ for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 26 Mar 2023 05:04:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=wRdGMeDukOPfpIChX8oC11+lUjNcyTUDpDS6QjoKQTc=; b=hnkPa9Zevrm71mPI/eWuxQEuX2
 Iq+ahhpBqy2g5U16UNlmttYispW6PztrC2xLwdHm9Auf8OYBJww0igb+iINfJ2qV0g4qdetw3XKDT
 8Gd2eVTF3plKkb5Rsngam1DRJ8LDNKXHlUWr2grvVdGRyePybnm+1PSKcJrHr1k3xLKbGpHjSpJRY
 Z3TsNwOBGaZBfL5b3McqQ2QbF6sbaeAP+061rZZDiwFtsfZNPVIH80jnjqRbxv/ICr/wCLFUcAhYf
 1gB//SuzC54l5TEwMvQeiX5QLcXIsyjtCuKZ8S5lzvpiPGJSxCfVCXw3gIm4NbkWuq+oR/wx+SR4b
 KpZEQGGg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pgIGx-0020Np-21; Sun, 26 Mar 2023 04:46:27 +0000
Date: Sun, 26 Mar 2023 05:46:27 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <20230326044627.GD3390869@ZenIV>
References: <20220622194603.102655-1-krisman@collabora.com>
 <20220622194603.102655-4-krisman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220622194603.102655-4-krisman@collabora.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jun 22, 2022 at 03:45:59PM -0400, Gabriel Krisman
 Bertazi wrote: > +static inline int generic_ci_d_revalidate(struct dentry
 *dentry, > + const struct qstr *name, > + unsigned int flags) > +{ > + int
 is_creation = flags & (LOOKUP_CREATE | LOOKUP_RENAME_TARGET); > + [...] 
 Content analysis details:   (-0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal
 information
X-Headers-End: 1pgIYi-003tZa-LZ
Subject: Re: [f2fs-dev] [PATCH 3/7] libfs: Validate negative dentries in
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
Cc: kernel@collabora.com, tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net,
 ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jun 22, 2022 at 03:45:59PM -0400, Gabriel Krisman Bertazi wrote:

> +static inline int generic_ci_d_revalidate(struct dentry *dentry,
> +					  const struct qstr *name,
> +					  unsigned int flags)
> +{
> +	int is_creation = flags & (LOOKUP_CREATE | LOOKUP_RENAME_TARGET);
> +
> +	if (d_is_negative(dentry)) {
> +		const struct dentry *parent = READ_ONCE(dentry->d_parent);
> +		const struct inode *dir = READ_ONCE(parent->d_inode);
> +
> +		if (dir && needs_casefold(dir)) {
> +			if (!d_is_casefold_lookup(dentry))
> +				return 0;

	In which conditions does that happen?

> +			if (is_creation &&
> +			    (dentry->d_name.len != name->len ||
> +			     memcmp(dentry->d_name.name, name->name, name->len)))
> +				return 0;
> +		}
> +	}
> +	return 1;
> +}

	Analysis of stability of ->d_name, please.  It's *probably* safe, but
the details are subtle and IMO should be accompanied by several asserts.
E.g. "we never get LOOKUP_CREATE in op->intent without O_CREAT in op->open_flag
for such and such reasons, and we verify that in such and such place"...

	A part of that would be "the call in lookup_dcache() can only get there
with non-zero flags when coming from __lookup_hash(), and that has parent locked,
stabilizing the name; the same goes for the call in __lookup_slow(), with the
only call chain with possibly non-zero flags is through lookup_slow(), where we
have the parent locked".  However, lookup_fast() and lookup_open() have the
flags come from nd->flags, and LOOKUP_CREATE can be found there in several areas.
I _think_ we are guaranteed the parent locked in all such call chains, but that
is definitely worth at least a comment.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
