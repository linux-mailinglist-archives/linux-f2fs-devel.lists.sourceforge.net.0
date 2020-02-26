Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E893E16F453
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Feb 2020 01:31:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j6kbX-0004Ov-CP; Wed, 26 Feb 2020 00:31:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1j6kbV-0004Om-3f
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 Feb 2020 00:31:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RQ3Lrs5pD2I4D7BEXBfjzOqK/JSDXcJXX+5WTam+Ch4=; b=gNvUBr6Zr8gm5WWucKPxDSEmFg
 YRDyZdqxqauyS0yNb+agiRmiWjlC40Cha/FbiX7QmeEXF7YyerojqoZcC0/A5fNN2lcub05Nm4pMb
 XSlZFFAwbxro1dCeEkp6Z87PY4aLSDWh/SGIKjiGndt1Sk8umMMQ1apwktyMyJ7UeO+w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RQ3Lrs5pD2I4D7BEXBfjzOqK/JSDXcJXX+5WTam+Ch4=; b=lEBUKJefXo8OQZ3302Ak4klCoP
 5kBk0/l7hpbauK7GmqY/NmTsg1hV1SUE7rBGBVEGoQTTAFVSm0TbW/KHqsSpo4V9vL7a2zfnpQ5Rp
 CwYv+kls8WbOjxeh3eRjD8OmCR3THCnoKd6TutQeeeTgxIpqdWVmb9bXEyKPtdaB/IbE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j6kbS-009sw2-TD
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 Feb 2020 00:31:09 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2220721D7E;
 Wed, 26 Feb 2020 00:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582677056;
 bh=bSWh+q++sx8C8D9lAd6ZLiMK7C4FjpFs2du6fFMigso=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iPlCxoABGs8vm/dCfwQe7NAQXpNxvKvL/hghlJBEeMiaWyVPkj76Y8RftvlocF5QQ
 O38Q2Y7BPU3Fom0eR+SD1OFL79U9zFr79KbcFx2n0xjjE/J2+AeXoHaA3bS1cQW3Xe
 RjZqqiITwX9rWuGTXEyKS+hv4IXCbJJVbxX/ZjSs=
Date: Tue, 25 Feb 2020 16:30:54 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200226003054.GC114977@gmail.com>
References: <20200221115050.238976-1-satyat@google.com>
 <20200221115050.238976-8-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221115050.238976-8-satyat@google.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Spam-Score: 3.0 (+++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.5 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 1.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j6kbS-009sw2-TD
Subject: Re: [f2fs-dev] [PATCH v7 7/9] fscrypt: add inline encryption support
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
Cc: linux-scsi@vger.kernel.org, Kim Boojin <boojin.kim@samsung.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Feb 21, 2020 at 03:50:48AM -0800, Satya Tangirala wrote:
> +/**
> + * fscrypt_inode_uses_inline_crypto - test whether an inode uses inline
> + *				      encryption
> + * @inode: an inode
> + *
> + * Return: true if the inode requires file contents encryption and if the
> + *	   encryption should be done in the block layer via blk-crypto rather
> + *	   than in the filesystem layer.
> + */
> +bool fscrypt_inode_uses_inline_crypto(const struct inode *inode)
> +{
> +	return IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode) &&
> +		inode->i_crypt_info->ci_inlinecrypt;
> +}
> +EXPORT_SYMBOL_GPL(fscrypt_inode_uses_inline_crypto);
> +
> +/**
> + * fscrypt_inode_uses_fs_layer_crypto - test whether an inode uses fs-layer
> + *					encryption
> + * @inode: an inode
> + *
> + * Return: true if the inode requires file contents encryption and if the
> + *	   encryption should be done in the filesystem layer rather than in the
> + *	   block layer via blk-crypto.
> + */
> +bool fscrypt_inode_uses_fs_layer_crypto(const struct inode *inode)
> +{
> +	return IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode) &&
> +		!inode->i_crypt_info->ci_inlinecrypt;
> +}
> +EXPORT_SYMBOL_GPL(fscrypt_inode_uses_fs_layer_crypto);

We should use the fscrypt_needs_contents_encryption() helper function which I
added in v5.6.  I.e.:

diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
index 72692366795aa9..36510802a3665a 100644
--- a/fs/crypto/inline_crypt.c
+++ b/fs/crypto/inline_crypt.c
@@ -32,7 +32,7 @@ void fscrypt_select_encryption_impl(struct fscrypt_info *ci)
 	struct super_block *sb = inode->i_sb;
 
 	/* The file must need contents encryption, not filenames encryption */
-	if (!S_ISREG(inode->i_mode))
+	if (!fscrypt_needs_contents_encryption(inode))
 		return;
 
 	/* blk-crypto must implement the needed encryption algorithm */
@@ -148,7 +148,7 @@ void fscrypt_destroy_inline_crypt_key(struct fscrypt_prepared_key *prep_key)
  */
 bool fscrypt_inode_uses_inline_crypto(const struct inode *inode)
 {
-	return IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode) &&
+	return fscrypt_needs_contents_encryption(inode) &&
 		inode->i_crypt_info->ci_inlinecrypt;
 }
 EXPORT_SYMBOL_GPL(fscrypt_inode_uses_inline_crypto);
@@ -164,7 +164,7 @@ EXPORT_SYMBOL_GPL(fscrypt_inode_uses_inline_crypto);
  */
 bool fscrypt_inode_uses_fs_layer_crypto(const struct inode *inode)
 {
-	return IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode) &&
+	return fscrypt_needs_contents_encryption(inode) &&
 		!inode->i_crypt_info->ci_inlinecrypt;
 }
 EXPORT_SYMBOL_GPL(fscrypt_inode_uses_fs_layer_crypto);
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 2a84131ab270fd..1d9810eb88b113 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -528,7 +528,7 @@ static inline bool fscrypt_inode_uses_inline_crypto(const struct inode *inode)
 
 static inline bool fscrypt_inode_uses_fs_layer_crypto(const struct inode *inode)
 {
-	return IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode);
+	return fscrypt_needs_contents_encryption(inode);
 }
 
 static inline void fscrypt_set_bio_crypt_ctx(struct bio *bio,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
