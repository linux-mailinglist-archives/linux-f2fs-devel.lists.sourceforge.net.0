Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E9C81ECD2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Dec 2023 08:11:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rIO45-0004ii-T8;
	Wed, 27 Dec 2023 07:10:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rIO44-0004ib-9w
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 Dec 2023 07:10:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rdKxCUBOIxglP7jUcdgwRYgrxNxTy+C/jBvEw5SQMsI=; b=U+mokQJfivLwZwtI493aOHT9Bv
 XNetbaCky0NLeoE+5FbJeTmfODGmchRExROBBqSFGDh0gGGnF75VOqGbxTUEwGhH5IZQ+KXR3yY4I
 1rea0cxeJL/+eCHqgEpoHc8P0afD6pZ2NiDaGvzeuOPZHjbtgQ3gMkFXH3zU7bHTGzFk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rdKxCUBOIxglP7jUcdgwRYgrxNxTy+C/jBvEw5SQMsI=; b=ThXMHz/4UoBdob/Gt2Q4vEofuk
 fYAj9bGfAuwlVXitu2RD/e9+xTsP2GnFcRVSU8JAE2+MD7R15kr7570+g9tcEGqP7K3p63C1s5LCK
 +i1Y6iYt4Fd4dBIQrzLvy1fR59wJOF9qGTAQ2yrZWrPFGIY2ajiKfAj2MWekUKqDAxUQ=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rIO3z-0002aI-J1 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 Dec 2023 07:10:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id AD562B80BE8;
 Wed, 27 Dec 2023 07:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5224CC433C8;
 Wed, 27 Dec 2023 07:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703661039;
 bh=j/vrVg0JXSm76eMraSC0QENbVnPO+PnML1tSAEZdzD0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PEoX05FN2o6lEct5iERitcxpJm9Lu98BR3utOR/LjGPse01HaKf8G0YXKWd3W/u4b
 fHSkn4C5UovfU5dtwx6NjNNi7T2Te6EgLxavjPwuyGdqOy+z2HulETanC+WMhvehwA
 gOzSrZGAOqOoZST11Xn2GacRIKBnAoZxRTvy9xtnJEOGnQHwE/6mZOOGoqK5IQS+Un
 yD8bKU/XY726TseeWONmbmAT9ldofOkaGM0IR+sRRCW2JnyZxJBYQixvqjJUQVH9Oq
 5C7IxSWTAkobJkW2vuZJqCh88AL2RT5Y9T5lHl4E1nWaICLOJMjXeDT3M9b13YdsRg
 LigVSpG4aWqBA==
