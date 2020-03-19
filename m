Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 596BD18B208
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Mar 2020 12:05:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jEsz5-0003hO-Um; Thu, 19 Mar 2020 11:05:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+061b0704d8249feb4593+6052+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1jEsz3-0003hA-Q1
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Mar 2020 11:05:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z8k5rxxuWJeifREgQU7npm0AxV0O+HvW6zpGtvds6oI=; b=TqRe6r6x5wLD26HhgYfHBg1lUP
 Mv/5mx/O2VdFafWLwVkGZQwFwYY+nDbc9/GYtqYxhRCmTq6TfFdu5VxtohtduU5ZigLVaYpm5pA7K
 1n5ix3DAOmuCqmzz5FYXh0WOuzYrsqXPXR84H6/qW8KgC8QX+qi2jjFkUgAEHcwbktNg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Z8k5rxxuWJeifREgQU7npm0AxV0O+HvW6zpGtvds6oI=; b=CPrMJudatLbSvYdRyRPpbzg3cj
 YGGSh3d8ecslk5n+CQzhmGtON/WV8ZHUedzThYxWyO+ARj8h406L9UHpnVtmSV0SOIVv9KaOs9Ifb
 xy7RqiqMOobeyEt5NtVqoXHLGfsBf3+YErPwbpC5pSs/SEfHLoOd2sPCD4v65PDO/3c4=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jEsz0-00E4j5-6H
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Mar 2020 11:05:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Z8k5rxxuWJeifREgQU7npm0AxV0O+HvW6zpGtvds6oI=; b=h22azbs6kOrxgCeM2CER1MvB/F
 nzVY1oKsfJNndoqnTYxXjLohFNHtF/549gKeKID2vhuuA8lSt2dcyRkbX5EBjajghlihjYaP5n6fK
 5IkOMlFMNHaEnLF95CW0+s81grvKSTu/KGoPLajsfB6zB0IbgLAd+wFYUq+/fT+R4GD4GOyROFBxS
 zOPEXB4pMkv4HDMRRfapcGp9lQmencPDW2201XRwlxAK0V2l+CJe3cnriFSBHoidGjPcls3090U7R
 GJyP2/+y4iy1LuvGqWTpiMrAm/CtyYE3dqT+yLXX5o2858rAVGYP3DDDV3QwJ39c+SfchouVOj3Aj
 OvOuBEFQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jEsyu-0004gA-Es; Thu, 19 Mar 2020 11:04:56 +0000
Date: Thu, 19 Mar 2020 04:04:56 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200319110456.GB20097@infradead.org>
References: <20200312080253.3667-1-satyat@google.com>
 <20200312080253.3667-4-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200312080253.3667-4-satyat@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jEsz0-00E4j5-6H
Subject: Re: [f2fs-dev] [PATCH v8 03/11] block: Make blk-integrity preclude
 hardware inline encryption
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
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Mar 12, 2020 at 01:02:45AM -0700, Satya Tangirala wrote:
> There's no hardware currently that supports both integrity and inline
> encryption. However, it seems possible that there will be in the near
> future, based on discussion at
> https://lore.kernel.org/r/20200108140730.GC2896@infradead.org/
> But properly integrating both features is not trivial, and without
> real hardware that implements both, it is difficult to tell if it will
> be done correctly by the majority of hardware that support both, and
> through discussions at
> https://lore.kernel.org/r/20200224233459.GA30288@infradead.org/
> it seems best not to support both features together right now, and
> to decide what to do at probe time.

Please don't reference web links, just inline the important information.

> diff --git a/block/bio-integrity.c b/block/bio-integrity.c
> index bf62c25cde8f..a5c57991c6fa 100644
> --- a/block/bio-integrity.c
> +++ b/block/bio-integrity.c
> @@ -42,6 +42,11 @@ struct bio_integrity_payload *bio_integrity_alloc(struct bio *bio,
>  	struct bio_set *bs = bio->bi_pool;
>  	unsigned inline_vecs;
>  
> +	if (bio_has_crypt_ctx(bio)) {
> +		pr_warn("blk-integrity can't be used together with inline en/decryption.");
> +		return ERR_PTR(-EOPNOTSUPP);
> +	}

This is a hard error and should just be a WARN_ON_ONCE.

I'm also not sure we need the register time warnings at all.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
