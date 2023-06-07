Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 10683725EFE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Jun 2023 14:21:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6sAe-0006kP-T1;
	Wed, 07 Jun 2023 12:21:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1q6sAY-0006k1-Po
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 12:21:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7tm9nEZi8PggEiWisRdrnJZs9/69aSw6wpFxpqYOeUc=; b=Xb+PkTexhwvtDLymiSF3KYexgL
 nTpZKKBC2iFOwifrNCy/EQo8UZ+Ksp4Ww93DFObhL5IjRjJtiXe7FAEDVmZsPmJn+uixEi4l9b0Ua
 s1pnxVWzX0i6C/xo2MSInBrq4UrIyN5J91zqQW5w2nZ1UQm+s3Xg9E/IaKXPSrwO8a0I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7tm9nEZi8PggEiWisRdrnJZs9/69aSw6wpFxpqYOeUc=; b=UZRFByfX7lh2g5OumKjm+qYeeT
 NOVd5ao41rNe8oBUVMfvSPZxS8qJdLSIa4fXcG1mIcZIX7CtyyKM6pXcA4mk45wcH5ZOvHZdfZf6H
 1lhXIml8hCVoSjlcse1Nn2X/4UYruubjzy5i8eKnQHKTEB73wileUxoBKM1FKqP9kQxk=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q6sAW-0003RK-BO for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 12:21:42 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id EA6EB6732D; Wed,  7 Jun 2023 14:21:31 +0200 (CEST)
Date: Wed, 7 Jun 2023 14:21:31 +0200
From: Christoph Hellwig <hch@lst.de>
To: Hannes Reinecke <hare@suse.de>
Message-ID: <20230607122131.GB14579@lst.de>
References: <20230606073950.225178-1-hch@lst.de>
 <20230606073950.225178-9-hch@lst.de>
 <30183892-dce6-6946-2f7a-1bc693a657a2@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <30183892-dce6-6946-2f7a-1bc693a657a2@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jun 07, 2023 at 02:19:00PM +0200, Hannes Reinecke
 wrote: >> - return true; >> + return __disk_check_media_change(disk, >> +
 disk_clear_events(disk, DISK_EVENT_MEDIA_CHANGE | >> + DISK_EVENT_EJ [...]
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1q6sAW-0003RK-BO
Subject: Re: [f2fs-dev] [PATCH 08/31] block: share code between
 disk_check_media_change and disk_force_media_change
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-nvme@lists.infradead.org,
 Phillip Potter <phil@philpotter.co.uk>, Chris Mason <clm@fb.com>,
 dm-devel@redhat.com, "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Jack Wang <jinpu.wang@ionos.com>, Christoph Hellwig <hch@lst.de>,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, linux-pm@vger.kernel.org,
 linux-um@lists.infradead.org, Josef Bacik <josef@toxicpanda.com>,
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
 linux-bcache@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jens Axboe <axboe@kernel.dk>,
 Christian Brauner <brauner@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jun 07, 2023 at 02:19:00PM +0200, Hannes Reinecke wrote:
>> -	return true;
>> +	return __disk_check_media_change(disk,
>> +			disk_clear_events(disk, DISK_EVENT_MEDIA_CHANGE |
>> +						DISK_EVENT_EJECT_REQUEST));
>
> Can you move the call to disk_clear_events() out of the call to 
> __disk_check_media_change()?
> I find this pattern hard to read.

I suspect you've not done enough functional programming in your youth :)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
