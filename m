Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 399159BB9A7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Nov 2024 16:59:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t7zU1-0007Yo-RT;
	Mon, 04 Nov 2024 15:59:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1t7zU0-0007Yi-Ip
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Nov 2024 15:59:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pJptDhYhT0sFPxBpBJU9AGO646gsVtKnaZPvasjTwGo=; b=ltKbOEQM7/GjoUasF6VvTo2Ri6
 pULGmuW91kM8n6jXuYwSdFIrtIVthL467n0WX7b2TkQT6VAsmZ2n26dJpuj/IOiNh3LKovLorCyc1
 KjjIpOcy18iN1AuxXPYxC6TmgJL9P/CgTYtODnmGLXSCFesPpmtwns65EoawrsTXxCrQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pJptDhYhT0sFPxBpBJU9AGO646gsVtKnaZPvasjTwGo=; b=fde3ZDNnIi/3wG4A5bvgvDdnCl
 RcnWPkAZC4QsT0h0QKltoIceTuMNXY44Ljhz34bW45+D8aSI6sxkXX47rUYl7lGeHmQ3hX3/+4IWl
 V+OU6e3QnXqvqZ6FSTHdG2xMyEatnULJBOa3R1beEfjVwo7r7BTeHhMZM5VF6USHj4PE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t7zU0-0003JH-D2 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Nov 2024 15:59:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2228C5C10E0;
 Mon,  4 Nov 2024 15:58:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93956C4CECE;
 Mon,  4 Nov 2024 15:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730735941;
 bh=nfbYyjxKn/6I7KeeEZRpVU1jWeaAip9FWL9OkYwgvck=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L+r634Erl+WncXlEz4rsmMXCY8pHbVcHBzX48fyrMeKPL0TKRWGO+wiqFNNk2+bG3
 +EpXJQRdYvygLy9/3ELIAb/8ofnXplEM6wi31doRQhPpma9mFRpzKmtc8jteqnIuuQ
 y2hUCBnfM2JitLA7URtD/EpPbu2C3HrK6XK+ZsPGzQczgr5Ywo4JZ4LkH1xj3Rlsvd
 cnObx/9CHx2OljMMP4/ygK8PuiYs7OjnWWXkoHfXClw6C6fM35CEVlbxx3SdrDa+kG
 mKkn8iOJFfd3EOnWuF6R5QB2V6M0bDB2CQXbwqP5lD5+gYZVgejmFCy0JGPvPxHlu1
 YJOPQwrbsGUyg==
