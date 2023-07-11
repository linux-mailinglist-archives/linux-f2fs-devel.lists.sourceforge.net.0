Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B77F74E72E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Jul 2023 08:23:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qJ6lt-0008K2-Fj;
	Tue, 11 Jul 2023 06:22:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1qJ6ls-0008Js-DU
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Jul 2023 06:22:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZAUpIY6qxIrTLVPWLTnGpEnNPIpSP4rGvdGOgIhW6EQ=; b=Aq6AV85qBbLxqShpgTPPLrdsA1
 mdPIc6mJkC4EhpC3jKaiip0LDHCrlDhEmpUNZtjUSVCo0vggutz/wdcAF/uenE4IwiPJ+mVCpH7Au
 6lJe5+3Hfu2+JRpp9OuMN19u3PIJ1EsFrOAaf4uVcTkiDbnzJA2LR7V/1tgdzkvOfNXM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZAUpIY6qxIrTLVPWLTnGpEnNPIpSP4rGvdGOgIhW6EQ=; b=ErKfhry6EqAazrESVEoUMp8a1U
 NcHxQa8auhzgALIzWQIDuDtgm0HtC7r2eZ3ZplmFqgotZyB8ItvIauFUWPRb5VhYBNavRnlrv/thS
 E4JT2dnuLADGqcaTkkrw2yQSpFgpLe+4rGrW1XlZKchr+VGa3+S7kji78mHCNTb8pR1w=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qJ6lq-000459-OQ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Jul 2023 06:22:46 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6E6D66732D; Tue, 11 Jul 2023 08:22:33 +0200 (CEST)
Date: Tue, 11 Jul 2023 08:22:33 +0200
From: Christoph Hellwig <hch@lst.de>
To: Hannes Reinecke <hare@suse.de>
Message-ID: <20230711062233.GB20392@lst.de>
References: <20230707094028.107898-1-hch@lst.de> <ZKx2jVONy35B0/S1@google.com>
 <20230711050101.GA19128@lst.de>
 <63766a54-54db-20a7-ba2f-d31fd230623d@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <63766a54-54db-20a7-ba2f-d31fd230623d@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jul 11, 2023 at 08:19:50AM +0200, Hannes Reinecke
 wrote: >> for (i = 0; i < sbi->s_ndevs; i++) { >> - blkdev_put(FDEV(i).bdev,
 sbi->sb->s_type); >> + if (i > 0) >> + blkdev_put(FDEV(i).bdev, s [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qJ6lq-000459-OQ
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't reopen the main block device in
 f2fs_scan_devices
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
Cc: linux-block@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jul 11, 2023 at 08:19:50AM +0200, Hannes Reinecke wrote:
>>     	for (i = 0; i < sbi->s_ndevs; i++) {
>> -		blkdev_put(FDEV(i).bdev, sbi->sb->s_type);
>> +		if (i > 0)
>> +			blkdev_put(FDEV(i).bdev, sbi->sb->s_type);
> You could have started the loop at '1', and avoid the curious 'if' clause 

That's what the previous version did, which caused a NULL pointer
dereference discussed in this thread, as well as a compile error for
non-zoned builds..



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
