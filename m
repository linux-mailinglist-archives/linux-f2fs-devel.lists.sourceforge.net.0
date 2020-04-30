Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7D41C0386
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Apr 2020 19:04:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jUCbj-0005rR-6W; Thu, 30 Apr 2020 17:04:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jUCbi-0005rI-Bv
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Apr 2020 17:04:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8jT+oAhzMuJqAne7dFVfnXp+ioB7bZEr1dniZjoj8qs=; b=H/dye7OmgE2WbTxdy/pMHmM5sx
 rUsOCDlWtQJthhjKytKReb9+24AG8zAILEe+gj3sK6T8r6MyiaQH9tM4bCgDQupV/ZAZ/lBTC+gun
 4SXMih+MuvDoUVryE3UXz8FHHQ8zj7GAPoQ9/1bu/c9El2AnmAbo1zpWrIeP6XxhIhqc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8jT+oAhzMuJqAne7dFVfnXp+ioB7bZEr1dniZjoj8qs=; b=Ekn0Rjp1b3tyVeoh2twBshDWd+
 GXpnCUHNPXjzTpAEH6szVTyJDUVWk+VTlXgQTUmmijQDuEWkx+vhZVxV6m3oX2oggdLXI06hP2nLz
 FKj7NQ5kBbj7cZ6jXqXCoXP5qziGq++3Bh9KG+MlGOCd+7ZYPuAdnOwkhVgdxVS0zKoA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jUCbh-00HUnR-Cr
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Apr 2020 17:04:18 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 76FDC20787;
 Thu, 30 Apr 2020 17:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588266251;
 bh=p3PY8v4K9MXDL2QVIbKch9hnHXPDV5bO+Bl4Z5ompNM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ofvd7GuJV37V4vJOvUKnWq4C/v1xbd3mvDBxUw04u6XfgRrJHLihJ0khXJpzsYWJi
 42MtVUtsO8njIXQJ+P2HBeIv9z+8wKQu4dFy5SmhhU7L7TKGpapze5VAxJq/l2mj2u
 wzpYGjYJmtlYiphZ0ZzWlzBBFWVL9FLJT4lb9OkY=
Date: Thu, 30 Apr 2020 10:04:08 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200430170408.GB1003@sol.localdomain>
References: <20200430115959.238073-1-satyat@google.com>
 <20200430115959.238073-11-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200430115959.238073-11-satyat@google.com>
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
X-Headers-End: 1jUCbh-00HUnR-Cr
Subject: Re: [f2fs-dev] [PATCH v12 10/12] fscrypt: add inline encryption
 support
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

On Thu, Apr 30, 2020 at 11:59:57AM +0000, Satya Tangirala wrote:
> +bool __fscrypt_inode_uses_inline_crypto(const struct inode *inode)
> +{
> +	return inode->i_crypt_info->ci_inlinecrypt;
> +}
> +EXPORT_SYMBOL_GPL(fscrypt_inode_uses_inline_crypto);

Right, this still needs to be exported (I missed that in the diff I suggested).
But the export needs to be fixed to use the double-underscore name.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