Date: Mon, 4 Nov 2024 07:59:00 -0800
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20241104155900.GH21832@frogsfrogsfrogs>
References: <20241103223154.136127-1-ebiggers@kernel.org>
 <20241103223154.136127-16-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241103223154.136127-16-ebiggers@kernel.org>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Nov 03, 2024 at 02:31:51PM -0800, Eric Biggers wrote:
 > From: Eric Biggers <ebiggers@google.com> > > Now that the crc32c() library
 function directly takes advantage of > architecture-specific [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t7zU0-0003JH-D2
Subject: Re: [f2fs-dev] [PATCH v3 15/18] ext4: switch to using the crc32c
 library
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
From: "Darrick J. Wong via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Darrick J. Wong" <djwong@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-mips@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-ext4@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Nov 03, 2024 at 02:31:51PM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Now that the crc32c() library function directly takes advantage of
> architecture-specific optimizations, it is unnecessary to go through the
> crypto API.  Just use crc32c().  This is much simpler, and it improves
> performance due to eliminating the crypto API overhead.
> 
> Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/ext4/Kconfig |  3 +--
>  fs/ext4/ext4.h  | 25 +++----------------------
>  fs/ext4/super.c | 15 ---------------
>  3 files changed, 4 insertions(+), 39 deletions(-)
> 
> diff --git a/fs/ext4/Kconfig b/fs/ext4/Kconfig
> index e20d59221fc0..c9ca41d91a6c 100644
> --- a/fs/ext4/Kconfig
> +++ b/fs/ext4/Kconfig
> @@ -29,12 +29,11 @@ config EXT3_FS_SECURITY
>  config EXT4_FS
>  	tristate "The Extended 4 (ext4) filesystem"
>  	select BUFFER_HEAD
>  	select JBD2
>  	select CRC16
> -	select CRYPTO
> -	select CRYPTO_CRC32C
> +	select CRC32

Hmm.  Looking at your git branch (which was quite helpful to link to!) I
think for XFS we don't need to change the crc32c() calls, and the only
porting work that needs to be done is mirroring this Kconfig change?
And that doesn't even need to be done until someone wants to get rid of
CONFIG_LIBCRC32C, right?

>  	select FS_IOMAP
>  	select FS_ENCRYPTION_ALGS if FS_ENCRYPTION
>  	help
>  	  This is the next generation of the ext3 filesystem.
>  
> diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
> index 44b0d418143c..99aa512a7de1 100644
> --- a/fs/ext4/ext4.h
> +++ b/fs/ext4/ext4.h
> @@ -31,11 +31,11 @@
>  #include <linux/wait.h>
>  #include <linux/sched/signal.h>
>  #include <linux/blockgroup_lock.h>
>  #include <linux/percpu_counter.h>
>  #include <linux/ratelimit.h>
> -#include <crypto/hash.h>
> +#include <linux/crc32c.h>
>  #include <linux/falloc.h>
>  #include <linux/percpu-rwsem.h>
>  #include <linux/fiemap.h>
>  #ifdef __KERNEL__
>  #include <linux/compat.h>
> @@ -1660,13 +1660,10 @@ struct ext4_sb_info {
>  	struct task_struct *s_mmp_tsk;
>  
>  	/* record the last minlen when FITRIM is called. */
>  	unsigned long s_last_trim_minblks;
>  
> -	/* Reference to checksum algorithm driver via cryptoapi */
> -	struct crypto_shash *s_chksum_driver;
> -
>  	/* Precomputed FS UUID checksum for seeding other checksums */
>  	__u32 s_csum_seed;
>  
>  	/* Reclaim extents from extent status tree */
>  	struct shrinker *s_es_shrinker;
> @@ -2465,23 +2462,11 @@ static inline __le16 ext4_rec_len_to_disk(unsigned len, unsigned blocksize)
>  #define DX_HASH_LAST 			DX_HASH_SIPHASH
>  
>  static inline u32 ext4_chksum(struct ext4_sb_info *sbi, u32 crc,
>  			      const void *address, unsigned int length)
>  {
> -	struct {
> -		struct shash_desc shash;
> -		char ctx[4];
> -	} desc;
> -
> -	BUG_ON(crypto_shash_descsize(sbi->s_chksum_driver)!=sizeof(desc.ctx));
> -
> -	desc.shash.tfm = sbi->s_chksum_driver;
> -	*(u32 *)desc.ctx = crc;
> -
> -	BUG_ON(crypto_shash_update(&desc.shash, address, length));
> -
> -	return *(u32 *)desc.ctx;
> +	return crc32c(crc, address, length);
>  }
>  
>  #ifdef __KERNEL__
>  
>  /* hash info structure used by the directory hash */
> @@ -3278,15 +3263,11 @@ extern void ext4_group_desc_csum_set(struct super_block *sb, __u32 group,
>  extern int ext4_register_li_request(struct super_block *sb,
>  				    ext4_group_t first_not_zeroed);
>  
>  static inline int ext4_has_metadata_csum(struct super_block *sb)
>  {
> -	WARN_ON_ONCE(ext4_has_feature_metadata_csum(sb) &&
> -		     !EXT4_SB(sb)->s_chksum_driver);
> -
> -	return ext4_has_feature_metadata_csum(sb) &&
> -	       (EXT4_SB(sb)->s_chksum_driver != NULL);
> +	return ext4_has_feature_metadata_csum(sb);
>  }

Nit: Someone might want to
s/ext4_has_metadata_csum/ext4_has_feature_metadata_csum/ here to get rid
of the confusingly named trivial helper.

Otherwise this logic looks ok to me, so
Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D


>  
>  static inline int ext4_has_group_desc_csum(struct super_block *sb)
>  {
>  	return ext4_has_feature_gdt_csum(sb) || ext4_has_metadata_csum(sb);
> diff --git a/fs/ext4/super.c b/fs/ext4/super.c
> index 16a4ce704460..1a821093cc0d 100644
> --- a/fs/ext4/super.c
> +++ b/fs/ext4/super.c
> @@ -1371,12 +1371,10 @@ static void ext4_put_super(struct super_block *sb)
>  	 * Now that we are completely done shutting down the
>  	 * superblock, we need to actually destroy the kobject.
>  	 */
>  	kobject_put(&sbi->s_kobj);
>  	wait_for_completion(&sbi->s_kobj_unregister);
> -	if (sbi->s_chksum_driver)
> -		crypto_free_shash(sbi->s_chksum_driver);
>  	kfree(sbi->s_blockgroup_lock);
>  	fs_put_dax(sbi->s_daxdev, NULL);
>  	fscrypt_free_dummy_policy(&sbi->s_dummy_enc_policy);
>  #if IS_ENABLED(CONFIG_UNICODE)
>  	utf8_unload(sb->s_encoding);
> @@ -4586,19 +4584,10 @@ static int ext4_init_metadata_csum(struct super_block *sb, struct ext4_super_blo
>  		return -EINVAL;
>  	}
>  	ext4_setup_csum_trigger(sb, EXT4_JTR_ORPHAN_FILE,
>  				ext4_orphan_file_block_trigger);
>  
> -	/* Load the checksum driver */
> -	sbi->s_chksum_driver = crypto_alloc_shash("crc32c", 0, 0);
> -	if (IS_ERR(sbi->s_chksum_driver)) {
> -		int ret = PTR_ERR(sbi->s_chksum_driver);
> -		ext4_msg(sb, KERN_ERR, "Cannot load crc32c driver.");
> -		sbi->s_chksum_driver = NULL;
> -		return ret;
> -	}
> -
>  	/* Check superblock checksum */
>  	if (!ext4_superblock_csum_verify(sb, es)) {
>  		ext4_msg(sb, KERN_ERR, "VFS: Found ext4 filesystem with "
>  			 "invalid superblock checksum.  Run e2fsck?");
>  		return -EFSBADCRC;
> @@ -5638,13 +5627,10 @@ failed_mount8: __maybe_unused
>  	flush_work(&sbi->s_sb_upd_work);
>  	ext4_stop_mmpd(sbi);
>  	del_timer_sync(&sbi->s_err_report);
>  	ext4_group_desc_free(sbi);
>  failed_mount:
> -	if (sbi->s_chksum_driver)
> -		crypto_free_shash(sbi->s_chksum_driver);
> -
>  #if IS_ENABLED(CONFIG_UNICODE)
>  	utf8_unload(sb->s_encoding);
>  #endif
>  
>  #ifdef CONFIG_QUOTA
> @@ -7433,8 +7419,7 @@ static void __exit ext4_exit_fs(void)
>  }
>  
>  MODULE_AUTHOR("Remy Card, Stephen Tweedie, Andrew Morton, Andreas Dilger, Theodore Ts'o and others");
>  MODULE_DESCRIPTION("Fourth Extended Filesystem");
>  MODULE_LICENSE("GPL");
> -MODULE_SOFTDEP("pre: crc32c");
>  module_init(ext4_init_fs)
>  module_exit(ext4_exit_fs)
> -- 
> 2.47.0
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
