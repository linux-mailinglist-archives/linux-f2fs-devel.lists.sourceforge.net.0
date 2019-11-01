Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8DBEC88D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 Nov 2019 19:33:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iQbjv-0004py-FT; Fri, 01 Nov 2019 18:33:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1iQbju-0004pq-28
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 Nov 2019 18:33:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=loVcj32FllpAfgqTExDSAfQy1teYUT8w/yjMRqGqNPY=; b=AiwpClUblSxF1vQEQdsjO3/KN0
 UWOIKueuc1Un7Zz9WlpCyVkLZ1rc+TXrDw5AUFfp+0sAPhS4bX/m2VLfAtu9T6J8siD3/8XExY9hH
 zD86SVlJS+FtBUqtj3Tlk77e0ndrr2fFbZnC6dDLoNUDRw72lq0IyzI4pYq6eKnLi03A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=loVcj32FllpAfgqTExDSAfQy1teYUT8w/yjMRqGqNPY=; b=TP5ergbR4KFU7ylxQ5ZelxErbk
 WCKqzMvRSmeYi28BUzwfesge5AhHbcM2a1i0OtV4l1tc/zAJhk4o0SdDn9q4OOsJpdaANYtRb0nEU
 jYA8+QxDDrsgXHTEGX05tdLJ3MqoNnqft4ok3fes+++6FbpPMCUddNZKygXpkO8jsusY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iQbjm-00CzBU-VB
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 Nov 2019 18:33:38 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 520EB21734;
 Fri,  1 Nov 2019 18:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572633205;
 bh=O2xOXMU8ZuGa8qvDhmT8yNNHuqfhzhj+CDrM/y+R8mw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hzidrk+UjF6KOAXbE6VsYklvSG6v4p6oZqYY3BHWUMifu38B/OUELpDbD+afGyp6+
 9vqZyc1hVRscVcUMFAu1Hp1/YTh9T8Bcp4XzfLAVsAi5f3V/3eF/EJzoXBfImYp//E
 c8EBJE/0RMsGQPUUvMoTpfJRFaLjO5W/YJe+ukw4=
Date: Fri, 1 Nov 2019 11:33:24 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20191101183324.GA14664@jaegeuk-macbookpro.roam.corp.google.com>
References: <20191024215438.138489-1-ebiggers@kernel.org>
 <20191024215438.138489-4-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191024215438.138489-4-ebiggers@kernel.org>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.2 (/)
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
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iQbjm-00CzBU-VB
Subject: Re: [f2fs-dev] [PATCH v2 3/3] f2fs: add support for IV_INO_LBLK_64
 encryption policies
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
Cc: linux-f2fs-devel@lists.sourceforge.net, "Theodore Y . Ts'o" <tytso@mit.edu>,
 Satya Tangirala <satyat@google.com>, Paul Lawrence <paullawrence@google.com>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/24, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> f2fs inode numbers are stable across filesystem resizing, and f2fs inode
> and file logical block numbers are always 32-bit.  So f2fs can always
> support IV_INO_LBLK_64 encryption policies.  Wire up the needed
> fscrypt_operations to declare support.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Acked-by: Jaegeuk Kim <jaegeuk@kernel.org>

> ---
>  fs/f2fs/super.c | 26 ++++++++++++++++++++------
>  1 file changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 1443cee158633..851ac95229263 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2308,13 +2308,27 @@ static bool f2fs_dummy_context(struct inode *inode)
>  	return DUMMY_ENCRYPTION_ENABLED(F2FS_I_SB(inode));
>  }
>  
> +static bool f2fs_has_stable_inodes(struct super_block *sb)
> +{
> +	return true;
> +}
> +
> +static void f2fs_get_ino_and_lblk_bits(struct super_block *sb,
> +				       int *ino_bits_ret, int *lblk_bits_ret)
> +{
> +	*ino_bits_ret = 8 * sizeof(nid_t);
> +	*lblk_bits_ret = 8 * sizeof(block_t);
> +}
> +
>  static const struct fscrypt_operations f2fs_cryptops = {
> -	.key_prefix	= "f2fs:",
> -	.get_context	= f2fs_get_context,
> -	.set_context	= f2fs_set_context,
> -	.dummy_context	= f2fs_dummy_context,
> -	.empty_dir	= f2fs_empty_dir,
> -	.max_namelen	= F2FS_NAME_LEN,
> +	.key_prefix		= "f2fs:",
> +	.get_context		= f2fs_get_context,
> +	.set_context		= f2fs_set_context,
> +	.dummy_context		= f2fs_dummy_context,
> +	.empty_dir		= f2fs_empty_dir,
> +	.max_namelen		= F2FS_NAME_LEN,
> +	.has_stable_inodes	= f2fs_has_stable_inodes,
> +	.get_ino_and_lblk_bits	= f2fs_get_ino_and_lblk_bits,
>  };
>  #endif
>  
> -- 
> 2.24.0.rc0.303.g954a862665-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
