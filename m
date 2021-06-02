Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDB5398D8B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Jun 2021 16:57:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1loSJS-00085f-LL; Wed, 02 Jun 2021 14:57:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1loSJR-00085T-T5
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Jun 2021 14:57:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=efj4MeqwJM63z/MyMnxJsa6sSlCY4D2KvjnLyCBLU3Q=; b=WBrgoKMhvsae9Nv38QY2TkGbyd
 PLp55DFgKHyxV3t2Psyts5xAZT9kxGVvvv9/2zJGD0DT5B2yG8UCcJA9G1FGdsuGzP5NM605Q/V3Q
 ud5IM6vxQuFXzbUrkYQ1p3QhiHA1cKrIBQGRLLF/WRBMUKrzf8sYJVHgSpXfW0JtC8LA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=efj4MeqwJM63z/MyMnxJsa6sSlCY4D2KvjnLyCBLU3Q=; b=HgHo8N0DzErFUaz5JxDjYmh216
 baeo3X5DUuIXDraIU2QYgeSnpu/Hmh2XktJrEyQFoARIVFTO+lG+xDuYikO0bQliF/Kn7uxcY8kN4
 eM56AvbLIXvqysKuJp4jJz7dbgyBgTeEFjt3tpXE0he1yBSByfW80CnytQOb89M62jsg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1loSJH-007NLH-N3
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Jun 2021 14:57:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 63A6F60C3F;
 Wed,  2 Jun 2021 14:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622645846;
 bh=9S5+0imidO+Ol9OzZqRG2yXOFZnJXLzoJ8dwHhJ87c0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=nTptz/RlreMg0+WvWbELEa13RR9Mh6Crt8dAeUzRJtFkqemJWRI+ULnVKfkhaZstK
 vawFGwKVXBV0TVqZkzQZDnRrbYNfKZQ6UBZTxELF8o2ClxDpl7vFkeoieBg2BRWB6V
 mQ6ozIIHUrgorrb/sJdGW9dfL/SO9mIR+UCiwgO6W9o2y45oeB/uiw6CWwYBiwJtC5
 Y0GbUj65jYHd/OgfuIqc8gs7BrFGTnDjxy80AdnLetKU7UGZ4GTin2ZgyubqFz3x9h
 oJXgwPx3LLdNBok4d7d8cab8mhdwhx5U/g7YKOr0ndvllgPTgBXNQZ/CEkkZri42kq
 hXmxbPGlR3tcw==
To: Daniel Rosenberg <drosen@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
References: <20210602041539.123097-1-drosen@google.com>
 <20210602041539.123097-3-drosen@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <a954e38e-8ace-df39-3d74-814afd798267@kernel.org>
Date: Wed, 2 Jun 2021 22:57:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210602041539.123097-3-drosen@google.com>
Content-Language: en-US
X-Spam-Score: -1.1 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.6 NICE_REPLY_A           Looks like a legit reply (A)
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1loSJH-007NLH-N3
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: Advertise encrypted casefolding in
 sysfs
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
Cc: linux-fsdevel@vger.kernel.org, kernel-team@android.com,
 Gabriel Krisman Bertazi <krisman@collabora.com>, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/6/2 12:15, Daniel Rosenberg wrote:
> Older kernels don't support encryption with casefolding. This adds
> the sysfs entry encrypted_casefold to show support for those combined
> features. Support for this feature was originally added by
> commit 7ad08a58bf67 ("f2fs: Handle casefolding with Encryption")

Shouldn't this be backported to the kernel where we support casefolding
with encryption? So adding a fixes tag here?

Thanks,

> 
> Signed-off-by: Daniel Rosenberg <drosen@google.com>
> ---
>   fs/f2fs/sysfs.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 09e3f258eb52..3c1095a76710 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -161,6 +161,9 @@ static ssize_t features_show(struct f2fs_attr *a,
>   	if (f2fs_sb_has_compression(sbi))
>   		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
>   				len ? ", " : "", "compression");
> +	if (f2fs_sb_has_casefold(sbi) && f2fs_sb_has_encrypt(sbi))
> +		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
> +				len ? ", " : "", "encrypted_casefold");
>   	len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
>   				len ? ", " : "", "pin_file");
>   	len += scnprintf(buf + len, PAGE_SIZE - len, "\n");
> @@ -579,6 +582,7 @@ enum feat_id {
>   	FEAT_CASEFOLD,
>   	FEAT_COMPRESSION,
>   	FEAT_TEST_DUMMY_ENCRYPTION_V2,
> +	FEAT_ENCRYPTED_CASEFOLD,
>   };
>   
>   static ssize_t f2fs_feature_show(struct f2fs_attr *a,
> @@ -600,6 +604,7 @@ static ssize_t f2fs_feature_show(struct f2fs_attr *a,
>   	case FEAT_CASEFOLD:
>   	case FEAT_COMPRESSION:
>   	case FEAT_TEST_DUMMY_ENCRYPTION_V2:
> +	case FEAT_ENCRYPTED_CASEFOLD:
>   		return sprintf(buf, "supported\n");
>   	}
>   	return 0;
> @@ -704,6 +709,9 @@ F2FS_GENERAL_RO_ATTR(avg_vblocks);
>   #ifdef CONFIG_FS_ENCRYPTION
>   F2FS_FEATURE_RO_ATTR(encryption, FEAT_CRYPTO);
>   F2FS_FEATURE_RO_ATTR(test_dummy_encryption_v2, FEAT_TEST_DUMMY_ENCRYPTION_V2);
> +#ifdef CONFIG_UNICODE
> +F2FS_FEATURE_RO_ATTR(encrypted_casefold, FEAT_ENCRYPTED_CASEFOLD);
> +#endif
>   #endif
>   #ifdef CONFIG_BLK_DEV_ZONED
>   F2FS_FEATURE_RO_ATTR(block_zoned, FEAT_BLKZONED);
> @@ -815,6 +823,9 @@ static struct attribute *f2fs_feat_attrs[] = {
>   #ifdef CONFIG_FS_ENCRYPTION
>   	ATTR_LIST(encryption),
>   	ATTR_LIST(test_dummy_encryption_v2),
> +#ifdef CONFIG_UNICODE
> +	ATTR_LIST(encrypted_casefold),
> +#endif
>   #endif
>   #ifdef CONFIG_BLK_DEV_ZONED
>   	ATTR_LIST(block_zoned),
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
