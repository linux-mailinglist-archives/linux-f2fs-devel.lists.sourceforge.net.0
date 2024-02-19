Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7931C859CB4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Feb 2024 08:19:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rbxvr-0005H9-JW;
	Mon, 19 Feb 2024 07:19:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rbxvm-0005H2-GP
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Feb 2024 07:19:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7+8koXOhA1BxfRLWCGX8EcP/4OtI+ZUU6ZrygpC78eI=; b=JChEGeswnagFNpJeZgwRxl3q32
 +YmhsQD9bNfPUukBgJ8f5QbGyylT6o0Tw+B8tL15JiOyfQQ1zbS6eWqfZdOy2Igg5nk7GTE97AOyZ
 Y5zAFrPlFdIkoffr1Pq3Jndzc4/oB/B9S+bU9VLzTGH1TRzxjgNKlCkMlUpUc/X5kdV8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7+8koXOhA1BxfRLWCGX8EcP/4OtI+ZUU6ZrygpC78eI=; b=HC8XnUjBF7qX74ukVBqDgFC5PM
 rs0MER7lAhre4wERawDL8kG7YhPbd7CoeO97iMRwIbw23tJeX6nXyJSd6afNOdAyAiext+X3/51VD
 TIJbTi3HjBbhqGcNre9/wb+Eb4jS33PkBoaOLKee6HT7DV58Cgn6VYMmjAw1wxmtAdw0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rbxvk-0007It-UL for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Feb 2024 07:19:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DB38060C11;
 Mon, 19 Feb 2024 07:19:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E0FDC433F1;
 Mon, 19 Feb 2024 07:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708327148;
 bh=H/LvVtNLbX7Glwkxq0tYV6X0XZq4RSQbYoC8dTerJNI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FNpPeAg+cF8+1q4yw+Awwp75FsBkjyv8hc8WZmmUBUE8uhVrruY69sGZfcQ2b/6D6
 iqu3qP5W5Gg8XNOcqydNIf2cF6VXoD42MKh3e7O5qL/jH+Crkg58Q7VdNIyr9oJWUt
 N3M/wrMEYcRgaYiAjsjTVdKYYdesqpBLt14Hp2nPCk4cnQcnF0P3fDF694YtiGgTWG
 L22An/T9kHdOSlziRlnCXzCxm2xJufEhZWn9xg2Q+WYHE+1YFO/HNN9WcT7fv1nUmJ
 dJomfnTVJOWnAZuRmOg+Vt4g1mGUTJU72UrenbxmGT4qMnsidQU3DtJ9Ui0cSuESdn
 OqQkutjCYUkmA==
