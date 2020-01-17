Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2931405D1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Jan 2020 10:10:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1isNe1-00027Y-3B; Fri, 17 Jan 2020 09:10:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+99029fa5cb4ba764ed81+5990+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1isNdt-00027C-34
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jan 2020 09:10:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f4eyNM5fsPgOOY4QDJvW14GgucAlbHSYncJzegpCbtU=; b=jC5EOq8TKGcDjIPPYQ4VbC+OxD
 R08Lb/CP75gq6BIkHimlMomvHgtEK04HZXDjxWP/1JiqM89FpcnHiWVqeVFKj2QHMBvY9H/FdIT34
 0A+6FIdK3L/JkmcpOgSmGBYUp4S2hWpqvreMjlY0wtWD9pevb59uI70ZsjU0o6QYtgcA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f4eyNM5fsPgOOY4QDJvW14GgucAlbHSYncJzegpCbtU=; b=i6A2kBAjv51zJqjMkfJyXKXLV4
 kAM1otDhz6hOgqh2fciWPhRZZYzmzhz1uQU6aNggMVdFfvEYY1Vq5/yNd3Fgfl3DG5AURF0I4AWCb
 lkDS0MdwWl53OEdk9GwTmA5NkM/9sBvYsAccDMF/E/6WdC1gAN2QKjnVQzYkhoCY1KS4=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1isNdr-00AyOI-Tk
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jan 2020 09:10:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f4eyNM5fsPgOOY4QDJvW14GgucAlbHSYncJzegpCbtU=; b=EasjWtx2ZDM+Vic8u4b0zIX56
 mL1kdrcaoohx/ZphkqoevRgkROCelukaVUG0z2PgOf1kJkebHCUXalqhwMvPwO4R9Dde4gRQRzOpe
 jGF6+08wzTpDW08filohfCVQ+Mb2lcni59HDk7+VkXWEsvgwCPLThQsChIV0FtcvJMzoKPK3mcWnH
 CjMo8SfFoenOpYZMgKmgFXPs9ncIBe2waxEuTDh0nxofAaKW019ZOhz2iALgWJpJRpX/vHUy9Ba9j
 7dmeV1cQtQps2ZSj4ZpLzcDwaqwJkIvP8yDzIQ6SkBM99dW3GiYh90bWNI4tbW05C+dyN00uMXo//
 laBgfaXwQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1isNdi-00031J-Oo; Fri, 17 Jan 2020 09:10:02 +0000
Date: Fri, 17 Jan 2020 01:10:02 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200117091002.GA15396@infradead.org>
References: <20191218145136.172774-1-satyat@google.com>
 <20191218145136.172774-2-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191218145136.172774-2-satyat@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1isNdr-00AyOI-Tk
Subject: Re: [f2fs-dev] [PATCH v6 1/9] block: Keyslot Manager for Inline
 Encryption
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
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> +struct keyslot_manager {
> +	unsigned int num_slots;
> +	struct keyslot_mgmt_ll_ops ksm_ll_ops;
> +	unsigned int crypto_mode_supported[BLK_ENCRYPTION_MODE_MAX];
> +	void *ll_priv_data;
> +
> +	/* Protects programming and evicting keys from the device */
> +	struct rw_semaphore lock;
> +
> +	/* List of idle slots, with least recently used slot at front */
> +	wait_queue_head_t idle_slots_wait_queue;
> +	struct list_head idle_slots;
> +	spinlock_t idle_slots_lock;
> +
> +	/*
> +	 * Hash table which maps key hashes to keyslots, so that we can find a
> +	 * key's keyslot in O(1) time rather than O(num_slots).  Protected by
> +	 * 'lock'.  A cryptographic hash function is used so that timing attacks
> +	 * can't leak information about the raw keys.
> +	 */
> +	struct hlist_head *slot_hashtable;
> +	unsigned int slot_hashtable_size;
> +
> +	/* Per-keyslot data */
> +	struct keyslot slots[];
> +};

Is there a rationale for making this structure private?  If it was
exposed we could embedd it into the containing structure (although
the slots would need a dynamic allocation), and instead of the
keyslot_manager_private helper, the caller could simply use
container_of.

