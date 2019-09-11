Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A126DB01F0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Sep 2019 18:45:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i85kN-0007wi-Nj; Wed, 11 Sep 2019 16:45:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <rgoldwyn@suse.de>) id 1i85kL-0007wU-Mh
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Sep 2019 16:45:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BzvFRCU9Noapa7DSzP2levHpmPRmxOIQhOYcKQDvUf8=; b=MfUOYMRlwSJsoahiEjVCBODTlr
 wiDyjBzc6/dlXDNG+2HkoOa2mdooVhUuKXGAlXO4xkkJ2IAjg19Pdt3/mh+7t00uM2J7MOiMpbfko
 d8uBwIyX1eqPQiI0J676/pKWCh7yZHoKjNWattw48cT3baVfEdChIinDBn+GyMtEmBtM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BzvFRCU9Noapa7DSzP2levHpmPRmxOIQhOYcKQDvUf8=; b=Qnmt4BaoVfQ3/HEMKKV9gmGh4b
 GuIHypwWEQV6vH7S3jnBN/lPrBomnd9pjaVx1dHZbOJGN/jpm6K2C/AJxRm5oPI4333TroTD+xghf
 /xYy05GZ92fbDEGeyG4ulPrMKYJIctbrEE9UPhmR9q+ehBTEo4JjB7Eu6h4lNSPOdoAA=;
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i85kJ-00026M-MR
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Sep 2019 16:45:33 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9FA22AF81;
 Wed, 11 Sep 2019 16:45:24 +0000 (UTC)
From: Goldwyn Rodrigues <rgoldwyn@suse.de>
To: linux-fsdevel@vger.kernel.org
Date: Wed, 11 Sep 2019 11:45:14 -0500
Message-Id: <20190911164517.16130-1-rgoldwyn@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190911093926.pfkkx25mffzeuo32@alap3.anarazel.de>
References: <20190911093926.pfkkx25mffzeuo32@alap3.anarazel.de>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1i85kJ-00026M-MR
Subject: [f2fs-dev] Fix inode sem regression for nowait
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
Cc: david@fromorbit.com, linux-f2fs-devel@lists.sourceforge.net,
 hch@infradead.org, linux-ext4@vger.kernel.org, andres@anarazel.de,
 linux-btrfs@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This changes the way we acquire the inode semaphore when
the I/O is marked with IOCB_NOWAIT. The regression was discovered
in AIM7 and later by Andres in ext4. This has been fixed in
XFS by 942491c9e6d6 ("xfs: fix AIM7 regression")

I realized f2fs and btrfs also have the same code and need to
be updated.

Regards,

-- 
Goldwyn



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
