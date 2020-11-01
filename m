Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C98802A1D51
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  1 Nov 2020 11:31:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kZAeL-0000Hv-BH; Sun, 01 Nov 2020 10:31:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gregkh@linuxfoundation.org>) id 1kZAeJ-0000Hn-HN
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 01 Nov 2020 10:31:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pIh+Jzk7nS3IwPNqWjOiFM1v1dCnHmLnLd2APKudKlw=; b=aPLCvxOICcrxM2q/qisNhKsg2a
 +dmXFhTp0pgZ79kfpGN7wXXvs2drHDv/PYiAY8rVGcPron61I+nYO2uWvQmhcRHnYl6hFtS2Oc2p4
 la8f4wD00+CaVx7XVX1eNSx4CXOKKGoW1AJHP85ilZR5ZXOcZrucs008ATart+m7Knqk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pIh+Jzk7nS3IwPNqWjOiFM1v1dCnHmLnLd2APKudKlw=; b=HM3bIdpMIIHYwmc6OSQPIY5Rzu
 Ilt5Q6FfQFD/0oMjwThLoLYNKJ2go5IlY9U0wDqnUuunROGJ8BkR/QZnXVlj5Wn3mXzoqRtrVB9sd
 q3+zYK8BmIux9hTbTAv9tU8G7YMhWWktmoumL2lzAmOFJ6E6nuDxS13cHn8MMUmr+SLs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kZAeE-0053ZG-4b
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 01 Nov 2020 10:31:47 +0000
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E5EA320709;
 Sun,  1 Nov 2020 10:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604226689;
 bh=DPX6AqOeUcQoNkcotTpifBY//U9/BpeCO3qRgX3yETM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HSPlMPRnh6lZBTO0HHm1VH7uN3qQbhGx6+ZMKKu29QmsNqP0+U2jn3ArQzYfa8bqp
 3/BahxDNmZ8gLeU+N6HWEbUn/ZPpjlK/RBpgOk+GHAzBsvgO3eodF/Nd5/TITb/Rcf
 VDl22aIO+2YZRBk7JDddg9drkKagJEhxScR00uHQ=
Date: Sun, 1 Nov 2020 11:32:13 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20201101103213.GC2558892@kroah.com>
References: <20201031231124.1199710-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201031231124.1199710-1-ebiggers@kernel.org>
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kZAeE-0053ZG-4b
Subject: Re: [f2fs-dev] [PATCH 4.9 0/2] backport some more fscrypt fixes to
 4.9
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
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Oct 31, 2020 at 04:11:22PM -0700, Eric Biggers wrote:
> Backport some fscrypt fixes from 4.10 and 4.11 to 4.9-stable.
> These will be needed for xfstest generic/395 to pass if
> https://lkml.kernel.org/fstests/20201031054018.695314-1-ebiggers@kernel.org
> is applied.
> 
> These are clean cherry picks.
> 
> Tested with 'kvm-xfstests -c ext4,f2fs -g encrypt'.
> 
> Eric Biggers (2):
>   fscrypto: move ioctl processing more fully into common code
>   fscrypt: use EEXIST when file already uses different policy

All now queued up, thanks.

greg k-h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