Message-ID: <ae43ed8a-49b5-44bf-8fea-a222091e9790@kernel.org>
Date: Mon, 19 Feb 2024 15:19:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: jaegeuk@kernel.org
References: <20240111081743.2999210-1-chao@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240111081743.2999210-1-chao@kernel.org>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Jaegeuk, Any comments? On 2024/1/11 16:17, Chao Yu wrote:
 > We may trigger high frequent checkpoint for below case: > 1. mkdir /mnt/dir1;
 set dir1 encrypted > 2. touch /mnt/file1; fsync /mnt/file1 > 3. mkdir /mnt/dir2;
 set [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rbxvk-0007It-UL
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: reduce expensive checkpoint trigger
 frequency
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
Cc: Zhiguo Niu <zhiguo.niu@unisoc.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Jaegeuk,

Any comments?

On 2024/1/11 16:17, Chao Yu wrote:
> We may trigger high frequent checkpoint for below case:
> 1. mkdir /mnt/dir1; set dir1 encrypted
> 2. touch /mnt/file1; fsync /mnt/file1
> 3. mkdir /mnt/dir2; set dir2 encrypted
> 4. touch /mnt/file2; fsync /mnt/file2
> ...
> 
> Although, newly created dir and file are not related, due to
> commit bbf156f7afa7 ("f2fs: fix lost xattrs of directories"), we will
> trigger checkpoint whenever fsync() comes after a new encrypted dir
> created.
> 
> In order to avoid such condition, let's record an entry including
> directory's ino into global cache when we initialize encryption policy
> in a checkpointed directory, and then only trigger checkpoint() when
> target file's parent has non-persisted encryption policy, for the case
> its parent is not checkpointed, need_do_checkpoint() has cover that
> by verifying it with f2fs_is_checkpointed_node().
> 
> Reported-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> Tested-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> Reported-by: Yunlei He <heyunlei@hihonor.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v3:
> - Recently, Zhiguo Niu reported the same issue, so I repost this
> patch for comments.
>   fs/f2fs/f2fs.h              |  2 ++
>   fs/f2fs/file.c              |  3 +++
>   fs/f2fs/xattr.c             | 16 ++++++++++++++--
>   include/trace/events/f2fs.h |  3 ++-
>   4 files changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index e2e0ca45f881..0094a8c85f4a 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -279,6 +279,7 @@ enum {
>   	APPEND_INO,		/* for append ino list */
>   	UPDATE_INO,		/* for update ino list */
>   	TRANS_DIR_INO,		/* for transactions dir ino list */
> +	ENC_DIR_INO,		/* for encrypted dir ino list */
>   	FLUSH_INO,		/* for multiple device flushing */
>   	MAX_INO_ENTRY,		/* max. list */
>   };
> @@ -1147,6 +1148,7 @@ enum cp_reason_type {
>   	CP_FASTBOOT_MODE,
>   	CP_SPEC_LOG_NUM,
>   	CP_RECOVER_DIR,
> +	CP_ENC_DIR,
>   };
>   
>   enum iostat_type {
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 8198afb5fb9c..18b33b1f0c83 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -218,6 +218,9 @@ static inline enum cp_reason_type need_do_checkpoint(struct inode *inode)
>   		f2fs_exist_written_data(sbi, F2FS_I(inode)->i_pino,
>   							TRANS_DIR_INO))
>   		cp_reason = CP_RECOVER_DIR;
> +	else if (f2fs_exist_written_data(sbi, F2FS_I(inode)->i_pino,
> +							ENC_DIR_INO))
> +		cp_reason = CP_ENC_DIR;
>   
>   	return cp_reason;
>   }
> diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
> index f290fe9327c4..cbd1b88297fe 100644
> --- a/fs/f2fs/xattr.c
> +++ b/fs/f2fs/xattr.c
> @@ -629,6 +629,7 @@ static int __f2fs_setxattr(struct inode *inode, int index,
>   			const char *name, const void *value, size_t size,
>   			struct page *ipage, int flags)
>   {
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>   	struct f2fs_xattr_entry *here, *last;
>   	void *base_addr, *last_base_addr;
>   	int found, newsize;
> @@ -772,8 +773,19 @@ static int __f2fs_setxattr(struct inode *inode, int index,
>   	if (index == F2FS_XATTR_INDEX_ENCRYPTION &&
>   			!strcmp(name, F2FS_XATTR_NAME_ENCRYPTION_CONTEXT))
>   		f2fs_set_encrypted_inode(inode);
> -	if (S_ISDIR(inode->i_mode))
> -		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_CP);
> +
> +	if (S_ISDIR(inode->i_mode)) {
> +		/*
> +		 * In restrict mode, fsync() always tries triggering checkpoint
> +		 * for all metadata consistency, in other mode, it only triggers
> +		 * checkpoint when parent's encryption metadata updates.
> +		 */
> +		if (F2FS_OPTION(sbi).fsync_mode == FSYNC_MODE_STRICT)
> +			set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_CP);
> +		else if (IS_ENCRYPTED(inode) &&
> +			f2fs_is_checkpointed_node(sbi, inode->i_ino))
> +			f2fs_add_ino_entry(sbi, inode->i_ino, ENC_DIR_INO);
> +	}
>   
>   same:
>   	if (is_inode_flag_set(inode, FI_ACL_MODE)) {
> diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
> index 7ed0fc430dc6..48f2e399e184 100644
> --- a/include/trace/events/f2fs.h
> +++ b/include/trace/events/f2fs.h
> @@ -139,7 +139,8 @@ TRACE_DEFINE_ENUM(EX_BLOCK_AGE);
>   		{ CP_NODE_NEED_CP,	"node needs cp" },		\
>   		{ CP_FASTBOOT_MODE,	"fastboot mode" },		\
>   		{ CP_SPEC_LOG_NUM,	"log type is 2" },		\
> -		{ CP_RECOVER_DIR,	"dir needs recovery" })
> +		{ CP_RECOVER_DIR,	"dir needs recovery" },		\
> +		{ CP_ENC_DIR,		"persist encryption policy" })
>   
>   #define show_shutdown_mode(type)					\
>   	__print_symbolic(type,						\


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
