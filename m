Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 866B8140BDA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Jan 2020 14:58:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1isS8v-0006yM-Lt; Fri, 17 Jan 2020 13:58:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+99029fa5cb4ba764ed81+5990+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1isS8o-0006xr-AI
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jan 2020 13:58:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sA5uuJQ04YeT72bao/JNQ4IKdK/ivCsVISnYxzEFHZQ=; b=AOcScqZGnBX112J8dUoxRAivKV
 ylx1lUu0mOdcvwdO40ALKlV5rMpSc5aP9UutxlGmWOCAIA+pfFsB9CqCKouKinzghAt2zTnRpf+Ye
 R4ml5dx9kBtb3sGyjnWQCIsCNCX3ObEQvXnQCcJ0M+NOrI5vHFsBrEWJr8inzz1Kl16c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sA5uuJQ04YeT72bao/JNQ4IKdK/ivCsVISnYxzEFHZQ=; b=Vc/VLAgfkAV8N0mYKg+I3HsVT6
 +rGy4q6ydIv4ODGtBXPV6MbL8I+tBmivhcEftNlbPzOYjaQArFIueREIwYLrMC5b9t6qfsu6XX5lL
 Egq8KVVRS1xHzA+D+L4dO+h5FMVPqwoO4A6YJU3DlgK98fl8z7HhQUJmFboPrnTUcEJg=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1isS8i-008Do2-6o
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jan 2020 13:58:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sA5uuJQ04YeT72bao/JNQ4IKdK/ivCsVISnYxzEFHZQ=; b=I4YcAs1VzPP57kXD99FyxS6XW
 udZnW6lIH/c0erbsKZyO4mlV41IrhFb0FtbmGZjE2j3wvNCVBn83nZbwMpC7xMM8PkhHl4JaX38gS
 ch2fXnVCh2yaaVKgMcJV+nxYiYZHTDK2aSJqkjmlvmBrbYOh2cqYX+D3/GTMVdNWLJWYS/BKo2G7s
 AMDimyFz4NjLSsw6RsTS3KUNnVoyud1DUgZYXJX0BzlfMadoWs/+Z0TveQvoM1Rm2HxvaQ1TaPDty
 X+OSfDf0IQoL1PY6RZFwLhVmmXariSS08QBAO7KCdLRXGUOUTFSPvXq0c0Udie99E6perf4pv1X8u
 Wcg9y6Y2w==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1isS8W-0006WI-9s; Fri, 17 Jan 2020 13:58:08 +0000
Date: Fri, 17 Jan 2020 05:58:08 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200117135808.GB5670@infradead.org>
References: <20191218145136.172774-1-satyat@google.com>
 <20191218145136.172774-7-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191218145136.172774-7-satyat@google.com>
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
X-Headers-End: 1isS8i-008Do2-6o
Subject: Re: [f2fs-dev] [PATCH v6 6/9] scsi: ufs: Add inline encryption
 support to UFS
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

On Wed, Dec 18, 2019 at 06:51:33AM -0800, Satya Tangirala wrote:
> Wire up ufshcd.c with the UFS Crypto API, the block layer inline
> encryption additions and the keyslot manager.

I think this patch should be merged into the previous patch, as the
previous one isn't useful without wiring it up.

> +int ufshcd_prepare_lrbp_crypto(struct ufs_hba *hba,
> +			       struct scsi_cmnd *cmd,
> +			       struct ufshcd_lrb *lrbp)
> +{
> +	struct bio_crypt_ctx *bc;
> +
> +	if (!bio_crypt_should_process(cmd->request)) {
> +		lrbp->crypto_enable = false;
> +		return 0;
> +	}

I think this check belongs into the caller so that there is no function
call overhead for the !inline crypto case.  If you extend the
conditional
to

	if (!IS_ENABLED(CONFIG_SCSI_UFS_CRYPTO) ||
	    !bio_crypt_should_process(cmd->request))

you also don't need the stub for ufshcd_prepare_lrbp_crypto.

> +EXPORT_SYMBOL_GPL(ufshcd_prepare_lrbp_crypto);

No need to export this function.

> +	if (ufshcd_lrbp_crypto_enabled(lrbp)) {
> +#if IS_ENABLED(CONFIG_SCSI_UFS_CRYPTO)
> +		dword_0 |= UTP_REQ_DESC_CRYPTO_ENABLE_CMD;
> +		dword_0 |= lrbp->crypto_key_slot;
> +		req_desc->header.dword_1 =
> +			cpu_to_le32(lower_32_bits(lrbp->data_unit_num));
> +		req_desc->header.dword_3 =
> +			cpu_to_le32(upper_32_bits(lrbp->data_unit_num));
> +#endif /* CONFIG_SCSI_UFS_CRYPTO */

This can be a plain old ifdef without the IS_ENABLED obsfucation.

> +#if IS_ENABLED(CONFIG_SCSI_UFS_CRYPTO)
> +	lrbp->crypto_enable = false; /* No crypto operations */
> +#endif

Same here.

> +#if IS_ENABLED(CONFIG_SCSI_UFS_CRYPTO)
> +	bool crypto_enable;
> +	u8 crypto_key_slot;
> +	u64 data_unit_num;
> +#endif /* CONFIG_SCSI_UFS_CRYPTO */

.. and here.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
