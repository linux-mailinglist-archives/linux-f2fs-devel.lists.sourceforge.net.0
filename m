Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EB170A983
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 20 May 2023 19:42:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q0QbA-00072A-AS;
	Sat, 20 May 2023 17:42:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ardb@kernel.org>) id 1q0Qb2-00071w-9b
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 20 May 2023 17:42:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pIAUVA0VxIsX8MEF8HOxnK3jPVPiKvfyeEw9L0RpJMc=; b=kDe8ncQhATEJFLAAFB81PcNpEM
 IyGNoH4Jx8rUllpohLAgRWS/mGegv9huIeHYWPVNhmZAYswA+QbTdb7pWnH/Z8wn2at3EOD1dqHkQ
 UdxBS9OrG9SN1JkC27cdoXgjzXm3S/x3LMZEhXgeqcgHjtzg4nVP2EoyTXpglZcy/wh8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pIAUVA0VxIsX8MEF8HOxnK3jPVPiKvfyeEw9L0RpJMc=; b=OY/DX+Yb8WOqRuHi84ggJmV4WE
 Xw3+i2Al5yWqOdGdA3DrdLxgBZ8AiX2ClNIO4Vif7aB9veTB77mL2dkyquZgCQ88+yaelyMQ5B0Fc
 Brc2bGuv8jroXqe3hJh+Oyk0lgLCcFRYjQZ934biR0bxgJGu/iaelF5WM4HJd9apC6BY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q0Qas-0006Ov-6F for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 20 May 2023 17:42:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 833C860AB0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 20 May 2023 17:42:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC702C433EF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 20 May 2023 17:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684604527;
 bh=JGfM93X3bKEj3G7xAwRufiZEckAGP9ehjtNp152KkOM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bClaPq+o0aCCZxrxZ3oovpChXzMbWZMJIqUfkbHo7MKzXOp5XCgrqlnkRTJrNx23X
 i6JzcfXEJpDK1yp4WdsKUnmvsCHuRKz7chdrfp4TYVi6y0JkSIlqxJZPVmnsNqB3YJ
 Z0ppocQldJbQEHMqSJGVcxOdt3aXy8OKsPa9WDEuons/sv8sthvHMFK+aj+T47gS01
 h87kc9HNOvI+QcmZPmPpYN8r5UHrVwCXjfW30yHcJ2Zam+S9tqSRZAasVftI22nCX+
 STAyf3d8VxqntWhY4LN8PS+kmuRaxA18SOGPgsJClzectu9SkMzXFjZRyX7gc6QM0T
 Z4a9Olqgk8hiw==
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-4f3b5881734so934941e87.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 20 May 2023 10:42:07 -0700 (PDT)
X-Gm-Message-State: AC+VfDxhrJhaoZ+JOsJGdUQ/0qMR/hJmPkfxt3Sk9lYITW2kZBt5XMWL
 OpgdN2mY8D8qY9d9vsCzEtF2KQLv1xfhCDcGtV4=
X-Google-Smtp-Source: ACHHUZ6ct/SjMRMI2Mgxj32OZrj1qOU2rfgc2ovLgRQ7nSSBLoeNABECpxEbzbUE4dUgSnECCdF/IEKD+zNviTTzRrk=
X-Received: by 2002:a19:7413:0:b0:4f3:a99f:1ea7 with SMTP id
 v19-20020a197413000000b004f3a99f1ea7mr2090231lfe.55.1684604525453; Sat, 20
 May 2023 10:42:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230516052306.99600-1-ebiggers@kernel.org>
In-Reply-To: <20230516052306.99600-1-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 20 May 2023 19:41:53 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFKsCOZ5ca+BcuVAfTbNN7Epk1+ya9rmf=FME+-aCAY7A@mail.gmail.com>
Message-ID: <CAMj1kXFKsCOZ5ca+BcuVAfTbNN7Epk1+ya9rmf=FME+-aCAY7A@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, 16 May 2023 at 07:24,
 Eric Biggers <ebiggers@kernel.org>
 wrote: > > From: Eric Biggers <ebiggers@google.com> > > The "ahash" API,
 like the other scatterlist-based crypto APIs such as > "skciph [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q0Qas-0006Ov-6F
