Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BFE17263B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Feb 2020 19:14:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j7Nfz-0008CY-HJ; Thu, 27 Feb 2020 18:14:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1j7Nfx-0008CR-Tg
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Feb 2020 18:14:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qxeohmUcwpwsnIr8sHlzjR3GNnNKdFee7m8sNWo7zJQ=; b=M30L5xqofH8vqY+LacACKT9S66
 6QxbadDvrCjenFRmDrU2WDbf6qH7ADMuYZzOyDwRDrsmc7m13NAoMXi6o6Moswf9awpD7I4utBOmq
 yy9pn1KTue1a4tFKlo85tjIY9CYthSFf+LGfbUujQQlz2hC3VemzcugnWd54xhI/OOrU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qxeohmUcwpwsnIr8sHlzjR3GNnNKdFee7m8sNWo7zJQ=; b=gOEjChyZnivCVtExSVXlb0cEt5
 JrIN/N1bPqcKXQYd6p77O2Lhu+E2hyyv84cuUcyTFmUM3MxxMjSuNm6p5m1J1fPTt+AFpmpOnM9w6
 WgOPdb3joEcOA29weDorzNHubtKd5qxxPrgqj0geDqnhmOd+a6JKX9Kr20z+MbmVVZmA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j7Nfv-000lQE-Nh
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Feb 2020 18:14:21 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 02F29246B0;
 Thu, 27 Feb 2020 18:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582827253;
 bh=DfvmaQgMZxcqfEpHuvrrlNTCaevj5uxdnW4bw4l/cwQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sT4dmVR9UsPbGMcknWI3bgOsjSvrPsgtUAmdt1lWngGDPvi6tYTXfp8zAlivAVVGE
 Nodjsd6dayZE3c3DVdI5DxqXH1cs4fq2TQNuuy1ir3hHqyCE3C9nGSpbDbR7iyczgy
 thWQWFpyhElDDeVDwp9+De4JDQO1/TZDUfWsjIts=
Date: Thu, 27 Feb 2020 10:14:11 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20200227181411.GB877@sol.localdomain>
References: <20200221115050.238976-1-satyat@google.com>
 <20200221115050.238976-2-satyat@google.com>
 <20200221170434.GA438@infradead.org>
 <20200221173118.GA30670@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221173118.GA30670@infradead.org>
X-Spam-Score: -0.1 (/)
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
X-Headers-End: 1j7Nfv-000lQE-Nh
Subject: Re: [f2fs-dev] [PATCH v7 1/9] block: Keyslot Manager for Inline
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
Cc: linux-ext4@vger.kernel.org, linux-scsi@vger.kernel.org,
 Kim Boojin <boojin.kim@samsung.com>, Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Satya Tangirala <satyat@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Feb 21, 2020 at 09:31:18AM -0800, Christoph Hellwig wrote:
> On Fri, Feb 21, 2020 at 09:04:34AM -0800, Christoph Hellwig wrote:
> > Given that blk_ksm_get_slot_for_key returns a signed keyslot that
> > can return errors, and the only callers stores it in a signed variable
> > I think this function should take a signed slot as well, and the check
> > for a non-negative slot should be moved here from the only caller.
> 
> Actually looking over the code again I think it might be better to
> return only the error code (and that might actually be a blk_status_t),
> and then use an argument to return a pointer to the actual struct
> keyslot.  That gives us much easier to understand code and better
> type safety.

That doesn't make sense because the caller only cares about the keyslot number,
not the 'struct keyslot'.  The 'struct keyslot' is internal to
keyslot-manager.c, as it only contains keyslot management information.

Your earlier suggestion of making blk_ksm_put_slot() be a no-op on a negative
keyslot number sounds fine though.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
