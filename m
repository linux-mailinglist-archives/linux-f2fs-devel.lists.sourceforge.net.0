Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B8E185F34
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 15 Mar 2020 19:48:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jDYJj-0000SY-9q; Sun, 15 Mar 2020 18:48:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jDYJh-0000SL-Tf
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 15 Mar 2020 18:48:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1nljtUoh8hL/QFLNUWRSAvGfOVx2KaPLIqh+EopQFhE=; b=ZuaPIkUeKgScJromc4VChp+FAx
 wgwdAMElddyncR4nwHjHKs2phOqsy8BhrEhe3KMxIwY7ghQNWrirGYBud6wzaj6boHhi5Np9A3S8Q
 EJtNN5OO6MMYrPRW+4t7kbCM3LL6vvIheqXMpqGjkgINIjmg/s50qFLPL4MG/MXV7oGg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1nljtUoh8hL/QFLNUWRSAvGfOVx2KaPLIqh+EopQFhE=; b=QOjv/WzateBeNjs4s5QWAGsJ7e
 6jvarIxn1yz35dZe6ODFzg98RY69FSRL5IkCxi8MBsPR1Ty/U0zAu/ee0BzyLXoEHhz03JLvuegwC
 OtsvaUTR5tYJg1Bb5OnexoJgyji7KOxObmNVdqZ8R+a2XQxXCDRLy30SgiUP2S/UGELg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jDYJe-002Ikr-M3
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 15 Mar 2020 18:48:53 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C90C520575;
 Sun, 15 Mar 2020 18:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584298125;
 bh=X7eZm/83zSemhOKu22Fty0SqoIeYPuDleqyyTdJy9RU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rv4px8s9Q3eGMV1pW/kfV45LvoiySpkl8HU+8x1zdkXRGMsh0dkAMrapkwL+AjZa0
 SCV1NVVv7N51uf4WdCkuYsvSDBby9mvNHp7QTngAMszE0Dksw0qMrF7BRxtmxbSruO
 DuDVYR6iZ/JAfXTPo4wxtR52H+NmnEVYOaxhDvl4=
Date: Sun, 15 Mar 2020 11:48:43 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200315184843.GE1055@sol.localdomain>
References: <20200312080253.3667-1-satyat@google.com>
 <20200312080253.3667-8-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200312080253.3667-8-satyat@google.com>
X-Spam-Score: -0.2 (/)
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
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jDYJe-002Ikr-M3
Subject: Re: [f2fs-dev] [PATCH v8 07/11] scsi: ufs: Add inline encryption
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
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Mar 12, 2020 at 01:02:49AM -0700, Satya Tangirala wrote:
> @@ -2470,6 +2504,9 @@ static int ufshcd_compose_dev_cmd(struct ufs_hba *hba,
>  	lrbp->task_tag = tag;
>  	lrbp->lun = 0; /* device management cmd is not specific to any LUN */
>  	lrbp->intr_cmd = true; /* No interrupt aggregation */
> +#ifdef CONFIG_SCSI_UFS_CRYPTO
> +	lrbp->crypto_enable = false; /* No crypto operations */
> +#endif
>  	hba->dev_cmd.type = cmd_type;

Doesn't this need to be initialized in ufshcd_issue_devman_upiu_cmd() too?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
