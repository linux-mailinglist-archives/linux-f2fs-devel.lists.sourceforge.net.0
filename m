Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8871415BD
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 18 Jan 2020 04:58:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1isfFg-0000z3-7I; Sat, 18 Jan 2020 03:58:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1isfFf-0000yw-BX
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 18 Jan 2020 03:58:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JVuaWk+zE49cK4C2PHOV1FuvvmYT1Xhen+8lOZf+Vug=; b=Z6saCQSnfscG4RRf4fAI9ZAhGz
 uhQTXsUOjK1R6gHe/bAUvi3gGwynf2F58k87Oj3Kvo88uh+Fr6ZJnmjHyJkxB+ysUntimzkKoZy92
 gKuroWhXmnBF8ir7b+eGQJG+0CQsjN3JQq9v0KjGHrzy7Ce9ZYXTt4zLk0i6chIwOrZ4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JVuaWk+zE49cK4C2PHOV1FuvvmYT1Xhen+8lOZf+Vug=; b=hcLq4fLu6WX25S8p0BwoeujWUY
 HQilAcZb797VmaAkTC5yl1Lh7aq/d/VtK8TJhQ96W2kQcMDXZZFFRFwL7fRR0O7Uo9gYhQU795Ih9
 uEoq68cYPEowN/UNxDn8JyxepnK918tOwdoABA83jslTPKNwUbH0/0si0vKPiiDmd1j8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1isfFZ-008uJ0-CA
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 18 Jan 2020 03:58:23 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9F7692072B;
 Sat, 18 Jan 2020 03:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579319886;
 bh=fMspsEvLC7cRCvV8B4hOYJXyJHVbjKq9MkwOe9RNS4k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TnxD89jX+A4F+MemC8PvzvH8szJ6VL6+/uBi5T16UDReENGERBpSDN7a4kjx+E1eX
 cNj7fjEnqTNslHlJaPEMJ4xo53Q/x5VT12ZdeiVe2d6n4pnlZqr4jt6YgE9iKY5WO1
 i7dUiZ7v3ogjEopxskFYuSoBWzJxwZhI1s19PDng=
Date: Fri, 17 Jan 2020 19:58:05 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200118035805.GA3290@sol.localdomain>
References: <20191218145136.172774-1-satyat@google.com>
 <20191218145136.172774-7-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191218145136.172774-7-satyat@google.com>
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
X-Headers-End: 1isfFZ-008uJ0-CA
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
> @@ -4654,6 +4686,8 @@ static int ufshcd_slave_configure(struct scsi_device *sdev)
>  	if (ufshcd_is_rpm_autosuspend_allowed(hba))
>  		sdev->rpm_autosuspend = 1;
>  
> +	ufshcd_crypto_setup_rq_keyslot_manager(hba, q);
> +
>  	return 0;
>  }
>  
> @@ -4664,6 +4698,7 @@ static int ufshcd_slave_configure(struct scsi_device *sdev)
>  static void ufshcd_slave_destroy(struct scsi_device *sdev)
>  {
>  	struct ufs_hba *hba;
> +	struct request_queue *q = sdev->request_queue;
>  
>  	hba = shost_priv(sdev->host);
>  	/* Drop the reference as it won't be needed anymore */
> @@ -4674,6 +4709,8 @@ static void ufshcd_slave_destroy(struct scsi_device *sdev)
>  		hba->sdev_ufs_device = NULL;
>  		spin_unlock_irqrestore(hba->host->host_lock, flags);
>  	}
> +
> +	ufshcd_crypto_destroy_rq_keyslot_manager(hba, q);
>  }

Just noticed this --- this is still destroying the keyslot manager when a SCSI
device is destroyed.  The keyslot manager is associated with the host controller
(which might control multiple devices), so it must not be destroyed until the
ufs_hba is destroyed, i.e. in ufshcd_dealloc_host().

(I was also thinking about whether we could use devm so that the keyslot_manager
doesn't need to be explicitly freed.  But that wouldn't actually help because we
still need to ensure that all the crypto keys get zeroed.)

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
