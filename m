Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A85352C330
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 May 2022 21:21:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nrPEE-0007AX-Sk; Wed, 18 May 2022 19:21:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1nrPED-0007AN-Ip
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 May 2022 19:21:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PGAjmgWWVwo7DRr+PVz25/MMOmXac86oAXLTZn2IPbg=; b=b58bcf1PrO5nLgvmvvhD0AONCW
 EBE87U1LLPVlOHb7bP2eT/u6uBbVGiR2DqcCz6UIsRmSDAgiHaD6k8We57RkLAUW+wNIiaZ9WUqIQ
 N6HrmksEswZTpyponXnpL5VK/iBSOc6DmkjjJWAEMeGaJRW3cT5xaVzRb3PDr8B/qIpY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PGAjmgWWVwo7DRr+PVz25/MMOmXac86oAXLTZn2IPbg=; b=FErIcBY0iaLCqPpZVaRQVooIQE
 8DA/SGNGqrQcwFgj/Vpf0z0bx4KJGwHtICRst4Qs4ayyIHHOY7bNx1dC3vf/haGfj8/80sd8yb6xs
 KXdkIIoJp0ScA7hoR7onpLlE5w2kZ+bFKQUa9D4b31D/NogR6b/M8AR37q2qV4ITB8xw=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nrPE7-0001rA-Uz
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 May 2022 19:20:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D8734B81F3A;
 Wed, 18 May 2022 19:20:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 560F9C385A9;
 Wed, 18 May 2022 19:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652901647;
 bh=rP1V47fuAQdnud9qXZhFmg0TYruAtH05GnMFhrZhVME=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bTg/C7ThWkW2TTbMTsjcxexM1PbHwENIe9sOBoHxoLD5moZTXEAw22ifb5U1Be1Tt
 kw6n0veOaOyNI5BF04AzrO77F/0pyhrAmzeIxpMWm+y21a3l3CIpEsBVhMFJ1w5fwQ
 qOhNHlF+oPW0H9FVTjFMeEM+j8h5sqIjHHgBSkabLpTAYdOPgYYap8yGfTpdWdPxEK
 S29jeBzzBEtf3nE0i6/DaNeYYsCRRvY4Un5IvLo+UhS88snF83jMqm6lnLiSjXgRdg
 mMXFv+5LmPjqUJylqz/WGiv7skuwqWzzUCJ/JYcNZNt+iA4GjCg9jDlQblMFAS42RE
 FA68xjQ4BODFQ==
Date: Wed, 18 May 2022 12:20:45 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <YoVHDdMYx5Lbn7aP@sol.localdomain>
References: <20220518172320.333617-1-krisman@collabora.com>
 <20220518172320.333617-5-krisman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220518172320.333617-5-krisman@collabora.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 18, 2022 at 01:23:16PM -0400, Gabriel Krisman
 Bertazi wrote: > Instead of reimplementing ext4_match_ci, use the new libfs
 helper. > > Signed-off-by: Gabriel Krisman Bertazi <krisman@collab [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nrPE7-0001rA-Uz
Subject: Re: [f2fs-dev] [PATCH v5 4/8] ext4: Reuse generic_ci_match for ci
 comparisons
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
Cc: linux-ext4@vger.kernel.org, tytso@mit.edu,
 linux-f2fs-devel@lists.sourceforge.net, adilger.kernel@dilger.ca,
 jaegeuk@kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, May 18, 2022 at 01:23:16PM -0400, Gabriel Krisman Bertazi wrote:
> Instead of reimplementing ext4_match_ci, use the new libfs helper.
> 
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> ---
[...]
>  int ext4_fname_setup_ci_filename(struct inode *dir, const struct qstr *iname,
>  				  struct ext4_filename *name)
>  {
> @@ -1432,20 +1380,25 @@ static bool ext4_match(struct inode *parent,
>  #if IS_ENABLED(CONFIG_UNICODE)
>  	if (parent->i_sb->s_encoding && IS_CASEFOLDED(parent) &&
>  	    (!IS_ENCRYPTED(parent) || fscrypt_has_encryption_key(parent))) {
> -		if (fname->cf_name.name) {
> -			if (IS_ENCRYPTED(parent)) {
> -				if (fname->hinfo.hash != EXT4_DIRENT_HASH(de) ||
> -					fname->hinfo.minor_hash !=
> -						EXT4_DIRENT_MINOR_HASH(de)) {
> +		int ret;
>  
> -					return false;
> -				}
> -			}
> -			return !ext4_ci_compare(parent, &fname->cf_name,
> -						de->name, de->name_len, true);
> +		if (IS_ENCRYPTED(parent) &&
> +		    (fname->hinfo.hash != EXT4_DIRENT_HASH(de) ||
> +		     fname->hinfo.minor_hash != EXT4_DIRENT_MINOR_HASH(de)))
> +			return false;
> +
> +		ret = generic_ci_match(parent, fname->usr_fname,
> +				       &fname->cf_name, de->name,
> +				       de->name_len);
> +		if (ret < 0) {
> +			/*
> +			 * Treat comparison errors as not a match.  The
> +			 * only case where it happens is on a disk
> +			 * corruption or ENOMEM.
> +			 */
> +			return false;
>  		}
> -		return !ext4_ci_compare(parent, fname->usr_fname, de->name,
> -						de->name_len, false);
> +		return ret;
>  	}

This needs an explanation for why it's okay to remove
'fname->cf_name.name != NULL' from the condition for doing the hash comparison
for an encrypted+casefolded directory entry.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