Message-ID: <cb85b619-e39a-4782-95f8-b20764fc1022@kernel.org>
Date: Wed, 27 Dec 2023 15:10:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Eric Biggers <ebiggers@kernel.org>, linux-fsdevel@vger.kernel.org
References: <20231213040018.73803-1-ebiggers@kernel.org>
 <20231213040018.73803-3-ebiggers@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20231213040018.73803-3-ebiggers@kernel.org>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/12/13 12:00, Eric Biggers wrote: > From: Eric Biggers
 <ebiggers@google.com> > > Call destroy_device_list() and free the f2fs_sb_info
 from > kill_f2fs_super(), after the call to kill_block_supe [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rIO3z-0002aI-J1
Subject: Re: [f2fs-dev] [PATCH 2/3] f2fs: move release of block devices to
 after kill_block_super()
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
Cc: linux-fscrypt@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org,
 Josef Bacik <josef@toxicpanda.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/12/13 12:00, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Call destroy_device_list() and free the f2fs_sb_info from
> kill_f2fs_super(), after the call to kill_block_super().  This is
> necessary to order it after the call to fscrypt_destroy_keyring() once
> generic_shutdown_super() starts calling fscrypt_destroy_keyring() just
> after calling ->put_super.  This is because fscrypt_destroy_keyring()
> may call into f2fs_get_devices() via the fscrypt_operations.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>   fs/f2fs/super.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 033af907c3b1d..ba95a341a9a36 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1710,42 +1710,39 @@ static void f2fs_put_super(struct super_block *sb)
>   	f2fs_destroy_node_manager(sbi);
>   	f2fs_destroy_segment_manager(sbi);
>   
>   	/* flush s_error_work before sbi destroy */
>   	flush_work(&sbi->s_error_work);
>   
>   	f2fs_destroy_post_read_wq(sbi);
>   
>   	kvfree(sbi->ckpt);
>   
> -	sb->s_fs_info = NULL;
>   	if (sbi->s_chksum_driver)
>   		crypto_free_shash(sbi->s_chksum_driver);
>   	kfree(sbi->raw_super);
>   
> -	destroy_device_list(sbi);
>   	f2fs_destroy_page_array_cache(sbi);
>   	f2fs_destroy_xattr_caches(sbi);
>   	mempool_destroy(sbi->write_io_dummy);
>   #ifdef CONFIG_QUOTA
>   	for (i = 0; i < MAXQUOTAS; i++)
>   		kfree(F2FS_OPTION(sbi).s_qf_names[i]);
>   #endif
>   	fscrypt_free_dummy_policy(&F2FS_OPTION(sbi).dummy_enc_policy);
>   	destroy_percpu_info(sbi);
>   	f2fs_destroy_iostat(sbi);
>   	for (i = 0; i < NR_PAGE_TYPE; i++)
>   		kvfree(sbi->write_io[i]);
>   #if IS_ENABLED(CONFIG_UNICODE)
>   	utf8_unload(sb->s_encoding);
>   #endif
> -	kfree(sbi);
>   }
>   
>   int f2fs_sync_fs(struct super_block *sb, int sync)
>   {
>   	struct f2fs_sb_info *sbi = F2FS_SB(sb);
>   	int err = 0;
>   
>   	if (unlikely(f2fs_cp_error(sbi)))
>   		return 0;
>   	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
> @@ -4895,23 +4892,23 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>   }
>   
>   static struct dentry *f2fs_mount(struct file_system_type *fs_type, int flags,
>   			const char *dev_name, void *data)
>   {
>   	return mount_bdev(fs_type, flags, dev_name, data, f2fs_fill_super);
>   }
>   
>   static void kill_f2fs_super(struct super_block *sb)
>   {
> -	if (sb->s_root) {
> -		struct f2fs_sb_info *sbi = F2FS_SB(sb);
> +	struct f2fs_sb_info *sbi = F2FS_SB(sb);
>   
> +	if (sb->s_root) {
>   		set_sbi_flag(sbi, SBI_IS_CLOSE);
>   		f2fs_stop_gc_thread(sbi);
>   		f2fs_stop_discard_thread(sbi);
>   
>   #ifdef CONFIG_F2FS_FS_COMPRESSION
>   		/*
>   		 * latter evict_inode() can bypass checking and invalidating
>   		 * compress inode cache.
>   		 */
>   		if (test_opt(sbi, COMPRESS_CACHE))
> @@ -4924,20 +4921,25 @@ static void kill_f2fs_super(struct super_block *sb)
>   				.reason = CP_UMOUNT,
>   			};
>   			stat_inc_cp_call_count(sbi, TOTAL_CALL);
>   			f2fs_write_checkpoint(sbi, &cpc);
>   		}
>   
>   		if (is_sbi_flag_set(sbi, SBI_IS_RECOVERED) && f2fs_readonly(sb))
>   			sb->s_flags &= ~SB_RDONLY;
>   	}
>   	kill_block_super(sb);
> +	if (sbi) {

Can you please add one single line comment here to expand why we
need to delay destroying device_list?

Other code part looks good to me.

Thanks,

> +		destroy_device_list(sbi);
> +		kfree(sbi);
> +		sb->s_fs_info = NULL;
> +	}
>   }
>   
>   static struct file_system_type f2fs_fs_type = {
>   	.owner		= THIS_MODULE,
>   	.name		= "f2fs",
>   	.mount		= f2fs_mount,
>   	.kill_sb	= kill_f2fs_super,
>   	.fs_flags	= FS_REQUIRES_DEV | FS_ALLOW_IDMAP,
>   };
>   MODULE_ALIAS_FS("f2fs");


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
