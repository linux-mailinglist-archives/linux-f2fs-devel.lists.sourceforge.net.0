Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE7313B432
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jan 2020 22:22:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1irTeF-0006WY-Pq; Tue, 14 Jan 2020 21:22:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1irTeE-0006WQ-PF
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jan 2020 21:22:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Qyi65/d00C5NRqoV7OYo291Q8u964Yi9KA0XN65wPB0=; b=G70Mgbp4+CzGG+9qpx1tzeqo3N
 f/136VR3nDQ0x/EfX+WH7q25rfIa+//veSBMiVYt2K8lTb7KpfkWKcN+1OhMjxsdXfuszrg6C5Gwt
 NAsW6WxaCDZo+uE0CYugk3mGW1EjoWU/L3xoSqamFxf4RnxNJC/7crsGREX9PJOaP4tM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Qyi65/d00C5NRqoV7OYo291Q8u964Yi9KA0XN65wPB0=; b=TpseFohKiM3jVwA/hIyabmoepz
 VzJ4Tr5BAlnoG33Hk6ARviem9r5vvEBTN42TC7CUzX8IxdCtfmT8KkNezh4mnhImzHCnwX/v7Inlp
 5doGPsfTL6rlp37GWu/NPuft9ZHTd6WWKSi6skLA7t251ElQD6axU1ZX6OQN5zItzc3I=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1irTeD-003STn-Mt
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jan 2020 21:22:50 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CDB2324656;
 Tue, 14 Jan 2020 21:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579036964;
 bh=c8PYOB+50Kwdr59J5Dy8+ISZBBmGFo4QI2J2EjwP7yg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mtg8mLRqrHyH3Pl/BnJYWcJgbd7KdfoRejq1YKgwV7Weg3gb4Eau76XslsKhiKU3+
 eRVm56RYnH1DdThk/eD2PGOrsRvEsvwngLKIX8CekgrRW4zJ+YQ2+uFmFTLLM62c39
 rLG3pQpAu4zKMuJFpfF9w6GZjwib6hwwGIJ0uK/Q=
Date: Tue, 14 Jan 2020 13:22:42 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200114212241.GE41220@gmail.com>
References: <20191218145136.172774-1-satyat@google.com>
 <20191218145136.172774-4-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191218145136.172774-4-satyat@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.4 (/)
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
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1irTeD-003STn-Mt
Subject: Re: [f2fs-dev] [PATCH v6 3/9] block: blk-crypto for Inline
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

On Wed, Dec 18, 2019 at 06:51:30AM -0800, Satya Tangirala wrote:
> +static inline int blk_crypto_fallback_submit_bio(struct bio **bio_ptr)
> +{
> +	pr_warn_once("blk-crypto crypto API fallback disabled; failing request");
> +	(*bio_ptr)->bi_status = BLK_STS_NOTSUPP;
> +	return -EIO;
> +}

There needs to be a "\n" at the end of this log message.  Also, due to the
pr_fmt() in blk-crypto.c, this prints as:

	blk-crypto: blk-crypto crypto API fallback disabled; failing request

... so the second "blk-crypto" is redundant.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
