Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3701014161F
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 18 Jan 2020 06:27:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1isgdz-0007JX-LV; Sat, 18 Jan 2020 05:27:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1isgdy-0007JJ-C7
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 18 Jan 2020 05:27:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kgaaQQV/8TESFr/mGWbUKrA5yBGkNgIeIfCOJ3wZtoM=; b=c/o7B/kflyewwkwVvYU1sMbv0m
 s1bcxl7xed9uXee2Ha5hSo+wL7OWO8WPmJR3ULOf7jPeJ7J0sDrhT6bNpPgkwKX7KE0bKYenaPn+O
 xsdEfP/XzP8nogOnAbLGfBT/jmZg8hPlwOMZGMrujred0MnLVBHaqet+KCc1fzLTXEwY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kgaaQQV/8TESFr/mGWbUKrA5yBGkNgIeIfCOJ3wZtoM=; b=d0bCgd/hudZS5kGZQy628Ex/70
 GvtvCX6irxUiHcA8dnhNJsyge4FYa76hHZrknruwxiaX+X+U5muL4Ux5kSk4cBdQB6hCOFakFF9Kr
 H+PugNKRGESj3ER4tPG/J75j2mgPD+qkmau27ZhoAxj4z48MU+EX8pZL4g7pmjO+xVbA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1isgdx-008wKg-64
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 18 Jan 2020 05:27:34 +0000
Received: from sol.localdomain (unknown [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7BAD820748;
 Sat, 18 Jan 2020 05:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579325246;
 bh=Su46dTvr6LjbK97+KpEmyjmd9MCvkLqGMyfTWsk56iA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MFIjHfQvc0kv0Ya/20xHIdfC6o2bof5u5eJqd9/VwJTPA9YcLj8x1k0vYihsxVLtW
 t1a4NJrrFEzd69isqDax6lXJWaafYGXjS953uoZ94rGPWCAsJxRPKpvc74B6onf6sr
 FOJFhvTtB6DdCiGovue/tD35DIjmdgbzT+VmQa00=
Date: Fri, 17 Jan 2020 21:27:20 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20200118052720.GD3290@sol.localdomain>
References: <20191218145136.172774-1-satyat@google.com>
 <20191218145136.172774-7-satyat@google.com>
 <20200117135808.GB5670@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200117135808.GB5670@infradead.org>
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
X-Headers-End: 1isgdx-008wKg-64
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
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Satya Tangirala <satyat@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jan 17, 2020 at 05:58:08AM -0800, Christoph Hellwig wrote:
> On Wed, Dec 18, 2019 at 06:51:33AM -0800, Satya Tangirala wrote:
> > Wire up ufshcd.c with the UFS Crypto API, the block layer inline
> > encryption additions and the keyslot manager.
> 
> I think this patch should be merged into the previous patch, as the
> previous one isn't useful without wiring it up.
> 

Satya actually did this originally but then one of the UFS maintainers requested
the separate patches for (1) new registers, (2) ufshcd-crypto, and (3) ufshcd.c:
https://lore.kernel.org/linux-block/SN6PR04MB49259F70346E2055C9E0F401FC310@SN6PR04MB4925.namprd04.prod.outlook.com/

So, he's not going to be able to make everyone happy :-)

I personally would be fine with either way.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
