Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 993DB1D1C4C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 May 2020 19:30:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jYvDP-000503-W2; Wed, 13 May 2020 17:30:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jYvDO-0004zq-OV
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 May 2020 17:30:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZuVxEm+NQlsxpAV2s2+CKL6etbdXqLXWk5qIn58yMH8=; b=WIQPA93I0qDJSqpnpymL5Z7uPF
 DzPxyjsmFj9BSe0Iw8OBtj8DtiwiGLN2/iGHqDKQ8p5g0x52gIr4+KnRfx9+LdUrIaEyhWFpqSeDV
 4JdOKCD7PpBjI5MBalye0+AvR7DSOvVIJfmG7ZTl9DLtKvjpqSmqj/XXleYwfjAKG8qo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZuVxEm+NQlsxpAV2s2+CKL6etbdXqLXWk5qIn58yMH8=; b=A/tbZFw7p12Dfo0GNgECRkN1R9
 mHxFQHWvdFVqHrokbbFYgjTlwV9QTvCsXFDiBmVw8XjEBsW4GlK37erYAjeakPIVXp6IusLvdVEM/
 PzkQytVk5CFhWYQjx/eegZzTzePijSSZXQd1uVX0oy+iIaQKBpwbT+73xdg0+XLx5D4M=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jYvDM-00EB1o-Qa
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 May 2020 17:30:42 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 98B3E2053B;
 Wed, 13 May 2020 17:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589391028;
 bh=DUxmL2DW8AGAbEDV0E3S6D4sSXQdPvCUpnXQhcWR/Ds=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Uwum2c3QVIrZZTK8102bH9IE8j/ppIJPr2jA9iSaVCnTI6vRkvuPK9CWKzh9OSW+Q
 Ja2aYpKfBVoClFrP15T4+vEHspb8GhNnlHfFc/vYHCvXEiydgTWIMXyI/Y6q/kX4zP
 6Z93+gkKt1WwCVYlW1zTdXo49pvlmgsdvZKt7itM=
Date: Wed, 13 May 2020 10:30:26 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200513173026.GD1243@sol.localdomain>
References: <20200430115959.238073-1-satyat@google.com>
 <20200430115959.238073-5-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200430115959.238073-5-satyat@google.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jYvDM-00EB1o-Qa
Subject: Re: [f2fs-dev] [PATCH v12 04/12] block: Make blk-integrity preclude
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

On Thu, Apr 30, 2020 at 11:59:51AM +0000, Satya Tangirala wrote:
> Whenever a device supports blk-integrity, make the kernel pretend that
> the device doesn't support inline encryption (essentially by setting the
> keyslot manager in the request queue to NULL).
> 
> There's no hardware currently that supports both integrity and inline
> encryption. However, it seems possible that there will be such hardware
> in the near future (like the NVMe key per I/O support that might support
> both inline encryption and PI).
> 
> But properly integrating both features is not trivial, and without
> real hardware that implements both, it is difficult to tell if it will
> be done correctly by the majority of hardware that support both.
> So it seems best not to support both features together right now, and
> to decide what to do at probe time.
> 
> Signed-off-by: Satya Tangirala <satyat@google.com>

Looks good, you can add:

    Reviewed-by: Eric Biggers <ebiggers@google.com>

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