Subject: Re: [f2fs-dev] [PATCH v2] fsverity: use shash API instead of ahash
 API
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
Cc: fsverity@lists.linux.dev, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, 16 May 2023 at 07:24, Eric Biggers <ebiggers@kernel.org> wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> The "ahash" API, like the other scatterlist-based crypto APIs such as
> "skcipher", comes with some well-known limitations.  First, it can't
> easily be used with vmalloc addresses.  Second, the request struct can't
> be allocated on the stack.  This adds complexity and a possible failure
> point that needs to be worked around, e.g. using a mempool.
>
> The only benefit of ahash over "shash" is that ahash is needed to access
> traditional memory-to-memory crypto accelerators, i.e. drivers/crypto/.
> However, this style of crypto acceleration has largely fallen out of
> favor and been superseded by CPU-based acceleration or inline crypto
> engines.  Also, ahash needs to be used asynchronously to take full
> advantage of such hardware, but fs/verity/ has never done this.
>
> On all systems that aren't actually using one of these ahash-only crypto
> accelerators, ahash just adds unnecessary overhead as it sits between
> the user and the underlying shash algorithms.
>
> Also, XFS is planned to cache fsverity Merkle tree blocks in the
> existing XFS buffer cache.  As a result, it will be possible for a
> single Merkle tree block to be split across discontiguous pages
> (https://lore.kernel.org/r/20230405233753.GU3223426@dread.disaster.area).
> This data will need to be hashed.  It is easiest to work with a vmapped
> address in this case.  However, ahash is incompatible with this.
>
> Therefore, let's convert fs/verity/ from ahash to shash.  This
> simplifies the code, and it should also slightly improve performance for
> everyone who wasn't actually using one of these ahash-only crypto
> accelerators, i.e. almost everyone (or maybe even everyone)!
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

> ---
>
> v2: rebased onto v6.4-rc2.
>
>  fs/verity/enable.c           |  19 ++---
>  fs/verity/fsverity_private.h |  13 +---
>  fs/verity/hash_algs.c        | 131 ++++++-----------------------------
>  fs/verity/verify.c           | 108 +++++++++++------------------
>  4 files changed, 71 insertions(+), 200 deletions(-)
>
> diff --git a/fs/verity/enable.c b/fs/verity/enable.c
> index fc4c50e5219dc..bd86b25ac084b 100644
> --- a/fs/verity/enable.c
> +++ b/fs/verity/enable.c
> @@ -7,6 +7,7 @@
>
>  #include "fsverity_private.h"
>
> +#include <crypto/hash.h>
>  #include <linux/mount.h>
>  #include <linux/sched/signal.h>
>  #include <linux/uaccess.h>
> @@ -20,7 +21,7 @@ struct block_buffer {
>  /* Hash a block, writing the result to the next level's pending block buffer. */
>  static int hash_one_block(struct inode *inode,
>                           const struct merkle_tree_params *params,
> -                         struct ahash_request *req, struct block_buffer *cur)
> +                         struct block_buffer *cur)
>  {
>         struct block_buffer *next = cur + 1;
>         int err;
> @@ -36,8 +37,7 @@ static int hash_one_block(struct inode *inode,
>         /* Zero-pad the block if it's shorter than the block size. */
>         memset(&cur->data[cur->filled], 0, params->block_size - cur->filled);
>
> -       err = fsverity_hash_block(params, inode, req, virt_to_page(cur->data),
> -                                 offset_in_page(cur->data),
> +       err = fsverity_hash_block(params, inode, cur->data,
>                                   &next->data[next->filled]);
>         if (err)
>                 return err;
> @@ -76,7 +76,6 @@ static int build_merkle_tree(struct file *filp,
>         struct inode *inode = file_inode(filp);
>         const u64 data_size = inode->i_size;
>         const int num_levels = params->num_levels;
> -       struct ahash_request *req;
>         struct block_buffer _buffers[1 + FS_VERITY_MAX_LEVELS + 1] = {};
>         struct block_buffer *buffers = &_buffers[1];
>         unsigned long level_offset[FS_VERITY_MAX_LEVELS];
> @@ -90,9 +89,6 @@ static int build_merkle_tree(struct file *filp,
>                 return 0;
>         }
>
> -       /* This allocation never fails, since it's mempool-backed. */
> -       req = fsverity_alloc_hash_request(params->hash_alg, GFP_KERNEL);
> -
>         /*
>          * Allocate the block buffers.  Buffer "-1" is for data blocks.
>          * Buffers 0 <= level < num_levels are for the actual tree levels.
> @@ -130,7 +126,7 @@ static int build_merkle_tree(struct file *filp,
>                         fsverity_err(inode, "Short read of file data");
>                         goto out;
>                 }
> -               err = hash_one_block(inode, params, req, &buffers[-1]);
> +               err = hash_one_block(inode, params, &buffers[-1]);
>                 if (err)
>                         goto out;
>                 for (level = 0; level < num_levels; level++) {
> @@ -141,8 +137,7 @@ static int build_merkle_tree(struct file *filp,
>                         }
>                         /* Next block at @level is full */
>
> -                       err = hash_one_block(inode, params, req,
> -                                            &buffers[level]);
> +                       err = hash_one_block(inode, params, &buffers[level]);
>                         if (err)
>                                 goto out;
>                         err = write_merkle_tree_block(inode,
> @@ -162,8 +157,7 @@ static int build_merkle_tree(struct file *filp,
>         /* Finish all nonempty pending tree blocks. */
>         for (level = 0; level < num_levels; level++) {
>                 if (buffers[level].filled != 0) {
> -                       err = hash_one_block(inode, params, req,
> -                                            &buffers[level]);
> +                       err = hash_one_block(inode, params, &buffers[level]);
>                         if (err)
>                                 goto out;
>                         err = write_merkle_tree_block(inode,
> @@ -183,7 +177,6 @@ static int build_merkle_tree(struct file *filp,
>  out:
>         for (level = -1; level < num_levels; level++)
>                 kfree(buffers[level].data);
> -       fsverity_free_hash_request(params->hash_alg, req);
>         return err;
>  }
>
> diff --git a/fs/verity/fsverity_private.h b/fs/verity/fsverity_private.h
> index d34dcc033d723..8527beca2a454 100644
> --- a/fs/verity/fsverity_private.h
> +++ b/fs/verity/fsverity_private.h
> @@ -11,9 +11,6 @@
>  #define pr_fmt(fmt) "fs-verity: " fmt
>
>  #include <linux/fsverity.h>
> -#include <linux/mempool.h>
> -
> -struct ahash_request;
>
>  /*
>   * Implementation limit: maximum depth of the Merkle tree.  For now 8 is plenty;
> @@ -23,11 +20,10 @@ struct ahash_request;
>
>  /* A hash algorithm supported by fs-verity */
>  struct fsverity_hash_alg {
> -       struct crypto_ahash *tfm; /* hash tfm, allocated on demand */
> +       struct crypto_shash *tfm; /* hash tfm, allocated on demand */
>         const char *name;         /* crypto API name, e.g. sha256 */
>         unsigned int digest_size; /* digest size in bytes, e.g. 32 for SHA-256 */
>         unsigned int block_size;  /* block size in bytes, e.g. 64 for SHA-256 */
> -       mempool_t req_pool;       /* mempool with a preallocated hash request */
>         /*
>          * The HASH_ALGO_* constant for this algorithm.  This is different from
>          * FS_VERITY_HASH_ALG_*, which uses a different numbering scheme.
> @@ -85,15 +81,10 @@ extern struct fsverity_hash_alg fsverity_hash_algs[];
>
>  struct fsverity_hash_alg *fsverity_get_hash_alg(const struct inode *inode,
>                                                 unsigned int num);
> -struct ahash_request *fsverity_alloc_hash_request(struct fsverity_hash_alg *alg,
> -                                                 gfp_t gfp_flags);
> -void fsverity_free_hash_request(struct fsverity_hash_alg *alg,
> -                               struct ahash_request *req);
>  const u8 *fsverity_prepare_hash_state(struct fsverity_hash_alg *alg,
>                                       const u8 *salt, size_t salt_size);
>  int fsverity_hash_block(const struct merkle_tree_params *params,
> -                       const struct inode *inode, struct ahash_request *req,
> -                       struct page *page, unsigned int offset, u8 *out);
> +                       const struct inode *inode, const void *data, u8 *out);
>  int fsverity_hash_buffer(struct fsverity_hash_alg *alg,
>                          const void *data, size_t size, u8 *out);
>  void __init fsverity_check_hash_algs(void);
> diff --git a/fs/verity/hash_algs.c b/fs/verity/hash_algs.c
> index ea00dbedf756b..e7e982412e23a 100644
> --- a/fs/verity/hash_algs.c
> +++ b/fs/verity/hash_algs.c
> @@ -8,7 +8,6 @@
>  #include "fsverity_private.h"
>
>  #include <crypto/hash.h>
> -#include <linux/scatterlist.h>
>
>  /* The hash algorithms supported by fs-verity */
>  struct fsverity_hash_alg fsverity_hash_algs[] = {
> @@ -44,7 +43,7 @@ struct fsverity_hash_alg *fsverity_get_hash_alg(const struct inode *inode,
>                                                 unsigned int num)
>  {
>         struct fsverity_hash_alg *alg;
> -       struct crypto_ahash *tfm;
> +       struct crypto_shash *tfm;
>         int err;
>
>         if (num >= ARRAY_SIZE(fsverity_hash_algs) ||
> @@ -63,11 +62,7 @@ struct fsverity_hash_alg *fsverity_get_hash_alg(const struct inode *inode,
>         if (alg->tfm != NULL)
>                 goto out_unlock;
>
> -       /*
> -        * Using the shash API would make things a bit simpler, but the ahash
> -        * API is preferable as it allows the use of crypto accelerators.
> -        */
> -       tfm = crypto_alloc_ahash(alg->name, 0, 0);
> +       tfm = crypto_alloc_shash(alg->name, 0, 0);
>         if (IS_ERR(tfm)) {
>                 if (PTR_ERR(tfm) == -ENOENT) {
>                         fsverity_warn(inode,
> @@ -84,68 +79,26 @@ struct fsverity_hash_alg *fsverity_get_hash_alg(const struct inode *inode,
>         }
>
>         err = -EINVAL;
> -       if (WARN_ON_ONCE(alg->digest_size != crypto_ahash_digestsize(tfm)))
> +       if (WARN_ON_ONCE(alg->digest_size != crypto_shash_digestsize(tfm)))
>                 goto err_free_tfm;
> -       if (WARN_ON_ONCE(alg->block_size != crypto_ahash_blocksize(tfm)))
> -               goto err_free_tfm;
> -
> -       err = mempool_init_kmalloc_pool(&alg->req_pool, 1,
> -                                       sizeof(struct ahash_request) +
> -                                       crypto_ahash_reqsize(tfm));
> -       if (err)
> +       if (WARN_ON_ONCE(alg->block_size != crypto_shash_blocksize(tfm)))
>                 goto err_free_tfm;
>
>         pr_info("%s using implementation \"%s\"\n",
> -               alg->name, crypto_ahash_driver_name(tfm));
> +               alg->name, crypto_shash_driver_name(tfm));
>
>         /* pairs with smp_load_acquire() above */
>         smp_store_release(&alg->tfm, tfm);
>         goto out_unlock;
>
>  err_free_tfm:
> -       crypto_free_ahash(tfm);
> +       crypto_free_shash(tfm);
>         alg = ERR_PTR(err);
>  out_unlock:
>         mutex_unlock(&fsverity_hash_alg_init_mutex);
>         return alg;
>  }
>
> -/**
> - * fsverity_alloc_hash_request() - allocate a hash request object
> - * @alg: the hash algorithm for which to allocate the request
> - * @gfp_flags: memory allocation flags
> - *
> - * This is mempool-backed, so this never fails if __GFP_DIRECT_RECLAIM is set in
> - * @gfp_flags.  However, in that case this might need to wait for all
> - * previously-allocated requests to be freed.  So to avoid deadlocks, callers
> - * must never need multiple requests at a time to make forward progress.
> - *
> - * Return: the request object on success; NULL on failure (but see above)
> - */
> -struct ahash_request *fsverity_alloc_hash_request(struct fsverity_hash_alg *alg,
> -                                                 gfp_t gfp_flags)
> -{
> -       struct ahash_request *req = mempool_alloc(&alg->req_pool, gfp_flags);
> -
> -       if (req)
> -               ahash_request_set_tfm(req, alg->tfm);
> -       return req;
> -}
> -
> -/**
> - * fsverity_free_hash_request() - free a hash request object
> - * @alg: the hash algorithm
> - * @req: the hash request object to free
> - */
> -void fsverity_free_hash_request(struct fsverity_hash_alg *alg,
> -                               struct ahash_request *req)
> -{
> -       if (req) {
> -               ahash_request_zero(req);
> -               mempool_free(req, &alg->req_pool);
> -       }
> -}
> -
>  /**
>   * fsverity_prepare_hash_state() - precompute the initial hash state
>   * @alg: hash algorithm
> @@ -159,23 +112,20 @@ const u8 *fsverity_prepare_hash_state(struct fsverity_hash_alg *alg,
>                                       const u8 *salt, size_t salt_size)
>  {
>         u8 *hashstate = NULL;
> -       struct ahash_request *req = NULL;
> +       SHASH_DESC_ON_STACK(desc, alg->tfm);
>         u8 *padded_salt = NULL;
>         size_t padded_salt_size;
> -       struct scatterlist sg;
> -       DECLARE_CRYPTO_WAIT(wait);
>         int err;
>
> +       desc->tfm = alg->tfm;
> +
>         if (salt_size == 0)
>                 return NULL;
>
> -       hashstate = kmalloc(crypto_ahash_statesize(alg->tfm), GFP_KERNEL);
> +       hashstate = kmalloc(crypto_shash_statesize(alg->tfm), GFP_KERNEL);
>         if (!hashstate)
>                 return ERR_PTR(-ENOMEM);
>
> -       /* This allocation never fails, since it's mempool-backed. */
> -       req = fsverity_alloc_hash_request(alg, GFP_KERNEL);
> -
>         /*
>          * Zero-pad the salt to the next multiple of the input size of the hash
>          * algorithm's compression function, e.g. 64 bytes for SHA-256 or 128
> @@ -190,26 +140,18 @@ const u8 *fsverity_prepare_hash_state(struct fsverity_hash_alg *alg,
>                 goto err_free;
>         }
>         memcpy(padded_salt, salt, salt_size);
> -
> -       sg_init_one(&sg, padded_salt, padded_salt_size);
> -       ahash_request_set_callback(req, CRYPTO_TFM_REQ_MAY_SLEEP |
> -                                       CRYPTO_TFM_REQ_MAY_BACKLOG,
> -                                  crypto_req_done, &wait);
> -       ahash_request_set_crypt(req, &sg, NULL, padded_salt_size);
> -
> -       err = crypto_wait_req(crypto_ahash_init(req), &wait);
> +       err = crypto_shash_init(desc);
>         if (err)
>                 goto err_free;
>
> -       err = crypto_wait_req(crypto_ahash_update(req), &wait);
> +       err = crypto_shash_update(desc, padded_salt, padded_salt_size);
>         if (err)
>                 goto err_free;
>
> -       err = crypto_ahash_export(req, hashstate);
> +       err = crypto_shash_export(desc, hashstate);
>         if (err)
>                 goto err_free;
>  out:
> -       fsverity_free_hash_request(alg, req);
>         kfree(padded_salt);
>         return hashstate;
>
> @@ -223,9 +165,7 @@ const u8 *fsverity_prepare_hash_state(struct fsverity_hash_alg *alg,
>   * fsverity_hash_block() - hash a single data or hash block
>   * @params: the Merkle tree's parameters
>   * @inode: inode for which the hashing is being done
> - * @req: preallocated hash request
> - * @page: the page containing the block to hash
> - * @offset: the offset of the block within @page
> + * @data: virtual address of a buffer containing the block to hash
>   * @out: output digest, size 'params->digest_size' bytes
>   *
>   * Hash a single data or hash block.  The hash is salted if a salt is specified
> @@ -234,33 +174,24 @@ const u8 *fsverity_prepare_hash_state(struct fsverity_hash_alg *alg,
>   * Return: 0 on success, -errno on failure
>   */
>  int fsverity_hash_block(const struct merkle_tree_params *params,
> -                       const struct inode *inode, struct ahash_request *req,
> -                       struct page *page, unsigned int offset, u8 *out)
> +                       const struct inode *inode, const void *data, u8 *out)
>  {
> -       struct scatterlist sg;
> -       DECLARE_CRYPTO_WAIT(wait);
> +       SHASH_DESC_ON_STACK(desc, params->hash_alg->tfm);
>         int err;
>
> -       sg_init_table(&sg, 1);
> -       sg_set_page(&sg, page, params->block_size, offset);
> -       ahash_request_set_callback(req, CRYPTO_TFM_REQ_MAY_SLEEP |
> -                                       CRYPTO_TFM_REQ_MAY_BACKLOG,
> -                                  crypto_req_done, &wait);
> -       ahash_request_set_crypt(req, &sg, out, params->block_size);
> +       desc->tfm = params->hash_alg->tfm;
>
>         if (params->hashstate) {
> -               err = crypto_ahash_import(req, params->hashstate);
> +               err = crypto_shash_import(desc, params->hashstate);
>                 if (err) {
>                         fsverity_err(inode,
>                                      "Error %d importing hash state", err);
>                         return err;
>                 }
> -               err = crypto_ahash_finup(req);
> +               err = crypto_shash_finup(desc, data, params->block_size, out);
>         } else {
> -               err = crypto_ahash_digest(req);
> +               err = crypto_shash_digest(desc, data, params->block_size, out);
>         }
> -
> -       err = crypto_wait_req(err, &wait);
>         if (err)
>                 fsverity_err(inode, "Error %d computing block hash", err);
>         return err;
> @@ -273,32 +204,12 @@ int fsverity_hash_block(const struct merkle_tree_params *params,
>   * @size: size of data to hash, in bytes
>   * @out: output digest, size 'alg->digest_size' bytes
>   *
> - * Hash some data which is located in physically contiguous memory (i.e. memory
> - * allocated by kmalloc(), not by vmalloc()).  No salt is used.
> - *
>   * Return: 0 on success, -errno on failure
>   */
>  int fsverity_hash_buffer(struct fsverity_hash_alg *alg,
>                          const void *data, size_t size, u8 *out)
>  {
> -       struct ahash_request *req;
> -       struct scatterlist sg;
> -       DECLARE_CRYPTO_WAIT(wait);
> -       int err;
> -
> -       /* This allocation never fails, since it's mempool-backed. */
> -       req = fsverity_alloc_hash_request(alg, GFP_KERNEL);
> -
> -       sg_init_one(&sg, data, size);
> -       ahash_request_set_callback(req, CRYPTO_TFM_REQ_MAY_SLEEP |
> -                                       CRYPTO_TFM_REQ_MAY_BACKLOG,
> -                                  crypto_req_done, &wait);
> -       ahash_request_set_crypt(req, &sg, out, size);
> -
> -       err = crypto_wait_req(crypto_ahash_digest(req), &wait);
> -
> -       fsverity_free_hash_request(alg, req);
> -       return err;
> +       return crypto_shash_tfm_digest(alg->tfm, data, size, out);
>  }
>
>  void __init fsverity_check_hash_algs(void)
> diff --git a/fs/verity/verify.c b/fs/verity/verify.c
> index e2508222750b3..702500ef1f348 100644
> --- a/fs/verity/verify.c
> +++ b/fs/verity/verify.c
> @@ -29,21 +29,6 @@ static inline int cmp_hashes(const struct fsverity_info *vi,
>         return -EBADMSG;
>  }
>
> -static bool data_is_zeroed(struct inode *inode, struct page *page,
> -                          unsigned int len, unsigned int offset)
> -{
> -       void *virt = kmap_local_page(page);
> -
> -       if (memchr_inv(virt + offset, 0, len)) {
> -               kunmap_local(virt);
> -               fsverity_err(inode,
> -                            "FILE CORRUPTED!  Data past EOF is not zeroed");
> -               return false;
> -       }
> -       kunmap_local(virt);
> -       return true;
> -}
> -
>  /*
>   * Returns true if the hash block with index @hblock_idx in the tree, located in
>   * @hpage, has already been verified.
> @@ -122,9 +107,7 @@ static bool is_hash_block_verified(struct fsverity_info *vi, struct page *hpage,
>   */
>  static bool
>  verify_data_block(struct inode *inode, struct fsverity_info *vi,
> -                 struct ahash_request *req, struct page *data_page,
> -                 u64 data_pos, unsigned int dblock_offset_in_page,
> -                 unsigned long max_ra_pages)
> +                 const void *data, u64 data_pos, unsigned long max_ra_pages)
>  {
>         const struct merkle_tree_params *params = &vi->tree_params;
>         const unsigned int hsize = params->digest_size;
> @@ -136,11 +119,11 @@ verify_data_block(struct inode *inode, struct fsverity_info *vi,
>         struct {
>                 /* Page containing the hash block */
>                 struct page *page;
> +               /* Mapped address of the hash block (will be within @page) */
> +               const void *addr;
>                 /* Index of the hash block in the tree overall */
>                 unsigned long index;
> -               /* Byte offset of the hash block within @page */
> -               unsigned int offset_in_page;
> -               /* Byte offset of the wanted hash within @page */
> +               /* Byte offset of the wanted hash relative to @addr */
>                 unsigned int hoffset;
>         } hblocks[FS_VERITY_MAX_LEVELS];
>         /*
> @@ -150,6 +133,9 @@ verify_data_block(struct inode *inode, struct fsverity_info *vi,
>         u64 hidx = data_pos >> params->log_blocksize;
>         int err;
>
> +       /* Up to 1 + FS_VERITY_MAX_LEVELS pages may be mapped at once */
> +       BUILD_BUG_ON(1 + FS_VERITY_MAX_LEVELS > KM_MAX_IDX);
> +
>         if (unlikely(data_pos >= inode->i_size)) {
>                 /*
>                  * This can happen in the data page spanning EOF when the Merkle
> @@ -159,8 +145,12 @@ verify_data_block(struct inode *inode, struct fsverity_info *vi,
>                  * any part past EOF should be all zeroes.  Therefore, we need
>                  * to verify that any data blocks fully past EOF are all zeroes.
>                  */
> -               return data_is_zeroed(inode, data_page, params->block_size,
> -                                     dblock_offset_in_page);
> +               if (memchr_inv(data, 0, params->block_size)) {
> +                       fsverity_err(inode,
> +                                    "FILE CORRUPTED!  Data past EOF is not zeroed");
> +                       return false;
> +               }
> +               return true;
>         }
>
>         /*
> @@ -175,6 +165,7 @@ verify_data_block(struct inode *inode, struct fsverity_info *vi,
>                 unsigned int hblock_offset_in_page;
>                 unsigned int hoffset;
>                 struct page *hpage;
> +               const void *haddr;
>
>                 /*
>                  * The index of the block in the current level; also the index
> @@ -192,10 +183,9 @@ verify_data_block(struct inode *inode, struct fsverity_info *vi,
>                 hblock_offset_in_page =
>                         (hblock_idx << params->log_blocksize) & ~PAGE_MASK;
>
> -               /* Byte offset of the hash within the page */
> -               hoffset = hblock_offset_in_page +
> -                         ((hidx << params->log_digestsize) &
> -                          (params->block_size - 1));
> +               /* Byte offset of the hash within the block */
> +               hoffset = (hidx << params->log_digestsize) &
> +                         (params->block_size - 1);
>
>                 hpage = inode->i_sb->s_vop->read_merkle_tree_page(inode,
>                                 hpage_idx, level == 0 ? min(max_ra_pages,
> @@ -207,15 +197,17 @@ verify_data_block(struct inode *inode, struct fsverity_info *vi,
>                                      err, hpage_idx);
>                         goto out;
>                 }
> +               haddr = kmap_local_page(hpage) + hblock_offset_in_page;
>                 if (is_hash_block_verified(vi, hpage, hblock_idx)) {
> -                       memcpy_from_page(_want_hash, hpage, hoffset, hsize);
> +                       memcpy(_want_hash, haddr + hoffset, hsize);
>                         want_hash = _want_hash;
> +                       kunmap_local(haddr);
>                         put_page(hpage);
>                         goto descend;
>                 }
>                 hblocks[level].page = hpage;
> +               hblocks[level].addr = haddr;
>                 hblocks[level].index = hblock_idx;
> -               hblocks[level].offset_in_page = hblock_offset_in_page;
>                 hblocks[level].hoffset = hoffset;
>                 hidx = next_hidx;
>         }
> @@ -225,13 +217,11 @@ verify_data_block(struct inode *inode, struct fsverity_info *vi,
>         /* Descend the tree verifying hash blocks. */
>         for (; level > 0; level--) {
>                 struct page *hpage = hblocks[level - 1].page;
> +               const void *haddr = hblocks[level - 1].addr;
>                 unsigned long hblock_idx = hblocks[level - 1].index;
> -               unsigned int hblock_offset_in_page =
> -                       hblocks[level - 1].offset_in_page;
>                 unsigned int hoffset = hblocks[level - 1].hoffset;
>
> -               err = fsverity_hash_block(params, inode, req, hpage,
> -                                         hblock_offset_in_page, real_hash);
> +               err = fsverity_hash_block(params, inode, haddr, real_hash);
>                 if (err)
>                         goto out;
>                 err = cmp_hashes(vi, want_hash, real_hash, data_pos, level - 1);
> @@ -246,29 +236,30 @@ verify_data_block(struct inode *inode, struct fsverity_info *vi,
>                         set_bit(hblock_idx, vi->hash_block_verified);
>                 else
>                         SetPageChecked(hpage);
> -               memcpy_from_page(_want_hash, hpage, hoffset, hsize);
> +               memcpy(_want_hash, haddr + hoffset, hsize);
>                 want_hash = _want_hash;
> +               kunmap_local(haddr);
>                 put_page(hpage);
>         }
>
>         /* Finally, verify the data block. */
> -       err = fsverity_hash_block(params, inode, req, data_page,
> -                                 dblock_offset_in_page, real_hash);
> +       err = fsverity_hash_block(params, inode, data, real_hash);
>         if (err)
>                 goto out;
>         err = cmp_hashes(vi, want_hash, real_hash, data_pos, -1);
>  out:
> -       for (; level > 0; level--)
> +       for (; level > 0; level--) {
> +               kunmap_local(hblocks[level - 1].addr);
>                 put_page(hblocks[level - 1].page);
> -
> +       }
>         return err == 0;
>  }
>
>  static bool
> -verify_data_blocks(struct inode *inode, struct fsverity_info *vi,
> -                  struct ahash_request *req, struct folio *data_folio,
> +verify_data_blocks(struct inode *inode, struct folio *data_folio,
>                    size_t len, size_t offset, unsigned long max_ra_pages)
>  {
> +       struct fsverity_info *vi = inode->i_verity_info;
>         const unsigned int block_size = vi->tree_params.block_size;
>         u64 pos = (u64)data_folio->index << PAGE_SHIFT;
>
> @@ -278,11 +269,14 @@ verify_data_blocks(struct inode *inode, struct fsverity_info *vi,
>                          folio_test_uptodate(data_folio)))
>                 return false;
>         do {
> -               struct page *data_page =
> -                       folio_page(data_folio, offset >> PAGE_SHIFT);
> -
> -               if (!verify_data_block(inode, vi, req, data_page, pos + offset,
> -                                      offset & ~PAGE_MASK, max_ra_pages))
> +               void *data;
> +               bool valid;
> +
> +               data = kmap_local_folio(data_folio, offset);
> +               valid = verify_data_block(inode, vi, data, pos + offset,
> +                                         max_ra_pages);
> +               kunmap_local(data);
> +               if (!valid)
>                         return false;
>                 offset += block_size;
>                 len -= block_size;
> @@ -304,19 +298,8 @@ verify_data_blocks(struct inode *inode, struct fsverity_info *vi,
>   */
>  bool fsverity_verify_blocks(struct folio *folio, size_t len, size_t offset)
>  {
> -       struct inode *inode = folio->mapping->host;
> -       struct fsverity_info *vi = inode->i_verity_info;
> -       struct ahash_request *req;
> -       bool valid;
> -
> -       /* This allocation never fails, since it's mempool-backed. */
> -       req = fsverity_alloc_hash_request(vi->tree_params.hash_alg, GFP_NOFS);
> +       return verify_data_blocks(folio->mapping->host, folio, len, offset, 0);
>
> -       valid = verify_data_blocks(inode, vi, req, folio, len, offset, 0);
> -
> -       fsverity_free_hash_request(vi->tree_params.hash_alg, req);
> -
> -       return valid;
>  }
>  EXPORT_SYMBOL_GPL(fsverity_verify_blocks);
>
> @@ -338,14 +321,9 @@ EXPORT_SYMBOL_GPL(fsverity_verify_blocks);
>  void fsverity_verify_bio(struct bio *bio)
>  {
>         struct inode *inode = bio_first_page_all(bio)->mapping->host;
> -       struct fsverity_info *vi = inode->i_verity_info;
> -       struct ahash_request *req;
>         struct folio_iter fi;
>         unsigned long max_ra_pages = 0;
>
> -       /* This allocation never fails, since it's mempool-backed. */
> -       req = fsverity_alloc_hash_request(vi->tree_params.hash_alg, GFP_NOFS);
> -
>         if (bio->bi_opf & REQ_RAHEAD) {
>                 /*
>                  * If this bio is for data readahead, then we also do readahead
> @@ -360,14 +338,12 @@ void fsverity_verify_bio(struct bio *bio)
>         }
>
>         bio_for_each_folio_all(fi, bio) {
> -               if (!verify_data_blocks(inode, vi, req, fi.folio, fi.length,
> -                                       fi.offset, max_ra_pages)) {
> +               if (!verify_data_blocks(inode, fi.folio, fi.length, fi.offset,
> +                                       max_ra_pages)) {
>                         bio->bi_status = BLK_STS_IOERR;
>                         break;
>                 }
>         }
> -
> -       fsverity_free_hash_request(vi->tree_params.hash_alg, req);
>  }
>  EXPORT_SYMBOL_GPL(fsverity_verify_bio);
>  #endif /* CONFIG_BLOCK */
>
> base-commit: f1fcbaa18b28dec10281551dfe6ed3a3ed80e3d6
> --
> 2.40.1
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