> +struct keyslot_manager *keyslot_manager_create(unsigned int num_slots,
> +	const struct keyslot_mgmt_ll_ops *ksm_ll_ops,
> +	const unsigned int crypto_mode_supported[BLK_ENCRYPTION_MODE_MAX],
> +	void *ll_priv_data)

.. and then the caller could simply set the ops and the supported modes
array directly in the structure, simplifying the interface even further.

> +static int find_keyslot(struct keyslot_manager *ksm,
> +			const struct blk_crypto_key *key)
> +{
> +	const struct hlist_head *head = hash_bucket_for_key(ksm, key);
> +	const struct keyslot *slotp;
> +
> +	hlist_for_each_entry(slotp, head, hash_node) {
> +		if (slotp->key.hash == key->hash &&
> +		    slotp->key.crypto_mode == key->crypto_mode &&
> +		    slotp->key.data_unit_size == key->data_unit_size &&
> +		    !crypto_memneq(slotp->key.raw, key->raw, key->size))
> +			return slotp - ksm->slots;
> +	}
> +	return -ENOKEY;
> +}

I'd return the actual slot pointer here, as that seems the more natural
fit.  Then factor the pointer arithmetics into a little helper to make
it obvious for those few places that need the actual slot number.

Also can you add proper subsystem prefix to the various symbol names?

> +void keyslot_manager_get_slot(struct keyslot_manager *ksm, unsigned int slot)
> +{
> +	if (WARN_ON(slot >= ksm->num_slots))
> +		return;
> +
> +	WARN_ON(atomic_inc_return(&ksm->slots[slot].slot_refs) < 2);
> +}
> +
> +/**
> + * keyslot_manager_put_slot() - Release a reference to a slot
> + * @ksm: The keyslot manager to release the reference from.
> + * @slot: The slot to release the reference from.
> + *
> + * Context: Any context.
> + */
> +void keyslot_manager_put_slot(struct keyslot_manager *ksm, unsigned int slot)
> +{
> +	unsigned long flags;
> +
> +	if (WARN_ON(slot >= ksm->num_slots))
> +		return;
> +
> +	if (atomic_dec_and_lock_irqsave(&ksm->slots[slot].slot_refs,
> +					&ksm->idle_slots_lock, flags)) {
> +		list_add_tail(&ksm->slots[slot].idle_slot_node,
> +			      &ksm->idle_slots);
> +		spin_unlock_irqrestore(&ksm->idle_slots_lock, flags);
> +		wake_up(&ksm->idle_slots_wait_queue);
> +	}
> +}

How about passing the bio_crypt_ctx structure instead of the not very
nicely typed slot index?  Also if we merge the files both these helpers
should probably just go away and me merged into the 1 or 2 callers that
exist.

> +#ifdef CONFIG_BLK_INLINE_ENCRYPTION
> +
> +#define BLK_CRYPTO_MAX_KEY_SIZE		64
> +
> +/**
> + * struct blk_crypto_key - an inline encryption key
> + * @crypto_mode: encryption algorithm this key is for
> + * @data_unit_size: the data unit size for all encryption/decryptions with this
> + *	key.  This is the size in bytes of each individual plaintext and
> + *	ciphertext.  This is always a power of 2.  It might be e.g. the
> + *	filesystem block size or the disk sector size.
> + * @data_unit_size_bits: log2 of data_unit_size
> + * @size: size of this key in bytes (determined by @crypto_mode)
> + * @hash: hash of this key, for keyslot manager use only
> + * @raw: the raw bytes of this key.  Only the first @size bytes are used.
> + *
> + * A blk_crypto_key is immutable once created, and many bios can reference it at
> + * the same time.  It must not be freed until all bios using it have completed.
> + */
> +struct blk_crypto_key {
> +	enum blk_crypto_mode_num crypto_mode;
> +	unsigned int data_unit_size;
> +	unsigned int data_unit_size_bits;
> +	unsigned int size;
> +	unsigned int hash;
> +	u8 raw[BLK_CRYPTO_MAX_KEY_SIZE];
> +};
> +
> +#endif /* CONFIG_BLK_INLINE_ENCRYPTION */
> +#endif /* CONFIG_BLOCK */

I don't think we need any ifdefs around these declarations.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
