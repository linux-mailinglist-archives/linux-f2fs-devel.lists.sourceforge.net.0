Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D19C8962FE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Apr 2024 05:31:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rrrL9-0004PD-Dh;
	Wed, 03 Apr 2024 03:31:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1rrrL7-0004P3-VI
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 03:31:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7XvrA6hpFmQN68c+PhQ6b+lMMbQYAJc8dV3oVn/oTDU=; b=LW6ZdPMX3NUTsst0mnZ+LtFt1K
 0tMH62MBvxS+QOeB4ZjwiEVa3/OJiBfUiokMo4GIptPBzNQ9pmJhuwSNo8/0Z3P8/3S5H6xEtlEDk
 DV9bTaS1YBpRb37N2cNgbx6h3EhYWB1hq2fZ1tzDn2nJCNNu+3TXnrG1VwheVavy4qSg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7XvrA6hpFmQN68c+PhQ6b+lMMbQYAJc8dV3oVn/oTDU=; b=PGDOmjRpN21VPo+8zAPJNqCOM4
 pD874whPaudxNpGc6kPy0ttSSyjnBEr/P2pykSMn17tW3A5rYx1LXZXv+v44cnkm89oWe6+J8u/cr
 C+srS1qAyLwpjZ5GVeYWZ3zVL/pAXkuILO3nBx1S0/xv/9UMX2bMessm7TBHuNXXq5Gg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rrrL4-0005PR-L1 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 03:31:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 917EE61200;
 Wed,  3 Apr 2024 03:30:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3129C433F1;
 Wed,  3 Apr 2024 03:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712115057;
 bh=aUHCt2G7OXXo2o4YJpgKFb2OWsCjhGSf+zKg2+GPiFU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uAAEV/1P7uecv9LxBjxJwaDuB2DRliq+mLbtBH9a5/NTqmXTxKzZcVLyIjR7h9nSu
 RavWKK8nGD3a5I6ZXc5gfgy2LALZOYSpW7/4TrWkzA82V1l+cZvrkNIMW2b1vhxqqe
 Kso9i34D4Pvnz3sLruOqRQ8siwwmLZwVkNmcAfKQEbe8WYWdesfZdW2m/64pN/xuGQ
 N+CIMfgrTwjWlJSCPriefrDG1SbvppJhHi4iZ5JqCUMZki6fw0N2TwdUItWBhitd9U
 13eCEPhcqGY3M3Z9piSfZV7WgYBFuS1Eq7pX1POdh+k8gCSo5wVktHhTKcAwBbU5xx
 HNgLbEV1k7FxQ==
Date: Tue, 2 Apr 2024 20:30:55 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Eugen Hristev <eugen.hristev@collabora.com>
Message-ID: <20240403033055.GD2576@sol.localdomain>
References: <20240402154842.508032-1-eugen.hristev@collabora.com>
 <20240402154842.508032-3-eugen.hristev@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240402154842.508032-3-eugen.hristev@collabora.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Apr 02, 2024 at 06:48:35PM +0300,
 Eugen Hristev wrote:
 > diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c > index
 d0f24ccbd1ac..7e53abf6d216
 100644 > --- a/fs/f2fs/recovery.c > +++ b/fs/f2 [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rrrL4-0005PR-L1
Subject: Re: [f2fs-dev] [PATCH v15 2/9] f2fs: Simplify the handling of
 cached insensitive names
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
Cc: krisman@suse.de, brauner@kernel.org, kernel@collabora.com, tytso@mit.edu,
 jack@suse.cz, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, adilger.kernel@dilger.ca,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Apr 02, 2024 at 06:48:35PM +0300, Eugen Hristev wrote:
> diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
> index d0f24ccbd1ac..7e53abf6d216 100644
> --- a/fs/f2fs/recovery.c
> +++ b/fs/f2fs/recovery.c
> @@ -153,11 +153,8 @@ static int init_recovered_filename(const struct inode *dir,
>  		if (err)
>  			return err;
>  		f2fs_hash_filename(dir, fname);
> -#if IS_ENABLED(CONFIG_UNICODE)
>  		/* Case-sensitive match is fine for recovery */
> -		kmem_cache_free(f2fs_cf_name_slab, fname->cf_name.name);
> -		fname->cf_name.name = NULL;
> -#endif
> +		f2fs_free_casefolded_name(fname);
>  	} else {
>  		f2fs_hash_filename(dir, fname);
>  	}

This change makes the declaration of f2fs_cf_name_slab in recovery.c
unnecessary.  It can be removed.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
