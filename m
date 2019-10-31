Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EBDEB6DB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 31 Oct 2019 19:23:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iQF6R-0005gp-R4; Thu, 31 Oct 2019 18:23:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+4fa4615b85c97fbb822c+5912+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1iQF6Q-0005gi-Jf
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 31 Oct 2019 18:23:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bxpUhY/qtwNaeue6qcQlTx7BDSxYIRC42kFrjayFps0=; b=MbdDas5wE/VssNSTn7snTVV17b
 qVoZNDuOEOTb21/g9aqn0thylerFjC9jVkAsOiIHOsQm96GAB+Ahkcms2bR6O7AoQ0vBTLTsgHAX5
 bHUG2coejk9MhUvIykA4dJN79jas6mqiVOi5jMKMHHr6QhRbSUg9F6qYCb+MAhcesa2M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bxpUhY/qtwNaeue6qcQlTx7BDSxYIRC42kFrjayFps0=; b=VqbOCNpaPU6TsCgFoddSWQn56m
 9zexc4sjAD4yY70YOZIs6vwyjsmTWpeUErH77Dmvz9ZiTEY1CoXl0PVjnVc+bIwsR6CIrJqKBC7RM
 jYyJBKtB6WlBFEemAi3GmdBA4mGOZqM3iQtqVzxDuLCODj7P7UN35oMEqzQ7dAoLkf4c=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iQF6P-00Ct3j-Dk
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 31 Oct 2019 18:23:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bxpUhY/qtwNaeue6qcQlTx7BDSxYIRC42kFrjayFps0=; b=r4ujFx2c+gNY+WxneSRVK4m9w
 H0qa02Od7ZaBJosxTMd2wNBMdyNOGkMAcwWD6iZGHkr82+AiJjxoYyyr8BU5ao1JrK3GUdgbOYO2G
 7+UV3QhIfrG2GV0ezl3f2ItkPqnazxDdRNrT5lmS7aF51M1KkRx1MQSrez6mI+/8y48vtz6H5COMB
 IeGuhUxt5oLlOReFvjh+GipT8sQfL3gZEJS2ewrhIAM7GLs+jgEOHebsY2Q5aqTWGK1skLgIElgOq
 pClq7/xatxK8uqc6+copbj6jtcl7bk7qV12Qi1zBNQ7KjgIujYB9qwLKEvqvQCDgqlEtQu/yPd5wr
 fUpF2Uh6g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iQF6I-0001rc-B6; Thu, 31 Oct 2019 18:23:14 +0000
Date: Thu, 31 Oct 2019 11:23:14 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20191031182314.GD23601@infradead.org>
References: <20191028072032.6911-1-satyat@google.com>
 <20191028072032.6911-6-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191028072032.6911-6-satyat@google.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
X-Headers-End: 1iQF6P-00Ct3j-Dk
Subject: Re: [f2fs-dev] [PATCH v5 5/9] scsi: ufs: UFS crypto API
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

> +static size_t get_keysize_bytes(enum ufs_crypto_key_size size)
> +{
> +	switch (size) {
> +	case UFS_CRYPTO_KEY_SIZE_128: return 16;
> +	case UFS_CRYPTO_KEY_SIZE_192: return 24;
> +	case UFS_CRYPTO_KEY_SIZE_256: return 32;
> +	case UFS_CRYPTO_KEY_SIZE_512: return 64;
> +	default: return 0;
> +	}
> +}

Please fix the indentation and move all the returns to their own
lines.  There are various more spots that will need to be fixed
like this as well later in the patch.

> +
> +static int ufshcd_crypto_cap_find(void *hba_p,
> +			   enum blk_crypto_mode_num crypto_mode,
> +			   unsigned int data_unit_size)
> +{
> +	struct ufs_hba *hba = hba_p;

Please properly type the first argument.

> +	case UFS_CRYPTO_ALG_BITLOCKER_AES_CBC: // fallthrough

Please don't use // comments.

> +static void program_key(struct ufs_hba *hba,
> +			const union ufs_crypto_cfg_entry *cfg,
> +			int slot)

The function name needs a ufshcd prefix.

> +	wmb();
> +	for (i = 0; i < 16; i++) {
> +		ufshcd_writel(hba, le32_to_cpu(cfg->reg_val[i]),
> +			      slot_offset + i * sizeof(cfg->reg_val[0]));
> +		/* Spec says each dword in key must be written sequentially */
> +		wmb();
> +	}
> +	/* Write dword 17 */
> +	ufshcd_writel(hba, le32_to_cpu(cfg->reg_val[17]),
> +		      slot_offset + 17 * sizeof(cfg->reg_val[0]));
> +	/* Dword 16 must be written last */
> +	wmb();
> +	/* Write dword 16 */
> +	ufshcd_writel(hba, le32_to_cpu(cfg->reg_val[16]),
> +		      slot_offset + 16 * sizeof(cfg->reg_val[0]));
> +	wmb();

wmb() has no meaning for MMIO operations, something looks very fishy
here.

> +static int ufshcd_crypto_keyslot_program(void *hba_p, const u8 *key,
> +					 enum blk_crypto_mode_num crypto_mode,
> +					 unsigned int data_unit_size,
> +					 unsigned int slot)
> +{
> +	struct ufs_hba *hba = hba_p;

This is not a very type safe API.  I think the proper thing to do
would be to allocte the struct keyslot_manager in the driver (ufshcd)
as part of the containing structure (ufs_hba) and then just have
a keyslot_manager_init that initializes the field.  Then pass the
struct keyslot_manager to the methods, which can use container_of
to get the containing structure.

> +#define NUM_KEYSLOTS(hba) (hba->crypto_capabilities.config_count + 1)

Please make this an inline function.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
