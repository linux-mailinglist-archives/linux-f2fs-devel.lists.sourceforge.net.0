Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE441CA136
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 May 2020 04:56:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jWtB7-0005Zm-No; Fri, 08 May 2020 02:55:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jWtB6-0005ZY-I8
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 May 2020 02:55:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=itTxqkruqnN3XT4S8QHufwRfWMleLdgMrEgM+qLUTRQ=; b=g0R1LcMUTahvAhOtmwaxwGf+hc
 5tuQ5FR3PQID8XdGpOjVoeCNO2Qm79hLzs+oqXjZgzBU+7kOuztWpTlVO6UJXWGpyGATmy+NVNQLD
 rsMf8wJluCxVY39bpT/ViZlrY+a260ytH6y+qxtzeM5H/eFLtuz9kRGVIEJtHlqFsjEU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=itTxqkruqnN3XT4S8QHufwRfWMleLdgMrEgM+qLUTRQ=; b=c0HI674U7rLhKOhxMC2lPdukUf
 maFkgDvQXltucxaN7BLlDopKulRis0JoUy9872y+kKIJ4eFA8XtJzujX9q25Vj+Nll1QgapjoNsaW
 XOm/yoKHvulIwGo3CVPkkD8R2Fx8yqIV6OzUSxZBclJKXQ7snoHUp2h59TIwXiZPstUg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jWtB5-00ByjU-G5
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 May 2020 02:55:56 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E329520731;
 Fri,  8 May 2020 02:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588906545;
 bh=xZL6GABrc5V8zEN+WNgdg5AUydrKLRFO8szbem4wjEk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YzgJmsRpYUp92OBc8zIyiikyOWIf9biXSi+7O9rdRZskko9YnlEa+BbnHrggIb4eB
 YG2+OQSPa2znUdsigdgsWMvC2sHrVsKj7+DpRhHCYJwA2Um3cNfJUx6mCawYmBZo3X
 Vc/5HHm/xaYQkfhs63iNsG7f0KMRxiFS7kmNV0hU=
Date: Thu, 7 May 2020 19:55:43 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Message-ID: <20200508025543.GA63151@sol.localdomain>
References: <20200507075905.953777-1-ebiggers@kernel.org>
 <20200507075905.953777-5-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200507075905.953777-5-ebiggers@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWtB5-00ByjU-G5
Subject: Re: [f2fs-dev] [RFC PATCH 4/4] f2fs: Handle casefolding with
 Encryption (INCOMPLETE)
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
Cc: linux-fscrypt@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>,
 Daniel Rosenberg <drosen@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, May 07, 2020 at 12:59:05AM -0700, Eric Biggers wrote:
> -static void init_dent_inode(const struct f2fs_filename *fname,
> +static void init_dent_inode(struct inode *dir, struct inode *inode,
> +			    const struct f2fs_filename *fname,
>  			    struct page *ipage)
>  {
>  	struct f2fs_inode *ri;
>  
> +	if (!fname) /* tmpfile case? */
> +		return;
> +
>  	f2fs_wait_on_page_writeback(ipage, NODE, true, true);
>  
>  	/* copy name info. to this inode page */
>  	ri = F2FS_INODE(ipage);
>  	ri->i_namelen = cpu_to_le32(fname->disk_name.len);
>  	memcpy(ri->i_name, fname->disk_name.name, fname->disk_name.len);
> +	if (IS_ENCRYPTED(dir)) {
> +		file_set_enc_name(inode);
> +		/*
> +		 * Roll-forward recovery doesn't have encryption keys available,
> +		 * so it can't compute the dirhash for encrypted+casefolded
> +		 * filenames.  Append it to i_name if possible.  Else, disable
> +		 * roll-forward recovery of the dentry (i.e., make fsync'ing the
> +		 * file force a checkpoint) by setting LOST_PINO.
> +		 */
> +		if (IS_CASEFOLDED(dir)) {
> +			if (fname->disk_name.len + sizeof(f2fs_hash_t) <=
> +			    F2FS_NAME_LEN)
> +				put_unaligned(fname->hash,
> +					&ri->i_name[fname->disk_name.len]);

Jaegeuk pointed out that we need a cast to 'f2fs_hash_t *' here.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
