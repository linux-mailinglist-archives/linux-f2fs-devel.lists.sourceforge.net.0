Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 12887142189
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Jan 2020 02:54:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1itMGe-0006Bw-Vt; Mon, 20 Jan 2020 01:54:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <viro@ftp.linux.org.uk>) id 1itMGc-0006BD-OP
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jan 2020 01:54:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=07Wbq55Cyqr3zBVt4NiTlh8b3QNGDdOmjHef7vcL2vY=; b=Ef8fmM7D5r2bcFJS8yAo+Y8LR
 SFxU+KpBCLm+ihiPljgmVTWBaoGQHixD0M6WraQFM70LH7azpSRvCSKKcn4x3eZp8NllucnBJaRNQ
 mkbLbWk8cmZM3FplneJc31FM5zmtjHnqDv7bH8ozgmXFzWshDbDmDN/UmkGln73KWBWw8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=07Wbq55Cyqr3zBVt4NiTlh8b3QNGDdOmjHef7vcL2vY=; b=CmgGFK6lDb2L3qQ9vtrOEcjKV8
 1J/QBiW/5mgp4rzswFxe+REul6F+w2fY3e2cMzP8IHBgzkgyH1dOHDFTB5tyRNl5cdy/NgpsI/hEr
 Vp1TgzE5rEqMBV8qCXnoHJnwtBq1ofYvqFIAk73phWLOV3PtuhwGg5Q+OiGYb4S0WOvA=;
Received: from zeniv.linux.org.uk ([195.92.253.2])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1itMGa-00AyZ5-RX
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jan 2020 01:54:14 +0000
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1itLyS-00Bl2j-If; Mon, 20 Jan 2020 01:35:28 +0000
Date: Mon, 20 Jan 2020 01:35:28 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <20200120013528.GY8904@ZenIV.linux.org.uk>
References: <20200117214246.235591-1-drosen@google.com>
 <20200117214246.235591-6-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200117214246.235591-6-drosen@google.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.92.253.2 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1itMGa-00AyZ5-RX
Subject: Re: [f2fs-dev] [PATCH v3 5/9] vfs: Fold casefolding into vfs
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
Cc: Theodore Ts'o <tytso@mit.edu>, Jonathan Corbet <corbet@lwn.net>,
 kernel-team@android.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jan 17, 2020 at 01:42:42PM -0800, Daniel Rosenberg wrote:
> Ext4 and F2fs are both using casefolding, and they, along with any other
> filesystem that adds the feature, will be using identical dentry_ops.
> Additionally, those dentry ops interfere with the dentry_ops required
> for fscrypt once we add support for casefolding and encryption.
> Moving this into the vfs removes code duplication as well as the
> complication with encryption.
> 
> Currently this is pretty close to just moving the existing f2fs/ext4
> code up a level into the vfs,

... buggering the filesystems (and boxen) that never planned to use
that garbage.

> @@ -247,7 +248,19 @@ static inline int dentry_cmp(const struct dentry *dentry, const unsigned char *c
>  	 * be no NUL in the ct/tcount data)
>  	 */
>  	const unsigned char *cs = READ_ONCE(dentry->d_name.name);
> +#ifdef CONFIG_UNICODE
> +	struct inode *parent = dentry->d_parent->d_inode;

What happens if dentry gets moved under you?  And that's not mentioning the joy
of extra cachelines to shit the cache with.  For every sodding dentry in the
hashchain you are walking.

> +	if (unlikely(needs_casefold(parent))) {
> +		const struct qstr n1 = QSTR_INIT(cs, tcount);
> +		const struct qstr n2 = QSTR_INIT(ct, tcount);
> +		int result = utf8_strncasecmp(dentry->d_sb->s_encoding,
> +						&n1, &n2);

Is that safe in face of renames?  We are *NOT* guaranteed ->d_lock here;
->d_name can change under you just fine.  False negatives are OK, but
there's a lot more ways for the things to go wrong.

>  static int link_path_walk(const char *name, struct nameidata *nd)
>  {

> +#ifdef CONFIG_UNICODE
> +		if (needs_casefold(nd->path.dentry->d_inode)) {
> +			struct qstr str = QSTR_INIT(name, PATH_MAX);
> +
> +			hname = kmalloc(PATH_MAX, GFP_ATOMIC);
> +			if (!hname)
> +				return -ENOMEM;
> +			hlen = utf8_casefold(nd->path.dentry->d_sb->s_encoding,
> +						&str, hname, PATH_MAX);
> +		}
> +		hash_len = hash_name(nd->path.dentry, hname ?: name);
> +		kfree(hname);
> +		hname = NULL;
> +#else
>  		hash_len = hash_name(nd->path.dentry, name);
> -
> +#endif

Are you serious?
	1) who said that ->d_inode is stable here?  If we are in RCU mode,
it won't be.
	2) page-sized kmalloc/kfree *ON* *COMPONENT* *AFTER* *COMPONENT*?

> +static inline bool needs_casefold(const struct inode *dir)
> +{
> +	return IS_CASEFOLDED(dir) && dir->i_sb->s_encoding &&
> +			(!IS_ENCRYPTED(dir) || fscrypt_has_encryption_key(dir));

... and again, you are pulling in a lot of cachelines.

<understatement> IMO the whole thing is not a good idea. </understatement>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
