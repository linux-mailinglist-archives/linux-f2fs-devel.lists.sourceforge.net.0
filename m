Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B1ACF12FDE4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  3 Jan 2020 21:26:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1inTWs-00089L-Fq; Fri, 03 Jan 2020 20:26:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1inTWr-00089D-3X
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Jan 2020 20:26:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j9HvB9oGjIjK8nwMPkEfnnIOl4ZQOletwuHIBp7Ag3I=; b=HbL9BsPyLQo6n8ZUE9ZD1yJ3Nv
 oIhx8LBkrY0BjZoPTpRGzglbR3gRo0QTE1GIPMffZZKFj27w5u4btHlmjVTUm5SG2xfQxpW0g7dks
 ksgSTQCliNoeF+ESUM6BLwpM+OW8am+D9+Hv1uO6ob6wr9PAt+sTIzCU/Bf+YQHF4vss=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j9HvB9oGjIjK8nwMPkEfnnIOl4ZQOletwuHIBp7Ag3I=; b=L4cUOVO8TUFCB1YhsZYgRgeiV/
 EHSjnfEusaFl7UOGXRoHg6iqSpaXSuFLqg2tmSml3HgSw+HIFsSGzjHaB+ikyw0hIZuuxrHcT4b8z
 vBReWr4Qe+txcmkQnm8cFrladCz3GT4EiDPx5K5Pgy7JdAUxlBH/5m5A+vwbJGM/yj34=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1inTWf-008tX6-Hq
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Jan 2020 20:26:40 +0000
Received: from callcc.thunk.org (guestnat-104-133-0-111.corp.google.com
 [104.133.0.111] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 003KQ8JY013722
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 3 Jan 2020 15:26:09 -0500
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 522F24200AF; Fri,  3 Jan 2020 15:26:08 -0500 (EST)
Date: Fri, 3 Jan 2020 15:26:08 -0500
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <20200103202608.GB4253@mit.edu>
References: <20191203051049.44573-1-drosen@google.com>
 <20191203051049.44573-5-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191203051049.44573-5-drosen@google.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 MAY_BE_FORGED          Relay IP's reverse DNS does not resolve to IP
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1inTWf-008tX6-Hq
Subject: Re: [f2fs-dev] [PATCH 4/8] vfs: Fold casefolding into vfs
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
Cc: Jonathan Corbet <corbet@lwn.net>, kernel-team@android.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Dec 02, 2019 at 09:10:45PM -0800, Daniel Rosenberg wrote:
> @@ -228,6 +229,13 @@ static inline int dentry_string_cmp(const unsigned char *cs, const unsigned char
>  
>  #endif
>  
> +bool needs_casefold(const struct inode *dir)
> +{
> +	return IS_CASEFOLDED(dir) &&
> +			(!IS_ENCRYPTED(dir) || fscrypt_has_encryption_key(dir));
> +}
> +EXPORT_SYMBOL(needs_casefold);
> +

I'd suggest adding a check to make sure that dir->i_sb->s_encoding is
non-NULL before needs_casefold() returns non-NULL.  Otherwise a bug
(or a fuzzed file system) which manages to set the S_CASEFOLD flag without having s_encoding be initialized might cause a NULL dereference.

Also, maybe make needs_casefold() an inline function which returns 0
if CONFIG_UNICODE is not defined?  That way the need for #ifdef
CONFIG_UNICODE could be reduced.

> @@ -247,7 +255,19 @@ static inline int dentry_cmp(const struct dentry *dentry, const unsigned char *c
>  	 * be no NUL in the ct/tcount data)
>  	 */
>  	const unsigned char *cs = READ_ONCE(dentry->d_name.name);
> +#ifdef CONFIG_UNICODE
> +	struct inode *parent = dentry->d_parent->d_inode;
>  
> +	if (unlikely(needs_casefold(parent))) {
> +		const struct qstr n1 = QSTR_INIT(cs, tcount);
> +		const struct qstr n2 = QSTR_INIT(ct, tcount);
> +		int result = utf8_strncasecmp(dentry->d_sb->s_encoding,
> +						&n1, &n2);
> +
> +		if (result >= 0 || sb_has_enc_strict_mode(dentry->d_sb))
> +			return result;
> +	}
> +#endif

This is an example of how we could drop the #ifdef CONFIG_UNICODE
(moving the declaration of 'parent' into the #if statement) if
needs_casefold() always returns 0 if !defined(CONFIG_UNICODE).

> @@ -2404,7 +2424,22 @@ struct dentry *d_hash_and_lookup(struct dentry *dir, struct qstr *name)
>  	 * calculate the standard hash first, as the d_op->d_hash()
>  	 * routine may choose to leave the hash value unchanged.
>  	 */
> +#ifdef CONFIG_UNICODE
> +	unsigned char *hname = NULL;
> +	int hlen = name->len;
> +
> +	if (IS_CASEFOLDED(dir->d_inode)) {
> +		hname = kmalloc(PATH_MAX, GFP_ATOMIC);
> +		if (!hname)
> +			return ERR_PTR(-ENOMEM);
> +		hlen = utf8_casefold(dir->d_sb->s_encoding,
> +					name, hname, PATH_MAX);
> +	}
> +	name->hash = full_name_hash(dir, hname ?: name->name, hlen);
> +	kfree(hname);
> +#else
>  	name->hash = full_name_hash(dir, name->name, name->len);
> +#endif

Perhaps this could be refactored out?  It's also used in
link_path_walk() and lookup_one_len_common().

(Note, there was some strageness in lookup_one_len_common(), where
hname is freed twice, the first time using kvfree() which I don't
believe is needed.  But this can be fixed as part of the refactoring.)

	   	    	     	    	  - Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
